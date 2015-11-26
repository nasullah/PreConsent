<%@ page import="PreConsent.Contact_details" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
 />
    <title>Copy Contact Details</title>
</head>

<body>

<section id="create-contact_details" class="first">

    <g:hasErrors bean="${contact_detailsInstance}">
        <div class="alert alert-danger">
            <g:renderErrors bean="${contact_detailsInstance}" as="list" />
        </div>
    </g:hasErrors>

    <g:form action="saveCopyContactDetails" class="form-horizontal" role="form" >

        <div class="${hasErrors(bean: contact_detailsInstance, field: 'person', 'error')} required">
            <label for="person" class="control-label"><g:message code="contact_details.person.label" default="Person" /><span class="required-indicator">*</span></label>
            <div>
                <g:select class="form-control" id="person" name="person.id" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${contact_detailsInstance?.person?.id}" class="many-to-one"/>
                <span class="help-inline">${hasErrors(bean: contact_detailsInstance, field: 'person', 'error')}</span>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <label for="clinician" class="control-label"><g:message code="approach.clinician.label" default="Select a contact" /><span class="required-indicator">*</span></label>
                <div class="">
                    <div>
                        <g:select class="form-control" id="contactDetails" name="contactDetails.id" size="1" from="${PreConsent.Contact_details.findAll {person.familyIdentifier == contact_detailsInstance?.person?.familyIdentifier}}" optionKey="id" required="" value="" noSelection="['': '- Choose -']"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-actions margin-top-medium">
            <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'save', default: 'Save')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
        </div>
    </g:form>

</section>

<hr style="border:1; height:1px" />

</body>

</html>