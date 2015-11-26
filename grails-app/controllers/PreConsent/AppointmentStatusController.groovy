package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * AppointmentStatusController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class AppointmentStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AppointmentStatus.list(params), model: [appointmentStatusInstanceCount: AppointmentStatus.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AppointmentStatus.list(params), model: [appointmentStatusInstanceCount: AppointmentStatus.count()]
    }

    def show(AppointmentStatus appointmentStatusInstance) {
        respond appointmentStatusInstance
    }

    def create() {
        respond new AppointmentStatus(params)
    }

    @Transactional
    def save(AppointmentStatus appointmentStatusInstance) {
        if (appointmentStatusInstance == null) {
            notFound()
            return
        }

        if (appointmentStatusInstance.hasErrors()) {
            respond appointmentStatusInstance.errors, view: 'create'
            return
        }

        appointmentStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appointmentStatusInstance.label', default: 'AppointmentStatus'), appointmentStatusInstance.id])
                redirect appointmentStatusInstance
            }
            '*' { respond appointmentStatusInstance, [status: CREATED] }
        }
    }

    def edit(AppointmentStatus appointmentStatusInstance) {
        respond appointmentStatusInstance
    }

    @Transactional
    def update(AppointmentStatus appointmentStatusInstance) {
        if (appointmentStatusInstance == null) {
            notFound()
            return
        }

        if (appointmentStatusInstance.hasErrors()) {
            respond appointmentStatusInstance.errors, view: 'edit'
            return
        }

        appointmentStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AppointmentStatus.label', default: 'AppointmentStatus'), appointmentStatusInstance.id])
                redirect appointmentStatusInstance
            }
            '*' { respond appointmentStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AppointmentStatus appointmentStatusInstance) {

        if (appointmentStatusInstance == null) {
            notFound()
            return
        }

        appointmentStatusInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AppointmentStatus.label', default: 'AppointmentStatus'), appointmentStatusInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointmentStatusInstance.label', default: 'AppointmentStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
