package PreConsent


import grails.test.mixin.*
import spock.lang.*

@TestFor(Contact_detailsController)
@Mock(Contact_details)
class Contact_detailsControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.contact_detailsInstanceList
        model.contact_detailsInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.contact_detailsInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def contact_details = new Contact_details()
        contact_details.validate()
        controller.save(contact_details)

        then: "The create view is rendered again with the correct model"
        model.contact_detailsInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        contact_details = new Contact_details(params)

        controller.save(contact_details)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/contact_details/show/1'
        controller.flash.message != null
        Contact_details.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def contact_details = new Contact_details(params)
        controller.show(contact_details)

        then: "A model is populated containing the domain instance"
        model.contact_detailsInstance == contact_details
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def contact_details = new Contact_details(params)
        controller.edit(contact_details)

        then: "A model is populated containing the domain instance"
        model.contact_detailsInstance == contact_details
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/contact_details/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def contact_details = new Contact_details()
        contact_details.validate()
        controller.update(contact_details)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.contact_detailsInstance == contact_details

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        contact_details = new Contact_details(params).save(flush: true)
        controller.update(contact_details)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/contact_details/show/$contact_details.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/contact_details/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def contact_details = new Contact_details(params).save(flush: true)

        then: "It exists"
        Contact_details.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(contact_details)

        then: "The instance is deleted"
        Contact_details.count() == 0
        response.redirectedUrl == '/contact_details/index'
        flash.message != null
    }
}
