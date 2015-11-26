package PreConsent


import grails.test.mixin.*
import spock.lang.*

@TestFor(Patient_withdrawController)
@Mock(Patient_withdraw)
class Patient_withdrawControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.patient_withdrawInstanceList
        model.patient_withdrawInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.patient_withdrawInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def patient_withdraw = new Patient_withdraw()
        patient_withdraw.validate()
        controller.save(patient_withdraw)

        then: "The create view is rendered again with the correct model"
        model.patient_withdrawInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        patient_withdraw = new Patient_withdraw(params)

        controller.save(patient_withdraw)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/patient_withdraw/show/1'
        controller.flash.message != null
        Patient_withdraw.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def patient_withdraw = new Patient_withdraw(params)
        controller.show(patient_withdraw)

        then: "A model is populated containing the domain instance"
        model.patient_withdrawInstance == patient_withdraw
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def patient_withdraw = new Patient_withdraw(params)
        controller.edit(patient_withdraw)

        then: "A model is populated containing the domain instance"
        model.patient_withdrawInstance == patient_withdraw
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/patient_withdraw/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def patient_withdraw = new Patient_withdraw()
        patient_withdraw.validate()
        controller.update(patient_withdraw)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.patient_withdrawInstance == patient_withdraw

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        patient_withdraw = new Patient_withdraw(params).save(flush: true)
        controller.update(patient_withdraw)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/patient_withdraw/show/$patient_withdraw.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/patient_withdraw/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def patient_withdraw = new Patient_withdraw(params).save(flush: true)

        then: "It exists"
        Patient_withdraw.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(patient_withdraw)

        then: "The instance is deleted"
        Patient_withdraw.count() == 0
        response.redirectedUrl == '/patient_withdraw/index'
        flash.message != null
    }
}
