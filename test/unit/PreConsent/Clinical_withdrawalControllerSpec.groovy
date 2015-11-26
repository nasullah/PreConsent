package PreConsent


import grails.test.mixin.*
import spock.lang.*

@TestFor(Clinical_withdrawalController)
@Mock(Clinical_withdrawal)
class Clinical_withdrawalControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.clinical_withdrawalInstanceList
        model.clinical_withdrawalInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.clinical_withdrawalInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def clinical_withdrawal = new Clinical_withdrawal()
        clinical_withdrawal.validate()
        controller.save(clinical_withdrawal)

        then: "The create view is rendered again with the correct model"
        model.clinical_withdrawalInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        clinical_withdrawal = new Clinical_withdrawal(params)

        controller.save(clinical_withdrawal)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/clinical_withdrawal/show/1'
        controller.flash.message != null
        Clinical_withdrawal.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def clinical_withdrawal = new Clinical_withdrawal(params)
        controller.show(clinical_withdrawal)

        then: "A model is populated containing the domain instance"
        model.clinical_withdrawalInstance == clinical_withdrawal
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def clinical_withdrawal = new Clinical_withdrawal(params)
        controller.edit(clinical_withdrawal)

        then: "A model is populated containing the domain instance"
        model.clinical_withdrawalInstance == clinical_withdrawal
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/clinical_withdrawal/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def clinical_withdrawal = new Clinical_withdrawal()
        clinical_withdrawal.validate()
        controller.update(clinical_withdrawal)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.clinical_withdrawalInstance == clinical_withdrawal

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        clinical_withdrawal = new Clinical_withdrawal(params).save(flush: true)
        controller.update(clinical_withdrawal)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/clinical_withdrawal/show/$clinical_withdrawal.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/clinical_withdrawal/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def clinical_withdrawal = new Clinical_withdrawal(params).save(flush: true)

        then: "It exists"
        Clinical_withdrawal.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(clinical_withdrawal)

        then: "The instance is deleted"
        Clinical_withdrawal.count() == 0
        response.redirectedUrl == '/clinical_withdrawal/index'
        flash.message != null
    }
}
