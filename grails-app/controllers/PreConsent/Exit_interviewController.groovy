package PreConsent

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * Exit_interviewController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class Exit_interviewController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def filterPaneService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Exit_interview.list(params), model: [exit_interviewInstanceCount: Exit_interview.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Exit_interview.list(params), model: [exit_interviewInstanceCount: Exit_interview.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [exit_interviewInstanceList: Exit_interview.list(params), exit_interviewInstanceTotal: Exit_interview.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ exit_interviewInstanceList: filterPaneService.filter( params, Exit_interview ),
                                     exit_interviewInstanceTotal: filterPaneService.count( params, Exit_interview ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Exit_interview exit_interviewInstance) {
        respond exit_interviewInstance
    }

    def create() {
        respond new Exit_interview(params)
    }

    @Transactional
    def save(Exit_interview exit_interviewInstance) {
        if (exit_interviewInstance == null) {
            notFound()
            return
        }

        if (exit_interviewInstance.hasErrors()) {
            respond exit_interviewInstance.errors, view: 'create'
            return
        }

        exit_interviewInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'exit_interviewInstance.label', default: 'Exit_interview'), exit_interviewInstance.id])
                redirect exit_interviewInstance
            }
            '*' { respond exit_interviewInstance, [status: CREATED] }
        }
    }

    def edit(Exit_interview exit_interviewInstance) {
        respond exit_interviewInstance
    }

    @Transactional
    def update(Exit_interview exit_interviewInstance) {
        if (exit_interviewInstance == null) {
            notFound()
            return
        }

        if (exit_interviewInstance.hasErrors()) {
            respond exit_interviewInstance.errors, view: 'edit'
            return
        }

        exit_interviewInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Exit_interview.label', default: 'Exit_interview'), exit_interviewInstance.id])
                redirect exit_interviewInstance
            }
            '*' { respond exit_interviewInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Exit_interview exit_interviewInstance) {

        if (exit_interviewInstance == null) {
            notFound()
            return
        }

        exit_interviewInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Exit_interview.label', default: 'Exit_interview'), exit_interviewInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'exit_interviewInstance.label', default: 'Exit_interview'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
