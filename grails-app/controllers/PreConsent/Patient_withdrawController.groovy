package PreConsent

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * Patient_withdrawController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class Patient_withdrawController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def filterPaneService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Patient_withdraw.list(params), model: [patient_withdrawInstanceCount: Patient_withdraw.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Patient_withdraw.list(params), model: [patient_withdrawInstanceCount: Patient_withdraw.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [patient_withdrawInstanceList: Patient_withdraw.list(params), patient_withdrawInstanceTotal: Patient_withdraw.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ patient_withdrawInstanceList: filterPaneService.filter( params, Patient_withdraw ),
                                     patient_withdrawInstanceTotal: filterPaneService.count( params, Patient_withdraw ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Patient_withdraw patient_withdrawInstance) {
        respond patient_withdrawInstance
    }

    def create() {
        respond new Patient_withdraw(params)
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

        def getPerson = Person.createCriteria().get{
            or{
                eq('nhsNumber', searchPerson, [ignoreCase: true])
                eq('mrnNumber', searchPerson, [ignoreCase: true])
                eq('surname', searchPerson, [ignoreCase: true])
                eq('familyIdentifier', searchPerson, [ignoreCase: true])
            }
        }

        def isConsented = Consent.findByPerson(getPerson)
        def isPatient_withdrawal= Patient_withdraw.findByPerson(getPerson)
        if (isConsented && !isPatient_withdrawal){
            render(template: "person",  model: [getPerson: getPerson])
        }
    }

    def listPersonsToBeWithdrawn() {
        List<Long> withdrawalList = Patient_withdraw.list().id
        List<Person> person = new ArrayList<Person>()
        if (!withdrawalList.empty){
            person = Person.createCriteria().list {
                interactions {
                    'in'("id",withdrawalList)
                }
            }
        }
        def personsToBeWithdrawnList = Consent.list()
        if (!person.empty) {
            personsToBeWithdrawnList = Consent.findAllByPersonNotInList(person)        }
        [personsToBeWithdrawnList: personsToBeWithdrawnList, personsToBeWithdrawnTotal: personsToBeWithdrawnList.size()]
    }

    @Transactional
    def save(Patient_withdraw patient_withdrawInstance) {
        if (patient_withdrawInstance == null) {
            notFound()
            return
        }

        if (patient_withdrawInstance.hasErrors()) {
            respond patient_withdrawInstance.errors, view: 'create'
            return
        }

        patient_withdrawInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'patient_withdrawInstance.label', default: 'Patient_withdraw'), patient_withdrawInstance.id])
                redirect patient_withdrawInstance
            }
            '*' { respond patient_withdrawInstance, [status: CREATED] }
        }
    }

    def edit(Patient_withdraw patient_withdrawInstance) {
        respond patient_withdrawInstance
    }

    @Transactional
    def update(Patient_withdraw patient_withdrawInstance) {
        if (patient_withdrawInstance == null) {
            notFound()
            return
        }

        if (patient_withdrawInstance.hasErrors()) {
            respond patient_withdrawInstance.errors, view: 'edit'
            return
        }

        patient_withdrawInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Patient_withdraw.label', default: 'Patient_withdraw'), patient_withdrawInstance.id])
                redirect patient_withdrawInstance
            }
            '*' { respond patient_withdrawInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Patient_withdraw patient_withdrawInstance) {

        if (patient_withdrawInstance == null) {
            notFound()
            return
        }

        patient_withdrawInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Patient_withdraw.label', default: 'Patient_withdraw'), patient_withdrawInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient_withdrawInstance.label', default: 'Patient_withdraw'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
