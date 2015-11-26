
<%@ page import="PreConsent.Consent" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consent.label', default: 'Consent')}" />
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
            <filterpane:filterPane domain="PreConsent.Consent"
                                   excludeProperties="date"
                                   associatedProperties="person.nhsNumber, person.mrnNumber, person.surname, person.forenames, clinician.forenames, clinician.surname, clinician.department"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

<section id="list-consent" class="first">

	<table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <th><g:message code="consent.person.label" default="Person" /></th>

            <th><g:message code="consent.clinician.label" default="Clinician" /></th>

            <g:sortableColumn property="date" title="${message(code: 'consent.date.label', default: 'Date')}" />

            <g:sortableColumn property="mode" title="${message(code: 'consent.mode.label', default: 'Mode')}" />

            <th><g:message code="specimen.label" default="Action" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${consentInstanceList}" status="i" var="consentInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${consentInstance.id}">${fieldValue(bean: consentInstance.person?.find{it?.id}, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: consentInstance.clinician, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${consentInstance.date}" /></td>

                <td>${fieldValue(bean: consentInstance, field: "mode")}</td>

                <td><a class='btn btn-primary btn-xs' <g:link controller="patient_withdraw" action="create" params="['person': consentInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i>Withdraw this patient</g:link></td>

            </tr>
        </g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${consentInstanceTotal}" />
	</div>
</section>

</body>

</html>
