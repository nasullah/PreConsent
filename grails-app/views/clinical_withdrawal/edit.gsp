<%@ page import="PreConsent.Clinical_withdrawal" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit clinical withdrawal record for ${clinical_withdrawalInstance?.person?.forenames} ${clinical_withdrawalInstance?.person?.surname}</title>
	<resource:autoComplete/>
</head>

<body>

	<section id="edit-clinical_withdrawal" class="first">

		<g:hasErrors bean="${clinical_withdrawalInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${clinical_withdrawalInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${clinical_withdrawalInstance?.id}" />
			<g:hiddenField name="version" value="${clinical_withdrawalInstance?.version}" />
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
