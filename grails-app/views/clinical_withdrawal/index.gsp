
<%@ page import="PreConsent.Clinical_withdrawal" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clinical_withdrawal.label', default: 'Clinical Withdrawal')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
    <r:require module="filterpane" />
</head>

<body>

<p>
<p>
<div style="background: rgba(80, 110, 56, 0.04);">
    <div class="container">
        <p>
        <h5 class="text-center">Search Options</h5>
        <p>
            <filterpane:filterButton text="Filter This List" />
            <filterpane:filterPane domain="PreConsent.Clinical_withdrawal"
                                   excludeProperties="date"
                                   associatedProperties="person.nhsNumber, person.mrnNumber, person.surname, person.forenames, clinician.forenames, clinician.surname, clinician.department"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

<section id="index-clinical_withdrawal" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="clinical_withdrawal.clinician.label" default="Clinician" /></th>
			
				<th><g:message code="clinical_withdrawal.person.label" default="Person" /></th>
			
				<g:sortableColumn property="date" title="${message(code: 'clinical_withdrawal.date.label', default: 'Date')}" />
			
				<g:sortableColumn property="mode" title="${message(code: 'clinical_withdrawal.mode.label', default: 'Mode')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${clinical_withdrawalInstanceList}" status="i" var="clinical_withdrawalInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${clinical_withdrawalInstance.id}">${fieldValue(bean: clinical_withdrawalInstance.clinician, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: clinical_withdrawalInstance.person?.find{it?.id}, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${clinical_withdrawalInstance.date}" /></td>

                <td>${fieldValue(bean: clinical_withdrawalInstance, field: "mode")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${clinical_withdrawalInstanceCount}" />
	</div>
</section>

</body>

</html>
