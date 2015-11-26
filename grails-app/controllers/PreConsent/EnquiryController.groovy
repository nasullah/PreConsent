package PreConsent

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * EnquiryController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class EnquiryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def filterPaneService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Enquiry.list(params), model: [enquiryInstanceCount: Enquiry.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Enquiry.list(params), model: [enquiryInstanceCount: Enquiry.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [enquiryInstanceList: Enquiry.list(params), enquiryInstanceTotal: Enquiry.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ enquiryInstanceList: filterPaneService.filter( params, Enquiry ),
                                     enquiryInstanceTotal: filterPaneService.count( params, Enquiry ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Enquiry enquiryInstance) {
        respond enquiryInstance
    }

    def create() {
        respond new Enquiry(params)
    }

    def findClinician() {
        def searchClinician= params.searchClinician

        def listClinician = Clinician.where{
            forenames =~ searchClinician || surname =~ searchClinician || department =~ searchClinician
        }.findAll()
        if (!listClinician.empty){
            render(template: "clinician",  model: [listClinician: listClinician])
        }
    }

    def findPerson() {
        def searchPerson= params.searchPerson

        def listPerson = Person.where{
            nhsNumber =~ searchPerson || mrnNumber =~ searchPerson || surname =~ searchPerson || familyIdentifier =~ searchPerson
        }.findAll()
        if (!listPerson.empty){
            render(template: "person",  model: [listPerson: listPerson])
        }
    }

    @Transactional
    def save(Enquiry enquiryInstance) {
        if (enquiryInstance == null) {
            notFound()
            return
        }

        if (enquiryInstance.hasErrors()) {
            respond enquiryInstance.errors, view: 'create'
            return
        }

        enquiryInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'enquiryInstance.label', default: 'Enquiry'), enquiryInstance.id])
                redirect enquiryInstance
            }
            '*' { respond enquiryInstance, [status: CREATED] }
        }
    }

    def edit(Enquiry enquiryInstance) {
        respond enquiryInstance
    }

    @Transactional
    def update(Enquiry enquiryInstance) {
        if (enquiryInstance == null) {
            notFound()
            return
        }

        if (enquiryInstance.hasErrors()) {
            respond enquiryInstance.errors, view: 'edit'
            return
        }

        enquiryInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Enquiry.label', default: 'Enquiry'), enquiryInstance.id])
                redirect enquiryInstance
            }
            '*' { respond enquiryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Enquiry enquiryInstance) {

        if (enquiryInstance == null) {
            notFound()
            return
        }

        enquiryInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Enquiry.label', default: 'Enquiry'), enquiryInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'enquiryInstance.label', default: 'Enquiry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
