package PreConsent


import grails.test.mixin.*
import spock.lang.*

@TestFor(Telephone_numberController)
@Mock(Telephone_number)
class Telephone_numberControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.telephone_numberInstanceList
        model.telephone_numberInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.telephone_numberInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def telephone_number = new Telephone_number()
        telephone_number.validate()
        controller.save(telephone_number)

        then: "The create view is rendered again with the correct model"
        model.telephone_numberInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        telephone_number = new Telephone_number(params)

        controller.save(telephone_number)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/telephone_number/show/1'
        controller.flash.message != null
        Telephone_number.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def telephone_number = new Telephone_number(params)
        controller.show(telephone_number)

        then: "A model is populated containing the domain instance"
        model.telephone_numberInstance == telephone_number
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def telephone_number = new Telephone_number(params)
        controller.edit(telephone_number)

        then: "A model is populated containing the domain instance"
        model.telephone_numberInstance == telephone_number
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/telephone_number/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def telephone_number = new Telephone_number()
        telephone_number.validate()
        controller.update(telephone_number)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.telephone_numberInstance == telephone_number

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        telephone_number = new Telephone_number(params).save(flush: true)
        controller.update(telephone_number)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/telephone_number/show/$telephone_number.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/telephone_number/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def telephone_number = new Telephone_number(params).save(flush: true)

        then: "It exists"
        Telephone_number.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(telephone_number)

        then: "The instance is deleted"
        Telephone_number.count() == 0
        response.redirectedUrl == '/telephone_number/index'
        flash.message != null
    }
}
