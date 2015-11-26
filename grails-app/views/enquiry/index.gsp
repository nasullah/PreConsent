
<%@ page import="PreConsent.Enquiry" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'enquiry.label', default: 'Enquiry')}" />
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
            <filterpane:filterPane domain="PreConsent.Enquiry"
                                   excludeProperties="date"
                                   associatedProperties="person.nhsNumber, person.mrnNumber, person.surname, person.forenames, clinician.forenames, clinician.surname, clinician.department"/>
        <p>
        <p>
    </div>
</div>

<hr style="border:1; height:1px" />

<section id="index-enquiry" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="enquiry.clinician.label" default="Clinician" /></th>
			
				<th><g:message code="enquiry.person.label" default="Person" /></th>
			
				<g:sortableColumn property="date" title="${message(code: 'enquiry.date.label', default: 'Date')}" />

                <g:sortableColumn property="mode" title="${message(code: 'enquiry.mode.label', default: 'Mode')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${enquiryInstanceList}" status="i" var="enquiryInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${enquiryInstance.id}">${fieldValue(bean: enquiryInstance.clinician, field: "surname")}</g:link></td>

                <td>${fieldValue(bean: enquiryInstance.person?.find{it?.id}, field: "surname")}</td>

                <td><g:formatDate format="dd-MM-yyyy" date="${enquiryInstance.date}" /></td>

                <td>${fieldValue(bean: enquiryInstance, field: "mode")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${enquiryInstanceCount}" />
	</div>
</section>

</body>

</html>
