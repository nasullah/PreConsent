
<%@ page import="PreConsent.Clinician" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clinician.label', default: 'Clinician')}" />
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
            <filterpane:filterPane domain="PreConsent.Clinician"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

<section id="list-clinician" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="forenames" title="${message(code: 'clinician.forenames.label', default: 'Forenames')}" />
			
				<g:sortableColumn property="surname" title="${message(code: 'clinician.surname.label', default: 'Surname')}" />
			
				<g:sortableColumn property="department" title="${message(code: 'clinician.department.label', default: 'Department')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${clinicianInstanceList}" status="i" var="clinicianInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clinicianInstance.id}">${fieldValue(bean: clinicianInstance, field: "forenames")}</g:link></td>
			
				<td>${fieldValue(bean: clinicianInstance, field: "surname")}</td>
			
				<td>${fieldValue(bean: clinicianInstance, field: "department")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${clinicianInstanceTotal}" />
	</div>
</section>

</body>

</html>
