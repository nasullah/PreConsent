
<%@ page import="PreConsent.DiseaseClass" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'diseaseClass.label', default: 'Disease Class')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-diseaseClass" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="diseaseClassName" title="${message(code: 'diseaseClass.diseaseClassName.label', default: 'Disease Class Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${diseaseClassInstanceList}" status="i" var="diseaseClassInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${diseaseClassInstance.id}">${fieldValue(bean: diseaseClassInstance, field: "diseaseClassName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${diseaseClassInstanceCount}" />
	</div>
</section>

</body>

</html>
