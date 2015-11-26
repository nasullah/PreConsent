
<%@ page import="PreConsent.Person" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
    <title>Engage</title>
</head>

<body>


<section id="list-person" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <g:sortableColumn property="nhsNumber" title="${message(code: 'person.nhsNumber.label', default: 'Surname')}" />

            <g:sortableColumn property="mrnNumber" title="${message(code: 'person.mrnNumber.label', default: 'MRN Number')}" />

            <g:sortableColumn property="surname" title="${message(code: 'person.surname.label', default: 'NHS Number')}" />

            <g:sortableColumn property="disease" title="${message(code: 'person.disease.label', default: 'Disease')}" />

            <th><g:message code="label" default="Action" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${listPersons}" status="i" var="personInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link controller="person" action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: personInstance, field: "mrnNumber")}</td>

                <td>${fieldValue(bean: personInstance, field: "nhsNumber")}</td>

                <td>${fieldValue(bean: personInstance, field: "disease")}</td>

                <td><a class='btn btn-primary btn-xs' <g:link controller="engage" action="create" params="['person.id': personInstance?.id]"><i class="glyphicon glyphicon-plus"></i> Engage this patient</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
</section>

</body>

</html>