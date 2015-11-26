
<%@ page import="PreConsent.DiseaseClass" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'diseaseClass.label', default: 'Disease Class')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-diseaseClass" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="diseaseClass.diseaseClassName.label" default="Disease Class Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: diseaseClassInstance, field: "diseaseClassName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
