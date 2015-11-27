<%@ page import="PreConsent.Complaint" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit complaint record for ${complaintInstance?.person?.forenames} ${complaintInstance?.person?.surname}</title>
	<resource:autoComplete/>

</head>

<body>

	<section id="edit-complaint" class="first">

		<g:hasErrors bean="${complaintInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${complaintInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${complaintInstance?.id}" />
			<g:hiddenField name="version" value="${complaintInstance?.version}" />
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
