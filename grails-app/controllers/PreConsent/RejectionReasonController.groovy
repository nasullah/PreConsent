package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * RejectionReasonController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class RejectionReasonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RejectionReason.list(params), model: [rejectionReasonInstanceCount: RejectionReason.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RejectionReason.list(params), model: [rejectionReasonInstanceCount: RejectionReason.count()]
    }

    def show(RejectionReason rejectionReasonInstance) {
        respond rejectionReasonInstance
    }

    def create() {
        respond new RejectionReason(params)
    }

    @Transactional
    def save(RejectionReason rejectionReasonInstance) {
        if (rejectionReasonInstance == null) {
            notFound()
            return
        }

        if (rejectionReasonInstance.hasErrors()) {
            respond rejectionReasonInstance.errors, view: 'create'
            return
        }

        rejectionReasonInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rejectionReasonInstance.label', default: 'RejectionReason'), rejectionReasonInstance.id])
                redirect rejectionReasonInstance
            }
            '*' { respond rejectionReasonInstance, [status: CREATED] }
        }
    }

    def edit(RejectionReason rejectionReasonInstance) {
        respond rejectionReasonInstance
    }

    @Transactional
    def update(RejectionReason rejectionReasonInstance) {
        if (rejectionReasonInstance == null) {
            notFound()
            return
        }

        if (rejectionReasonInstance.hasErrors()) {
            respond rejectionReasonInstance.errors, view: 'edit'
            return
        }

        rejectionReasonInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RejectionReason.label', default: 'RejectionReason'), rejectionReasonInstance.id])
                redirect rejectionReasonInstance
            }
            '*' { respond rejectionReasonInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RejectionReason rejectionReasonInstance) {

        if (rejectionReasonInstance == null) {
            notFound()
            return
        }

        rejectionReasonInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RejectionReason.label', default: 'RejectionReason'), rejectionReasonInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rejectionReasonInstance.label', default: 'RejectionReason'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
