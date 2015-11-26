package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * WithdrawStatusController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class WithdrawStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond WithdrawStatus.list(params), model: [withdrawStatusInstanceCount: WithdrawStatus.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond WithdrawStatus.list(params), model: [withdrawStatusInstanceCount: WithdrawStatus.count()]
    }

    def show(WithdrawStatus withdrawStatusInstance) {
        respond withdrawStatusInstance
    }

    def create() {
        respond new WithdrawStatus(params)
    }

    @Transactional
    def save(WithdrawStatus withdrawStatusInstance) {
        if (withdrawStatusInstance == null) {
            notFound()
            return
        }

        if (withdrawStatusInstance.hasErrors()) {
            respond withdrawStatusInstance.errors, view: 'create'
            return
        }

        withdrawStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'withdrawStatusInstance.label', default: 'WithdrawStatus'), withdrawStatusInstance.id])
                redirect withdrawStatusInstance
            }
            '*' { respond withdrawStatusInstance, [status: CREATED] }
        }
    }

    def edit(WithdrawStatus withdrawStatusInstance) {
        respond withdrawStatusInstance
    }

    @Transactional
    def update(WithdrawStatus withdrawStatusInstance) {
        if (withdrawStatusInstance == null) {
            notFound()
            return
        }

        if (withdrawStatusInstance.hasErrors()) {
            respond withdrawStatusInstance.errors, view: 'edit'
            return
        }

        withdrawStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'WithdrawStatus.label', default: 'WithdrawStatus'), withdrawStatusInstance.id])
                redirect withdrawStatusInstance
            }
            '*' { respond withdrawStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(WithdrawStatus withdrawStatusInstance) {

        if (withdrawStatusInstance == null) {
            notFound()
            return
        }

        withdrawStatusInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'WithdrawStatus.label', default: 'WithdrawStatus'), withdrawStatusInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'withdrawStatusInstance.label', default: 'WithdrawStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
