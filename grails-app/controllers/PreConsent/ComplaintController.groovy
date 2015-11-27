package PreConsent

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ComplaintController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ComplaintController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def filterPaneService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Complaint.list(params), model: [complaintInstanceCount: Complaint.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Complaint.list(params), model: [complaintInstanceCount: Complaint.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [complaintInstanceList: Complaint.list(params), complaintInstanceTotal: Complaint.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ complaintInstanceList: filterPaneService.filter( params, Complaint ),
                                     complaintInstanceTotal: filterPaneService.count( params, Complaint ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def show(Complaint complaintInstance) {
        respond complaintInstance
    }

    def create() {
        respond new Complaint(params)
    }

    @Transactional
    def save(Complaint complaintInstance) {
        if (complaintInstance == null) {
            notFound()
            return
        }

        if (complaintInstance.hasErrors()) {
            respond complaintInstance.errors, view: 'create'
            return
        }

        complaintInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'complaintInstance.label', default: 'Complaint'), complaintInstance.id])
                redirect complaintInstance
            }
            '*' { respond complaintInstance, [status: CREATED] }
        }
    }

    def edit(Complaint complaintInstance) {
        respond complaintInstance
    }

    @Transactional
    def update(Complaint complaintInstance) {
        if (complaintInstance == null) {
            notFound()
            return
        }

        if (complaintInstance.hasErrors()) {
            respond complaintInstance.errors, view: 'edit'
            return
        }

        complaintInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Complaint.label', default: 'Complaint'), complaintInstance.id])
                redirect complaintInstance
            }
            '*' { respond complaintInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Complaint complaintInstance) {

        if (complaintInstance == null) {
            notFound()
            return
        }

        complaintInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Complaint.label', default: 'Complaint'), complaintInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'complaintInstance.label', default: 'Complaint'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
