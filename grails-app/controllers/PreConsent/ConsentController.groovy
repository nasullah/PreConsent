package PreConsent

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ConsentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ConsentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def filterPaneService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Consent.list(params), model: [consentInstanceCount: Consent.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Consent.list(params), model: [consentInstanceCount: Consent.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        List<Long> clinicalWithdrawalList = Patient_withdraw.list().id
        List<Person> person = new ArrayList<Person>()
        if (!clinicalWithdrawalList.empty){
            person = Person.createCriteria().list {
                interactions {
                    'in'("id",clinicalWithdrawalList)
                }
            }
        }
        def consentList = Consent.list()
        if (!person.empty) {
            consentList = Consent.findAllByPersonNotInList(person)
        }
        [consentInstanceList: consentList, consentInstanceTotal: Consent.count()]
    }

    def listPersonsToBeConsented() {
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
        def personsToBeConsentedList = Engage.list()
        if (!person.empty) {
            personsToBeConsentedList = Engage.findAllByPersonNotInList(person)
        }
        [personsToBeConsentedList: personsToBeConsentedList, personsToBeConsentedTotal: personsToBeConsentedList.size()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ consentInstanceList: filterPaneService.filter( params, Consent ),
                                     consentInstanceTotal: filterPaneService.count( params, Consent ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Consent consentInstance) {
        respond consentInstance
    }

    def create() {
        respond new Consent(params)
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
        def isConsented= Consent.findByPerson(getPerson)
        if (isEngaged && !isConsented){
            render(template: "person",  model: [getPerson: getPerson])
        }
    }

    @Transactional
    def save(Consent consentInstance) {
        if (consentInstance == null) {
            notFound()
            return
        }

        if (consentInstance.hasErrors()) {
            respond consentInstance.errors, view: 'create'
            return
        }

        consentInstance.save flush: true

        if (params.gelIdentifier && consentInstance){
            def person = Person.findById(params.long('person'))
            person.gelIdentifier = params.gelIdentifier
            person.save flush: true
        }

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consentInstance.label', default: 'Consent'), consentInstance.id])
                redirect consentInstance
            }
            '*' { respond consentInstance, [status: CREATED] }
        }
    }

    def edit(Consent consentInstance) {
        respond consentInstance
    }

    @Transactional
    def update(Consent consentInstance) {
        if (consentInstance == null) {
            notFound()
            return
        }

        if (consentInstance.hasErrors()) {
            respond consentInstance.errors, view: 'edit'
            return
        }

        consentInstance.save flush: true

        if (consentInstance){
            def person = Person.findById(params.long('person'))
            person.gelIdentifier = params.gelIdentifier
            person.save flush: true
        }

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Consent.label', default: 'Consent'), consentInstance.id])
                redirect consentInstance
            }
            '*' { respond consentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Consent consentInstance) {

        if (consentInstance == null) {
            notFound()
            return
        }

        consentInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Consent.label', default: 'Consent'), consentInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consentInstance.label', default: 'Consent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
