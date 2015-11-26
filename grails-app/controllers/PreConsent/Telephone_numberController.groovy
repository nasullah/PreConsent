package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * Telephone_numberController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class Telephone_numberController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Telephone_number.list(params), model: [telephone_numberInstanceCount: Telephone_number.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Telephone_number.list(params), model: [telephone_numberInstanceCount: Telephone_number.count()]
    }

    def show(Telephone_number telephone_numberInstance) {
        respond telephone_numberInstance
    }

    def create() {
        respond new Telephone_number(params)
    }

    @Transactional
    def save(Telephone_number telephone_numberInstance) {
        if (telephone_numberInstance == null) {
            notFound()
            return
        }

        if (telephone_numberInstance.hasErrors()) {
            respond telephone_numberInstance.errors, view: 'create'
            return
        }

        telephone_numberInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'telephone_numberInstance.label', default: 'Telephone_number'), telephone_numberInstance.id])
//                redirect telephone_numberInstance
                redirect(controller:'contact_details',action: 'show', params: [id:telephone_numberInstance.contactDetails.id])
            }
            '*' { respond telephone_numberInstance, [status: CREATED] }
        }
    }

    def edit(Telephone_number telephone_numberInstance) {
        respond telephone_numberInstance
    }

    @Transactional
    def update(Telephone_number telephone_numberInstance) {
        if (telephone_numberInstance == null) {
            notFound()
            return
        }

        if (telephone_numberInstance.hasErrors()) {
            respond telephone_numberInstance.errors, view: 'edit'
            return
        }

        telephone_numberInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Telephone_number.label', default: 'Telephone_number'), telephone_numberInstance.id])
//                redirect telephone_numberInstance
                redirect(controller:'contact_details',action: 'show', params: [id:telephone_numberInstance.contactDetails.id])
            }
            '*' { respond telephone_numberInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Telephone_number telephone_numberInstance) {

        if (telephone_numberInstance == null) {
            notFound()
            return
        }

        telephone_numberInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Telephone_number.label', default: 'Telephone_number'), telephone_numberInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'telephone_numberInstance.label', default: 'Telephone_number'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
