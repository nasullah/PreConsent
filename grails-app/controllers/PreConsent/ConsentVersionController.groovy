package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ConsentVersionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ConsentVersionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConsentVersion.list(params), model: [consentVersionInstanceCount: ConsentVersion.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConsentVersion.list(params), model: [consentVersionInstanceCount: ConsentVersion.count()]
    }

    def show(ConsentVersion consentVersionInstance) {
        respond consentVersionInstance
    }

    def create() {
        respond new ConsentVersion(params)
    }

    @Transactional
    def save(ConsentVersion consentVersionInstance) {
        if (consentVersionInstance == null) {
            notFound()
            return
        }

        if (consentVersionInstance.hasErrors()) {
            respond consentVersionInstance.errors, view: 'create'
            return
        }

        consentVersionInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consentVersionInstance.label', default: 'ConsentVersion'), consentVersionInstance.id])
                redirect consentVersionInstance
            }
            '*' { respond consentVersionInstance, [status: CREATED] }
        }
    }

    def edit(ConsentVersion consentVersionInstance) {
        respond consentVersionInstance
    }

    @Transactional
    def update(ConsentVersion consentVersionInstance) {
        if (consentVersionInstance == null) {
            notFound()
            return
        }

        if (consentVersionInstance.hasErrors()) {
            respond consentVersionInstance.errors, view: 'edit'
            return
        }

        consentVersionInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConsentVersion.label', default: 'ConsentVersion'), consentVersionInstance.id])
                redirect consentVersionInstance
            }
            '*' { respond consentVersionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConsentVersion consentVersionInstance) {

        if (consentVersionInstance == null) {
            notFound()
            return
        }

        consentVersionInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConsentVersion.label', default: 'ConsentVersion'), consentVersionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consentVersionInstance.label', default: 'ConsentVersion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
