package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ConsentStatusController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ConsentStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConsentStatus.list(params), model: [consentStatusInstanceCount: ConsentStatus.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConsentStatus.list(params), model: [consentStatusInstanceCount: ConsentStatus.count()]
    }

    def show(ConsentStatus consentStatusInstance) {
        respond consentStatusInstance
    }

    def create() {
        respond new ConsentStatus(params)
    }

    @Transactional
    def save(ConsentStatus consentStatusInstance) {
        if (consentStatusInstance == null) {
            notFound()
            return
        }

        if (consentStatusInstance.hasErrors()) {
            respond consentStatusInstance.errors, view: 'create'
            return
        }

        consentStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consentStatusInstance.label', default: 'ConsentStatus'), consentStatusInstance.id])
                redirect consentStatusInstance
            }
            '*' { respond consentStatusInstance, [status: CREATED] }
        }
    }

    def edit(ConsentStatus consentStatusInstance) {
        respond consentStatusInstance
    }

    @Transactional
    def update(ConsentStatus consentStatusInstance) {
        if (consentStatusInstance == null) {
            notFound()
            return
        }

        if (consentStatusInstance.hasErrors()) {
            respond consentStatusInstance.errors, view: 'edit'
            return
        }

        consentStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConsentStatus.label', default: 'ConsentStatus'), consentStatusInstance.id])
                redirect consentStatusInstance
            }
            '*' { respond consentStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConsentStatus consentStatusInstance) {

        if (consentStatusInstance == null) {
            notFound()
            return
        }

        consentStatusInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConsentStatus.label', default: 'ConsentStatus'), consentStatusInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consentStatusInstance.label', default: 'ConsentStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
