package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * Email_addressController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class Email_addressController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Email_address.list(params), model: [email_addressInstanceCount: Email_address.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Email_address.list(params), model: [email_addressInstanceCount: Email_address.count()]
    }

    def show(Email_address email_addressInstance) {
        respond email_addressInstance
    }

    def create() {
        respond new Email_address(params)
    }

    @Transactional
    def save(Email_address email_addressInstance) {
        if (email_addressInstance == null) {
            notFound()
            return
        }

        if (email_addressInstance.hasErrors()) {
            respond email_addressInstance.errors, view: 'create'
            return
        }

        email_addressInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'email_addressInstance.label', default: 'Email_address'), email_addressInstance.id])
//                redirect email_addressInstance
                redirect(controller:'contact_details',action: 'show', params: [id:email_addressInstance.contactDetails.id])
            }
            '*' { respond email_addressInstance, [status: CREATED] }
        }
    }

    def edit(Email_address email_addressInstance) {
        respond email_addressInstance
    }

    @Transactional
    def update(Email_address email_addressInstance) {
        if (email_addressInstance == null) {
            notFound()
            return
        }

        if (email_addressInstance.hasErrors()) {
            respond email_addressInstance.errors, view: 'edit'
            return
        }

        email_addressInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Email_address.label', default: 'Email_address'), email_addressInstance.id])
//               redirect email_addressInstance
                redirect(controller:'contact_details',action: 'show', params: [id:email_addressInstance.contactDetails.id])
            }
            '*' { respond email_addressInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Email_address email_addressInstance) {

        if (email_addressInstance == null) {
            notFound()
            return
        }

        email_addressInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Email_address.label', default: 'Email_address'), email_addressInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'email_addressInstance.label', default: 'Email_address'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
