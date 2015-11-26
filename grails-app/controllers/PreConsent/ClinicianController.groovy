package PreConsent

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ClinicianController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ClinicianController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def filterPaneService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clinician.list(params), model: [clinicianInstanceCount: Clinician.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Clinician.list(params), model: [clinicianInstanceCount: Clinician.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clinicianInstanceList: Clinician.list(params), clinicianInstanceTotal: Clinician.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ clinicianInstanceList: filterPaneService.filter( params, Clinician ),
                                     clinicianInstanceTotal: filterPaneService.count( params, Clinician ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Clinician clinicianInstance) {
        respond clinicianInstance
    }

    def create() {
        respond new Clinician(params)
    }

    def findPerson() {
        def searchPerson= params.searchPerson

        def listPerson = Person.where{
            nhsNumber == searchPerson || mrnNumber == searchPerson || surname == searchPerson || familyIdentifier == searchPerson
        }.findAll()

        listPerson = listPerson.findAll {p ->
            Consent.list().every {r -> r.person.id == p.id}}

        if (!listPerson.empty){
            render(template: "person",  model: [listPerson: listPerson])
        }
    }

    @Transactional
    def save(Clinician clinicianInstance) {
        if (clinicianInstance == null) {
            notFound()
            return
        }

        if (clinicianInstance.hasErrors()) {
            respond clinicianInstance.errors, view: 'create'
            return
        }

        clinicianInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clinicianInstance.label', default: 'Clinician'), clinicianInstance.id])
                redirect clinicianInstance
            }
            '*' { respond clinicianInstance, [status: CREATED] }
        }
    }

    def edit(Clinician clinicianInstance) {
        respond clinicianInstance
    }

    @Transactional
    def update(Clinician clinicianInstance) {
        if (clinicianInstance == null) {
            notFound()
            return
        }

        if (clinicianInstance.hasErrors()) {
            respond clinicianInstance.errors, view: 'edit'
            return
        }

        clinicianInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Clinician.label', default: 'Clinician'), clinicianInstance.id])
                redirect clinicianInstance
            }
            '*' { respond clinicianInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Clinician clinicianInstance) {

        if (clinicianInstance == null) {
            notFound()
            return
        }

        clinicianInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Clinician.label', default: 'Clinician'), clinicianInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinicianInstance.label', default: 'Clinician'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}