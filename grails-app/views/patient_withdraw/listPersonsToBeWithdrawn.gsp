
<%@ page import="PreConsent.Engage" %>
<%@ page import="PreConsent.Patient_withdraw" %>

<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <title>Patient Withdrawal</title>
</head>

<body>

<section id="list-engage" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <th><g:message code="consent.person.label" default="Person" /></th>

            <th><g:message code="consent.clinician.label" default="Clinician" /></th>

            <g:sortableColumn property="date" title="${message(code: 'consent.date.label', default: 'Date')}" />

            <g:sortableColumn property="mode" title="${message(code: 'consent.mode.label', default: 'Mode')}" />

            <th><g:message code="label" default="Action" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${personsToBeWithdrawnList}" status="i" var="consentInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link controller="consent" action="show" id="${consentInstance.id}">${fieldValue(bean: consentInstance.person?.find{it?.id}, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: consentInstance.clinician, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${consentInstance.date}" /></td>

                <td>${fieldValue(bean: consentInstance, field: "mode")}</td>

                <td><a class='btn btn-primary btn-xs' <g:link controller="patient_withdraw" action="create" params="['person': consentInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Record this patient’s withdrawal</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div>
        <bs:paginate total="${personsToBeWithdrawnTotal}" />
    </div>
</section>

</body>

</html>