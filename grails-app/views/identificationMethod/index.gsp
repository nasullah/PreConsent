
<%@ page import="PreConsent.IdentificationMethod" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'identificationMethod.label', default: 'Identification Method')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-identificationMethod" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="identificationMethodName" title="${message(code: 'identificationMethod.identificationMethodName.label', default: 'Identification Method Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${identificationMethodInstanceList}" status="i" var="identificationMethodInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${identificationMethodInstance.id}">${fieldValue(bean: identificationMethodInstance, field: "identificationMethodName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${identificationMethodInstanceCount}" />
	</div>
</section>

</body>

</html>
