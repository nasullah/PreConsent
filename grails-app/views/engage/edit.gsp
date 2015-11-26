<%@ page import="PreConsent.Engage" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit engagement record for ${engageInstance?.person?.forenames} ${engageInstance?.person?.surname}</title>
	<resource:autoComplete/>
</head>

<body>

	<section id="edit-engage" class="first">

		<g:hasErrors bean="${engageInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${engageInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${engageInstance?.id}" />
			<g:hiddenField name="version" value="${engageInstance?.version}" />
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
