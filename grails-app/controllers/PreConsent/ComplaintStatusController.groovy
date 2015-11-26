package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ComplaintStatusController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ComplaintStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ComplaintStatus.list(params), model: [complaintStatusInstanceCount: ComplaintStatus.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ComplaintStatus.list(params), model: [complaintStatusInstanceCount: ComplaintStatus.count()]
    }

    def show(ComplaintStatus complaintStatusInstance) {
        respond complaintStatusInstance
    }

    def create() {
        respond new ComplaintStatus(params)
    }

    @Transactional
    def save(ComplaintStatus complaintStatusInstance) {
        if (complaintStatusInstance == null) {
            notFound()
            return
        }

        if (complaintStatusInstance.hasErrors()) {
            respond complaintStatusInstance.errors, view: 'create'
            return
        }

        complaintStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'complaintStatusInstance.label', default: 'ComplaintStatus'), complaintStatusInstance.id])
                redirect complaintStatusInstance
            }
            '*' { respond complaintStatusInstance, [status: CREATED] }
        }
    }

    def edit(ComplaintStatus complaintStatusInstance) {
        respond complaintStatusInstance
    }

    @Transactional
    def update(ComplaintStatus complaintStatusInstance) {
        if (complaintStatusInstance == null) {
            notFound()
            return
        }

        if (complaintStatusInstance.hasErrors()) {
            respond complaintStatusInstance.errors, view: 'edit'
            return
        }

        complaintStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ComplaintStatus.label', default: 'ComplaintStatus'), complaintStatusInstance.id])
                redirect complaintStatusInstance
            }
            '*' { respond complaintStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ComplaintStatus complaintStatusInstance) {

        if (complaintStatusInstance == null) {
            notFound()
            return
        }

        complaintStatusInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ComplaintStatus.label', default: 'ComplaintStatus'), complaintStatusInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'complaintStatusInstance.label', default: 'ComplaintStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
