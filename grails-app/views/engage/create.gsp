<%@ page import="PreConsent.Engage" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'engage.label', default: 'Engage')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
	<resource:autoComplete/>
</head>

<body>

	<section id="create-engage" class="first">

		<g:hasErrors bean="${engageInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${engageInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'save', default: 'Save')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

<hr/>

</body>

</html>
