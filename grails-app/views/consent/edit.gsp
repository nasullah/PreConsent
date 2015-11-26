<%@ page import="PreConsent.Consent" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit consent record for ${consentInstance?.person?.forenames} ${consentInstance?.person?.surname}</title>
</head>

<body>

	<section id="edit-consent" class="first">

		<g:hasErrors bean="${consentInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${consentInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${consentInstance?.id}" />
			<g:hiddenField name="version" value="${consentInstance?.version}" />
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
