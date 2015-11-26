package PreConsent


import grails.test.mixin.*
import spock.lang.*

@TestFor(DeclineController)
@Mock(Decline)
class DeclineControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.declineInstanceList
        model.declineInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.declineInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def decline = new Decline()
        decline.validate()
        controller.save(decline)

        then: "The create view is rendered again with the correct model"
        model.declineInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        decline = new Decline(params)

        controller.save(decline)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/decline/show/1'
        controller.flash.message != null
        Decline.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def decline = new Decline(params)
        controller.show(decline)

        then: "A model is populated containing the domain instance"
        model.declineInstance == decline
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def decline = new Decline(params)
        controller.edit(decline)

        then: "A model is populated containing the domain instance"
        model.declineInstance == decline
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/decline/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def decline = new Decline()
        decline.validate()
        controller.update(decline)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.declineInstance == decline

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        decline = new Decline(params).save(flush: true)
        controller.update(decline)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/decline/show/$decline.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/decline/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def decline = new Decline(params).save(flush: true)

        then: "It exists"
        Decline.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(decline)

        then: "The instance is deleted"
        Decline.count() == 0
        response.redirectedUrl == '/decline/index'
        flash.message != null
    }
}
