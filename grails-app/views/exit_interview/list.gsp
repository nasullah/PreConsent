
<%@ page import="PreConsent.Exit_interview" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'exit_interview.label', default: 'Exit Interview')}" />
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
            <filterpane:filterPane domain="PreConsent.Exit_interview"
                                   excludeProperties="date"
                                   associatedProperties="person.nhsNumber, person.mrnNumber, person.surname, person.forenames, clinician.forenames, clinician.surname, clinician.department"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

<section id="list-exit_interview" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="exit_interview.clinician.label" default="Clinician" /></th>
			
				<th><g:message code="exit_interview.person.label" default="Person" /></th>
			
				<g:sortableColumn property="date" title="${message(code: 'exit_interview.date.label', default: 'Date')}" />
			
				<g:sortableColumn property="mode" title="${message(code: 'exit_interview.mode.label', default: 'Mode')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${exit_interviewInstanceList}" status="i" var="exit_interviewInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${exit_interviewInstance.id}">${fieldValue(bean: exit_interviewInstance.clinician, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: exit_interviewInstance.person?.find{it?.id}, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${exit_interviewInstance.date}" /></td>

                <td>${fieldValue(bean: exit_interviewInstance, field: "mode")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${exit_interviewInstanceTotal}" />
	</div>
</section>

</body>

</html>
