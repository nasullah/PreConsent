package PreConsent



import grails.test.mixin.*
import spock.lang.*

@TestFor(AppointmentTypeController)
@Mock(AppointmentType)
class AppointmentTypeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.appointmentTypeInstanceList
            model.appointmentTypeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.appointmentTypeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def appointmentType = new AppointmentType()
            appointmentType.validate()
            controller.save(appointmentType)

        then:"The create view is rendered again with the correct model"
            model.appointmentTypeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            appointmentType = new AppointmentType(params)

            controller.save(appointmentType)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/appointmentType/show/1'
            controller.flash.message != null
            AppointmentType.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def appointmentType = new AppointmentType(params)
            controller.show(appointmentType)

        then:"A model is populated containing the domain instance"
            model.appointmentTypeInstance == appointmentType
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def appointmentType = new AppointmentType(params)
            controller.edit(appointmentType)

        then:"A model is populated containing the domain instance"
            model.appointmentTypeInstance == appointmentType
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/appointmentType/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def appointmentType = new AppointmentType()
            appointmentType.validate()
            controller.update(appointmentType)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.appointmentTypeInstance == appointmentType

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            appointmentType = new AppointmentType(params).save(flush: true)
            controller.update(appointmentType)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/appointmentType/show/$appointmentType.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/appointmentType/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def appointmentType = new AppointmentType(params).save(flush: true)

        then:"It exists"
            AppointmentType.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(appointmentType)

        then:"The instance is deleted"
            AppointmentType.count() == 0
            response.redirectedUrl == '/appointmentType/index'
            flash.message != null
    }
}
