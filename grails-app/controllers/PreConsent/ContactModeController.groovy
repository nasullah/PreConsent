package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ContactModeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ContactModeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ContactMode.list(params), model: [contactModeInstanceCount: ContactMode.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ContactMode.list(params), model: [contactModeInstanceCount: ContactMode.count()]
    }

    def show(ContactMode contactModeInstance) {
        respond contactModeInstance
    }

    def create() {
        respond new ContactMode(params)
    }

    @Transactional
    def save(ContactMode contactModeInstance) {
        if (contactModeInstance == null) {
            notFound()
            return
        }

        if (contactModeInstance.hasErrors()) {
            respond contactModeInstance.errors, view: 'create'
            return
        }

        contactModeInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contactModeInstance.label', default: 'ContactMode'), contactModeInstance.id])
                redirect contactModeInstance
            }
            '*' { respond contactModeInstance, [status: CREATED] }
        }
    }

    def edit(ContactMode contactModeInstance) {
        respond contactModeInstance
    }

    @Transactional
    def update(ContactMode contactModeInstance) {
        if (contactModeInstance == null) {
            notFound()
            return
        }

        if (contactModeInstance.hasErrors()) {
            respond contactModeInstance.errors, view: 'edit'
            return
        }

        contactModeInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ContactMode.label', default: 'ContactMode'), contactModeInstance.id])
                redirect contactModeInstance
            }
            '*' { respond contactModeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ContactMode contactModeInstance) {

        if (contactModeInstance == null) {
            notFound()
            return
        }

        contactModeInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ContactMode.label', default: 'ContactMode'), contactModeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactModeInstance.label', default: 'ContactMode'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
