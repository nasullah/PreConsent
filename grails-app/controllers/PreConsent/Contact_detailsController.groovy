package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * Contact_detailsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class Contact_detailsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contact_details.list(params), model: [contact_detailsInstanceCount: Contact_details.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contact_details.list(params), model: [contact_detailsInstanceCount: Contact_details.count()]
    }

    def show(Contact_details contact_detailsInstance) {
        respond contact_detailsInstance
    }

    def create() {
        respond new Contact_details(params)
    }

    def copyContactDetails() {
        respond new Contact_details(params)
    }

    @Transactional
    def saveCopyContactDetails() {

        def person = Person.findById(params.long('person.id'))
        def contactDetails = Contact_details.findById(params.long('contactDetails.id'))

        if (person && contactDetails){
            person.addToContactDetails(contactDetails).save flush: true
            flash.message = "Contact details has been copied"
            redirect(controller:'person',action: 'show', params: [id:person.id])
        }

        else{
            respond contactDetails.errors, view: 'copyContactDetails'
        }
    }


    @Transactional
    def save(Contact_details contact_detailsInstance) {
        if (contact_detailsInstance == null) {
            notFound()
            return
        }

        if (contact_detailsInstance.hasErrors()) {
            respond contact_detailsInstance.errors, view: 'create'
            return
        }

        def email= params.emailAddress1
        def telephone = params.telephoneNumber1

        if (email){
            def emailAddress = new Email_address()
            emailAddress.emailAddress = email
            contact_detailsInstance.addToEmailAddress(emailAddress).save flush: true
        }

        if (telephone){
            def telephoneNumber = new Telephone_number()
            telephoneNumber.telephoneNumber = telephone
            contact_detailsInstance.addToTelephoneNumber(telephoneNumber).save flush: true
        }

        contact_detailsInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contact_detailsInstance.label', default: 'Contact_details'), contact_detailsInstance.id])
                redirect(controller:'person',action: 'show', params: [id:contact_detailsInstance.person.id])
            }
            '*' { respond contact_detailsInstance, [status: CREATED] }
        }
    }

    def edit(Contact_details contact_detailsInstance) {
        respond contact_detailsInstance
    }

    @Transactional
    def update(Contact_details contact_detailsInstance) {
        if (contact_detailsInstance == null) {
            notFound()
            return
        }

        if (contact_detailsInstance.hasErrors()) {
            respond contact_detailsInstance.errors, view: 'edit'
            return
        }

        def email= params.emailAddress1
        def telephone = params.telephoneNumber1

        if (email){
            def emailAddress = new Email_address()
            emailAddress.emailAddress = email
            contact_detailsInstance.addToEmailAddress(emailAddress).save flush: true
        }

        if (telephone){
            def telephoneNumber = new Telephone_number()
            telephoneNumber.telephoneNumber = telephone
            contact_detailsInstance.addToTelephoneNumber(telephoneNumber).save flush: true
        }

        contact_detailsInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Contact_details.label', default: 'Contact_details'), contact_detailsInstance.id])
                redirect(controller:'person',action: 'show', params: [id:contact_detailsInstance.person.id])
            }
            '*' { respond contact_detailsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Contact_details contact_detailsInstance) {

        if (contact_detailsInstance == null) {
            notFound()
            return
        }

        contact_detailsInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Contact_details.label', default: 'Contact_details'), contact_detailsInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact_detailsInstance.label', default: 'Contact_details'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
