
<%@ page import="PreConsent.Engage" %>
<%@ page import="PreConsent.Consent" %>

<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <title>Consent</title>
</head>

<body>

<section id="list-engage" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <th><g:message code="engage.person.label" default="Person" /></th>

            <th><g:message code="engage.clinician.label" default="Clinician" /></th>

            <g:sortableColumn property="date" title="${message(code: 'engage.date.label', default: 'Date')}" />

            <g:sortableColumn property="mode" title="${message(code: 'engage.mode.label', default: 'Mode')}" />

            <th><g:message code="label" default="Action" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${personsToBeConsentedList}" status="i" var="engageInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link controller="engage" action="show" id="${engageInstance.id}">${fieldValue(bean: engageInstance.person, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: engageInstance.clinician, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${engageInstance.date}" /></td>

                <td>${fieldValue(bean: engageInstance, field: "mode")}</td>

                <td><a class='btn btn-primary btn-xs' <g:link controller="consent" action="create" params="['person.id': engageInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Consent this patient</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div>
        <bs:paginate total="${personsToBeConsentedTotal}" />
    </div>
</section>

</body>

</html>