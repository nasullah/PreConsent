
<%@ page import="PreConsent.Person" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
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
            <filterpane:filterPane domain="PreConsent.Person"
                                   excludeProperties="dateOfBirth"/>
        <p>
        <p>
    </div>
</div>

<section id="list-person" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nhsNumber" title="${message(code: 'person.nhsNumber.label', default: 'Surname')}" />
			
				<g:sortableColumn property="mrnNumber" title="${message(code: 'person.mrnNumber.label', default: 'MRN Number')}" />

				<g:sortableColumn property="surname" title="${message(code: 'person.surname.label', default: 'NHS Number')}" />

				<g:sortableColumn property="disease" title="${message(code: 'person.disease.label', default: 'Disease')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${personInstanceList}" status="i" var="personInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "surname")}</g:link></td>
			
				<td>${fieldValue(bean: personInstance, field: "mrnNumber")}</td>

				<td>${fieldValue(bean: personInstance, field: "nhsNumber")}</td>

				<td>${fieldValue(bean: personInstance, field: "disease")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${personInstanceTotal}" />
	</div>
</section>

</body>

</html>
