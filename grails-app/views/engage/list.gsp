
<%@ page import="PreConsent.Engage" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'engage.label', default: 'Engage')}" />
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
            <filterpane:filterPane domain="PreConsent.Engage"
                                   excludeProperties="date"
                                   associatedProperties="person.nhsNumber, person.mrnNumber, person.surname, person.forenames, clinician.forenames, clinician.surname, clinician.department"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

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
		<g:each in="${engageInstanceList}" status="i" var="engageInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${engageInstance.id}">${fieldValue(bean: engageInstance.person?.find{it?.id}, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: engageInstance.clinician, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${engageInstance.date}" /></td>

                <td>${fieldValue(bean: engageInstance, field: "mode")}</td>

                <td>
                    <a class='btn btn-primary btn-xs' <g:link controller="consent" action="create" params="['person': engageInstance?.person?.id]"><i class="glyphicon glyphicon-plus"></i> Consent this patient</g:link>
                </td>

            </tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${engageInstanceTotal}" />
	</div>
</section>

</body>

</html>
