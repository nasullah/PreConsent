package PreConsent


import grails.test.mixin.*
import spock.lang.*

@TestFor(Email_addressController)
@Mock(Email_address)
class Email_addressControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.email_addressInstanceList
        model.email_addressInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.email_addressInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def email_address = new Email_address()
        email_address.validate()
        controller.save(email_address)

        then: "The create view is rendered again with the correct model"
        model.email_addressInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        email_address = new Email_address(params)

        controller.save(email_address)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/email_address/show/1'
        controller.flash.message != null
        Email_address.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def email_address = new Email_address(params)
        controller.show(email_address)

        then: "A model is populated containing the domain instance"
        model.email_addressInstance == email_address
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def email_address = new Email_address(params)
        controller.edit(email_address)

        then: "A model is populated containing the domain instance"
        model.email_addressInstance == email_address
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/email_address/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def email_address = new Email_address()
        email_address.validate()
        controller.update(email_address)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.email_addressInstance == email_address

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        email_address = new Email_address(params).save(flush: true)
        controller.update(email_address)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/email_address/show/$email_address.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/email_address/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def email_address = new Email_address(params).save(flush: true)

        then: "It exists"
        Email_address.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(email_address)

        then: "The instance is deleted"
        Email_address.count() == 0
        response.redirectedUrl == '/email_address/index'
        flash.message != null
    }
}
