package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * IdentificationMethodController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class IdentificationMethodController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond IdentificationMethod.list(params), model: [identificationMethodInstanceCount: IdentificationMethod.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond IdentificationMethod.list(params), model: [identificationMethodInstanceCount: IdentificationMethod.count()]
    }

    def show(IdentificationMethod identificationMethodInstance) {
        respond identificationMethodInstance
    }

    def create() {
        respond new IdentificationMethod(params)
    }

    @Transactional
    def save(IdentificationMethod identificationMethodInstance) {
        if (identificationMethodInstance == null) {
            notFound()
            return
        }

        if (identificationMethodInstance.hasErrors()) {
            respond identificationMethodInstance.errors, view: 'create'
            return
        }

        identificationMethodInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'identificationMethodInstance.label', default: 'IdentificationMethod'), identificationMethodInstance.id])
                redirect identificationMethodInstance
            }
            '*' { respond identificationMethodInstance, [status: CREATED] }
        }
    }

    def edit(IdentificationMethod identificationMethodInstance) {
        respond identificationMethodInstance
    }

    @Transactional
    def update(IdentificationMethod identificationMethodInstance) {
        if (identificationMethodInstance == null) {
            notFound()
            return
        }

        if (identificationMethodInstance.hasErrors()) {
            respond identificationMethodInstance.errors, view: 'edit'
            return
        }

        identificationMethodInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'IdentificationMethod.label', default: 'IdentificationMethod'), identificationMethodInstance.id])
                redirect identificationMethodInstance
            }
            '*' { respond identificationMethodInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(IdentificationMethod identificationMethodInstance) {

        if (identificationMethodInstance == null) {
            notFound()
            return
        }

        identificationMethodInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'IdentificationMethod.label', default: 'IdentificationMethod'), identificationMethodInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationMethodInstance.label', default: 'IdentificationMethod'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
