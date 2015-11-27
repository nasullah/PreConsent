<%@ page import="PreConsent.Patient_withdraw" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
    <title>Edit patient withdrawal record for ${patient_withdrawInstance?.person?.forenames} ${patient_withdrawInstance?.person?.surname}</title>
	<resource:autoComplete/>
</head>

<body>

	<section id="edit-patient_withdraw" class="first">

		<g:hasErrors bean="${patient_withdrawInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${patient_withdrawInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${patient_withdrawInstance?.id}" />
			<g:hiddenField name="version" value="${patient_withdrawInstance?.version}" />
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
