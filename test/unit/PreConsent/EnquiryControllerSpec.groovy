package PreConsent


import grails.test.mixin.*
import spock.lang.*

@TestFor(EnquiryController)
@Mock(Enquiry)
class EnquiryControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.enquiryInstanceList
        model.enquiryInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.enquiryInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def enquiry = new Enquiry()
        enquiry.validate()
        controller.save(enquiry)

        then: "The create view is rendered again with the correct model"
        model.enquiryInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        enquiry = new Enquiry(params)

        controller.save(enquiry)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/enquiry/show/1'
        controller.flash.message != null
        Enquiry.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def enquiry = new Enquiry(params)
        controller.show(enquiry)

        then: "A model is populated containing the domain instance"
        model.enquiryInstance == enquiry
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def enquiry = new Enquiry(params)
        controller.edit(enquiry)

        then: "A model is populated containing the domain instance"
        model.enquiryInstance == enquiry
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/enquiry/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def enquiry = new Enquiry()
        enquiry.validate()
        controller.update(enquiry)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.enquiryInstance == enquiry

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        enquiry = new Enquiry(params).save(flush: true)
        controller.update(enquiry)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/enquiry/show/$enquiry.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/enquiry/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def enquiry = new Enquiry(params).save(flush: true)

        then: "It exists"
        Enquiry.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(enquiry)

        then: "The instance is deleted"
        Enquiry.count() == 0
        response.redirectedUrl == '/enquiry/index'
        flash.message != null
    }
}
