<%@ page import="PreConsent.Person" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit participant record for ${personInstance?.forenames} ${personInstance?.surname}</title>
	<resource:autoComplete/>
</head>

<body>

	<section id="edit-person" class="first">

		<g:hasErrors bean="${personInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${personInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${personInstance?.id}" />
			<g:hiddenField name="version" value="${personInstance?.version}" />
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
