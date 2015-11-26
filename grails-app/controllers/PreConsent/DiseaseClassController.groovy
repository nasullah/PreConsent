package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * DiseaseClassController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class DiseaseClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DiseaseClass.list(params), model: [diseaseClassInstanceCount: DiseaseClass.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DiseaseClass.list(params), model: [diseaseClassInstanceCount: DiseaseClass.count()]
    }

    def show(DiseaseClass diseaseClassInstance) {
        respond diseaseClassInstance
    }

    def create() {
        respond new DiseaseClass(params)
    }

    @Transactional
    def save(DiseaseClass diseaseClassInstance) {
        if (diseaseClassInstance == null) {
            notFound()
            return
        }

        if (diseaseClassInstance.hasErrors()) {
            respond diseaseClassInstance.errors, view: 'create'
            return
        }

        diseaseClassInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diseaseClassInstance.label', default: 'DiseaseClass'), diseaseClassInstance.id])
                redirect diseaseClassInstance
            }
            '*' { respond diseaseClassInstance, [status: CREATED] }
        }
    }

    def edit(DiseaseClass diseaseClassInstance) {
        respond diseaseClassInstance
    }

    @Transactional
    def update(DiseaseClass diseaseClassInstance) {
        if (diseaseClassInstance == null) {
            notFound()
            return
        }

        if (diseaseClassInstance.hasErrors()) {
            respond diseaseClassInstance.errors, view: 'edit'
            return
        }

        diseaseClassInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DiseaseClass.label', default: 'DiseaseClass'), diseaseClassInstance.id])
                redirect diseaseClassInstance
            }
            '*' { respond diseaseClassInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DiseaseClass diseaseClassInstance) {

        if (diseaseClassInstance == null) {
            notFound()
            return
        }

        diseaseClassInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DiseaseClass.label', default: 'DiseaseClass'), diseaseClassInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diseaseClassInstance.label', default: 'DiseaseClass'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
