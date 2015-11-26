package PreConsent

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils
import ch.silviowangler.groovy.util.builder.ICalendarBuilder
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * EngageController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class EngageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def mailService
    def filterPaneService
    def pdfRenderingService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Engage.list(params), model: [engageInstanceCount: Engage.count()]
    }

    def listPerson() {
        def listPersons = Person.list()
        listPersons = listPersons.findAll {p ->
            !Engage.list().person.findAll{it.findAll {it == p}}
        }
        [listPersons: listPersons]
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
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
        def engageList = Engage.list()
        if (!person.empty) {
            engageList = Engage.findAll{person.find{it} != person.every{it}}
        }
//        [engageInstanceList: engageList, engageInstanceTotal: engageList.size()]
        [engageInstanceList: engageList, engageInstanceTotal: engageList.size()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ engageInstanceList: filterPaneService.filter( params, Engage ),
                                     engageInstanceTotal: filterPaneService.count( params, Engage ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Engage engageInstance) {
        respond engageInstance
    }

    def create() {
        respond new Engage(params)
    }

    def findClinician() {
        def listClinician = Clinician.createCriteria().listDistinct{
            or{
                ilike("forenames", "%${params.query}%")
                ilike("surname", "%${params.query}%")
                ilike("department", "%${params.query}%")
            }
        }
        render(contentType: "text/xml") {
            results() {
                listClinician.each { clinician ->
                    result(){
                        name(clinician)
                        //Optional id which will be available in onItemSelect
                        id(clinician.id)
                    }
                }
            }
        }
    }

    def createAppointment() {

        def builder = new ICalendarBuilder()
//        builder.calendar {
//            events {
//                event(start: new Date(), end: (new Date()).next(), summary: 'Engage patient') {
//                    organizer(name: "${Clinician}", email: "${meetingInstance?.mdt?.email}")
//                    reminder(minutesBefore: 15, description: 'Engage patient')
//                }
//            }
//        }
//
//        mailService.sendMail {
//            multipart true
//            to "${Person.findById(listPersonsId.get(i).toString().toLong())?.email}"
//            subject "MDT meeting at ${meetingInstance?.time} on ${meetingInstance?.date?.format('yyyy-MM-dd')} at loction ${meetingInstance?.location}"
//            body "This is an invitation for MDT meeting at ${meetingInstance?.time} on ${meetingInstance?.date?.format('yyyy-MM-dd')} at loction ${meetingInstance?.location}, please reply to this email."
//            attachBytes "appointment.ics", "text/calendar", builder.cal.toString().getBytes('UTF-8')
//        }
//        redirect(controller:'engage',action: 'create')
//        flash.message ="An mail has been sent."
    }

    def renderFormPDF(){
        def formInstance = Engage.get(params.id)
        def args = [template:"pdf", model:[form:formInstance]]
        pdfRenderingService.render(args+[controller:this],response)
    }



    @Transactional
    def save(Engage engageInstance) {
        if (engageInstance == null) {
            notFound()
            return
        }

        if (engageInstance.hasErrors()) {
            respond engageInstance.errors, view: 'create'
            return
        }

        engageInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'engageInstance.label', default: 'Engage'), engageInstance.id])
                redirect engageInstance
            }
            '*' { respond engageInstance, [status: CREATED] }
        }
    }

    def edit(Engage engageInstance) {
        respond engageInstance
    }

    @Transactional
    def update(Engage engageInstance) {
        if (engageInstance == null) {
            notFound()
            return
        }

        if (engageInstance.hasErrors()) {
            respond engageInstance.errors, view: 'edit'
            return
        }

        engageInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Engage.label', default: 'Engage'), engageInstance.id])
                redirect engageInstance
            }
            '*' { respond engageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Engage engageInstance) {

        if (engageInstance == null) {
            notFound()
            return
        }

        engageInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Engage.label', default: 'Engage'), engageInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'engageInstance.label', default: 'Engage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
