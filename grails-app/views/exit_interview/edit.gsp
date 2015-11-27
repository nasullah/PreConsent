<%@ page import="PreConsent.Exit_interview" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit exit interview record for ${exit_interviewInstance?.person?.forenames} ${exit_interviewInstance?.person?.surname}</title>
	<resource:autoComplete/>
</head>

<body>

	<section id="edit-exit_interview" class="first">

		<g:hasErrors bean="${exit_interviewInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${exit_interviewInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${exit_interviewInstance?.id}" />
			<g:hiddenField name="version" value="${exit_interviewInstance?.version}" />
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
