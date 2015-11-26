
<%@ page import="PreConsent.Complaint" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'complaint.label', default: 'Complaint')}" />
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
            <filterpane:filterPane domain="PreConsent.Complaint"
                                   excludeProperties="date"
                                   associatedProperties="person.nhsNumber, person.mrnNumber, person.surname, person.forenames, clinician.forenames, clinician.surname, clinician.department"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

<section id="index-complaint" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="complaint.clinician.label" default="Clinician" /></th>
			
				<th><g:message code="complaint.person.label" default="Person" /></th>
			
				<g:sortableColumn property="date" title="${message(code: 'complaint.date.label', default: 'Date')}" />
			
				<g:sortableColumn property="mode" title="${message(code: 'complaint.mode.label', default: 'Mode')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${complaintInstanceList}" status="i" var="complaintInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${complaintInstance.id}">${fieldValue(bean: complaintInstance.clinician, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: complaintInstance.person?.find{it?.id}, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${complaintInstance.date}" /></td>

                <td>${fieldValue(bean: complaintInstance, field: "mode")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${complaintInstanceCount}" />
	</div>
</section>

</body>

</html>
