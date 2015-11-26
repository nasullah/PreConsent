package PreConsent

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * VersionInformationSheetController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class VersionInformationSheetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VersionInformationSheet.list(params), model: [versionInformationSheetInstanceCount: VersionInformationSheet.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VersionInformationSheet.list(params), model: [versionInformationSheetInstanceCount: VersionInformationSheet.count()]
    }

    def show(VersionInformationSheet versionInformationSheetInstance) {
        respond versionInformationSheetInstance
    }

    def create() {
        respond new VersionInformationSheet(params)
    }

    @Transactional
    def save(VersionInformationSheet versionInformationSheetInstance) {
        if (versionInformationSheetInstance == null) {
            notFound()
            return
        }

        if (versionInformationSheetInstance.hasErrors()) {
            respond versionInformationSheetInstance.errors, view: 'create'
            return
        }

        versionInformationSheetInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'versionInformationSheetInstance.label', default: 'VersionInformationSheet'), versionInformationSheetInstance.id])
                redirect versionInformationSheetInstance
            }
            '*' { respond versionInformationSheetInstance, [status: CREATED] }
        }
    }

    def edit(VersionInformationSheet versionInformationSheetInstance) {
        respond versionInformationSheetInstance
    }

    @Transactional
    def update(VersionInformationSheet versionInformationSheetInstance) {
        if (versionInformationSheetInstance == null) {
            notFound()
            return
        }

        if (versionInformationSheetInstance.hasErrors()) {
            respond versionInformationSheetInstance.errors, view: 'edit'
            return
        }

        versionInformationSheetInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VersionInformationSheet.label', default: 'VersionInformationSheet'), versionInformationSheetInstance.id])
                redirect versionInformationSheetInstance
            }
            '*' { respond versionInformationSheetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VersionInformationSheet versionInformationSheetInstance) {

        if (versionInformationSheetInstance == null) {
            notFound()
            return
        }

        versionInformationSheetInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VersionInformationSheet.label', default: 'VersionInformationSheet'), versionInformationSheetInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'versionInformationSheetInstance.label', default: 'VersionInformationSheet'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
