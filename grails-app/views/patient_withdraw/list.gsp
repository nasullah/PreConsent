
<%@ page import="PreConsent.Patient_withdraw" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'patient_withdraw.label', default: 'Patient Withdraw')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
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
            <filterpane:filterPane domain="PreConsent.Patient_withdraw"
                                   excludeProperties="date"
                                   associatedProperties="person.nhsNumber, person.mrnNumber, person.surname, person.forenames, clinician.forenames, clinician.surname, clinician.department"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

<section id="list-patient_withdraw" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="patient_withdraw.person.label" default="Person" /></th>
			
				<th><g:message code="patient_withdraw.clinician.label" default="Clinician" /></th>
			
				<g:sortableColumn property="date" title="${message(code: 'patient_withdraw.date.label', default: 'Date')}" />
			
				<g:sortableColumn property="mode" title="${message(code: 'patient_withdraw.mode.label', default: 'Mode')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${patient_withdrawInstanceList}" status="i" var="patient_withdrawInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${patient_withdrawInstance.id}">${fieldValue(bean: patient_withdrawInstance.person?.find{it?.id}, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: patient_withdrawInstance.clinician, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${patient_withdrawInstance.date}" /></td>

                <td>${fieldValue(bean: patient_withdrawInstance, field: "mode")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${patient_withdrawInstanceTotal}" />
	</div>
</section>

</body>

</html>
