<%@ page import="PreConsent.Enquiry" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit enquiry record for ${enquiryInstance?.person?.forenames} ${enquiryInstance?.person?.surname}</title>
</head>

<body>

	<section id="edit-enquiry" class="first">

		<g:hasErrors bean="${enquiryInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${enquiryInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${enquiryInstance?.id}" />
			<g:hiddenField name="version" value="${enquiryInstance?.version}" />
			<g:hiddenField name="_method" value="PUT" />
			
			<g:render template="form"/>
			
			<div class="form-actions margin-top-medium">
				<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

</body>

</html>
