package PreConsent

import org.grails.plugin.filterpane.FilterPaneUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugins.springsecurity.*
/**
 * Clinical_withdrawalController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class Clinical_withdrawalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def filterPaneService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clinical_withdrawal.list(params), model: [clinical_withdrawalInstanceCount: Clinical_withdrawal.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Clinical_withdrawal.list(params), model: [clinical_withdrawalInstanceCount: Clinical_withdrawal.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clinical_withdrawalInstanceList: Clinical_withdrawal.list(params), clinical_withdrawalInstanceTotal: Clinical_withdrawal.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ clinical_withdrawalInstanceList: filterPaneService.filter( params, Clinical_withdrawal ),
                                     clinical_withdrawalInstanceTotal: filterPaneService.count( params, Clinical_withdrawal ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Clinical_withdrawal clinical_withdrawalInstance) {
        respond clinical_withdrawalInstance
    }

    def create() {
        respond new Clinical_withdrawal(params)
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

        def isEngaged = Engage.findByPerson(getPerson)
        def isClinical_withdrawal= Clinical_withdrawal.findByPerson(getPerson)
        if (isEngaged && !isClinical_withdrawal){
            render(template: "person",  model: [getPerson: getPerson])
        }
    }

    def listPersonsToBeClinicalWithdrawn() {

        List<Long> consentList = Consent.list().id
        List<Long> clinicalWithdrawalList = Clinical_withdrawal.list().id
        clinicalWithdrawalList.addAll(consentList)
        List<Person> person = new ArrayList<Person>()
        if (!clinicalWithdrawalList.empty){
            person = Person.createCriteria().list {
                interactions {
                    'in'("id",clinicalWithdrawalList)
                }
            }
        }
        def engagedNotClinicalWithdrawn = Engage.list()
        if (!person.empty) {
            engagedNotClinicalWithdrawn = Engage.findAllByPersonNotInList(person)
        }
        [personsToBeClinicalWithdrawnList: engagedNotClinicalWithdrawn, personsToBeClinicalWithdrawnTotal: engagedNotClinicalWithdrawn.size()]
    }

    @Transactional
    def save(Clinical_withdrawal clinical_withdrawalInstance) {
        if (clinical_withdrawalInstance == null) {
            notFound()
            return
        }

        if (clinical_withdrawalInstance.hasErrors()) {
            respond clinical_withdrawalInstance.errors, view: 'create'
            return
        }

        clinical_withdrawalInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clinical_withdrawalInstance.label', default: 'Clinical_withdrawal'), clinical_withdrawalInstance.id])
                redirect clinical_withdrawalInstance
            }
            '*' { respond clinical_withdrawalInstance, [status: CREATED] }
        }
    }

    def edit(Clinical_withdrawal clinical_withdrawalInstance) {
        respond clinical_withdrawalInstance
    }

    @Transactional
    def update(Clinical_withdrawal clinical_withdrawalInstance) {
        if (clinical_withdrawalInstance == null) {
            notFound()
            return
        }

        if (clinical_withdrawalInstance.hasErrors()) {
            respond clinical_withdrawalInstance.errors, view: 'edit'
            return
        }

        clinical_withdrawalInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Clinical_withdrawal.label', default: 'Clinical_withdrawal'), clinical_withdrawalInstance.id])
                redirect clinical_withdrawalInstance
            }
            '*' { respond clinical_withdrawalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Clinical_withdrawal clinical_withdrawalInstance) {

        if (clinical_withdrawalInstance == null) {
            notFound()
            return
        }

        clinical_withdrawalInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Clinical_withdrawal.label', default: 'Clinical_withdrawal'), clinical_withdrawalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinical_withdrawalInstance.label', default: 'Clinical_withdrawal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}