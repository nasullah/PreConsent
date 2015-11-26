
<%@ page import="PreConsent.Contact_details" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contact_details.label', default: 'Contact Details')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-contact_details" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact_details.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${contact_detailsInstance?.person?.id}">${contact_detailsInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact_details.address.label" default="Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contact_detailsInstance, field: "address")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact_details.postalCode.label" default="Postal Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contact_detailsInstance, field: "postalCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact_details.fromDate.label" default="From Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${contact_detailsInstance?.fromDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact_details.to_date.label" default="To Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${contact_detailsInstance?.to_date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact_details.emailAddress.label" default="Email Address" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${contact_detailsInstance.emailAddress}" var="e">
						<li><g:link controller="email_address" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact_details.telephoneNumber.label" default="Telephone Number" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${contact_detailsInstance.telephoneNumber}" var="t">
						<li><g:link controller="telephone_number" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

<hr/>

<p class="text-primary">Available Actions</p>

<a class='btn btn-primary btn-small' <g:link controller="email_address" action="create" params="['contact_details': contact_detailsInstance?.id]"><i class="glyphicon glyphicon-plus"></i> ${message(code: 'default.add.label', args: [message(code: 'contact_details.label', default: 'Email Address')])}</g:link>

<a class='btn btn-primary btn-small' <g:link controller="telephone_number" action="create" params="['contact_details': contact_detailsInstance?.id]"><i class="glyphicon glyphicon-plus"></i> ${message(code: 'default.add.label', args: [message(code: 'contact_details.label', default: 'Telephone Number')])}</g:link>

<hr/>

</body>

</html>
