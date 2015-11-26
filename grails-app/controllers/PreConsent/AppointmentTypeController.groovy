package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * AppointmentTypeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class AppointmentTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AppointmentType.list(params), model: [appointmentTypeInstanceCount: AppointmentType.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AppointmentType.list(params), model: [appointmentTypeInstanceCount: AppointmentType.count()]
    }

    def show(AppointmentType appointmentTypeInstance) {
        respond appointmentTypeInstance
    }

    def create() {
        respond new AppointmentType(params)
    }

    @Transactional
    def save(AppointmentType appointmentTypeInstance) {
        if (appointmentTypeInstance == null) {
            notFound()
            return
        }

        if (appointmentTypeInstance.hasErrors()) {
            respond appointmentTypeInstance.errors, view: 'create'
            return
        }

        appointmentTypeInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appointmentTypeInstance.label', default: 'AppointmentType'), appointmentTypeInstance.id])
                redirect appointmentTypeInstance
            }
            '*' { respond appointmentTypeInstance, [status: CREATED] }
        }
    }

    def edit(AppointmentType appointmentTypeInstance) {
        respond appointmentTypeInstance
    }

    @Transactional
    def update(AppointmentType appointmentTypeInstance) {
        if (appointmentTypeInstance == null) {
            notFound()
            return
        }

        if (appointmentTypeInstance.hasErrors()) {
            respond appointmentTypeInstance.errors, view: 'edit'
            return
        }

        appointmentTypeInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AppointmentType.label', default: 'AppointmentType'), appointmentTypeInstance.id])
                redirect appointmentTypeInstance
            }
            '*' { respond appointmentTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AppointmentType appointmentTypeInstance) {

        if (appointmentTypeInstance == null) {
            notFound()
            return
        }

        appointmentTypeInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AppointmentType.label', default: 'AppointmentType'), appointmentTypeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointmentTypeInstance.label', default: 'AppointmentType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
