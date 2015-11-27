package PreConsent

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.time.TimeCategory

/**
 * AppointmentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class AppointmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Appointment.list(params), model: [appointmentInstanceCount: Appointment.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Appointment.list(params), model: [appointmentInstanceCount: Appointment.count()]
    }

    def show(Appointment appointmentInstance) {
        respond appointmentInstance
    }

    def create() {
        respond new Appointment(params)
    }

    def eventList (){
        def appointmentList = Appointment.list()
        def eventList = []
        appointmentList.each {event ->
            def startTime = event.startTime
            def endTime = event.endTime
            def date = event.date.format("yyyy-MM-dd").toString()
            def startDateTime = date+'T'+startTime+':00'
            def endDateTime = date+'T'+endTime+':00'
            eventList << [title: event.status.appointmentStatusName + '--' + event.clinician.surname,
                          allDay: false,
                          start: startDateTime,
                          end:endDateTime,
                          url: createLink(controller: "appointment", action:"show", id:event?.id)
                         ]
        }
        render eventList as JSON
    }

    def calendarView(){
    }

    def findFamilyMember() {
        render(template: "familyMember", model: [personList: Person.findAllByIdNotEqual(params.long('person'))])

    }
    @Transactional
    def save(Appointment appointmentInstance) {
        if (appointmentInstance == null) {
            notFound()
            return
        }

        if (appointmentInstance.hasErrors()) {
            respond appointmentInstance.errors, view: 'create'
            return
        }

        appointmentInstance.save flush: true

        def listParams = params.findAll{it.key.startsWith("checkbox_")}.values()
        def listPersonsId = new ArrayList(listParams);
        if(!listPersonsId.empty){
            for(int i; i < listPersonsId.size(); i++ ){
                def person = Person.findById(listPersonsId.get(i)?.toString()?.toLong())
                if(person){
                    appointmentInstance.addToPerson(person).save flush: true
                }
            }
        }

        List types = params.list('types')

        for (int i= 0; i < types.size(); i++){
            appointmentInstance.addToType(new Type(appointmentType: AppointmentType.findByAppointmentTypeName(types?.get(i)?.toString()))).save flush: true
        }
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appointmentInstance.label', default: 'Appointment'), appointmentInstance.id])
                redirect appointmentInstance
            }
            '*' { respond appointmentInstance, [status: CREATED] }
        }
    }

    def edit(Appointment appointmentInstance) {
        respond appointmentInstance
    }

    @Transactional
    def update(Appointment appointmentInstance) {
        if (appointmentInstance == null) {
            notFound()
            return
        }

        if (appointmentInstance.hasErrors()) {
            respond appointmentInstance.errors, view: 'edit'
            return
        }

        appointmentInstance.save flush: true
        List types = params.list('types')
        def existedTypes = Type.findAllByAppointment(appointmentInstance)
        if (!existedTypes.empty){
            existedTypes.each {it.delete flush: true}
        }
        for (int i= 0; i < types.size(); i++){
            appointmentInstance.addToType(new Type(appointmentType: AppointmentType.findByAppointmentTypeName(types?.get(i)?.toString()))).save flush: true
        }
        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Appointment.label', default: 'Appointment'), appointmentInstance.id])
                redirect appointmentInstance
            }
            '*' { respond appointmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Appointment appointmentInstance) {

        if (appointmentInstance == null) {
            notFound()
            return
        }

        appointmentInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Appointment.label', default: 'Appointment'), appointmentInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointmentInstance.label', default: 'Appointment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
