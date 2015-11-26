
<%@ page import="PreConsent.Person" %>
<%@ page import="PreConsent.Clinical_withdrawal" %>
<%@ page import="PreConsent.Complaint" %>
<%@ page import="PreConsent.Consent" %>
<%@ page import="PreConsent.Engage" %>
<%@ page import="PreConsent.Enquiry" %>
<%@ page import="PreConsent.Exit_interview" %>
<%@ page import="PreConsent.Patient_withdraw" %>

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<title>Participant record for ${personInstance?.forenames} ${personInstance?.surname}</title>
</head>

<body>

<section id="show-person" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.nhsNumber.label" default="NHS Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "nhsNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.mrnNumber.label" default="MRN Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "mrnNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.dateOfBirth.label" default="Date of Birth" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${personInstance?.dateOfBirth}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.surname.label" default="Surname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "surname")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.forenames.label" default="Forenames" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "forenames")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.disease.label" default="Disease" /></td>
				
				<td valign="top" class="value">${personInstance?.disease?.encodeAsHTML()}</td>
				
			</tr>

            <g:if test="${personInstance?.disease?.encodeAsHTML() != "Cancer"}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.isProband.label" default="Is Proband" /></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.isProband}" false="No" true="Yes" /></td>

                </tr>
            </g:if>

            <g:if test="${personInstance?.disease?.encodeAsHTML() != "Cancer"}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.sequencingTarget.label" default="Sequencing Target" /></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.sequencingTarget}" false="No" true="Yes" /></td>

                </tr>
            </g:if>

            <g:if test="${personInstance.gelIdentifier}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.gelIdentifier.label" default="Gel Identifier" /></td>

                    <td valign="top" class="value">${fieldValue(bean: personInstance, field: "gelIdentifier")}</td>

                </tr>
            </g:if>

            <g:if test="${personInstance.familyIdentifier}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.familyIdentifier.label" default="Family Identifier" /></td>

                    <td valign="top" class="value">${fieldValue(bean: personInstance, field: "familyIdentifier")}</td>

                </tr>
            </g:if>

            <g:if test="${personInstance?.disease?.encodeAsHTML() != "Cancer"}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.guardianOfProband.label" default="Guardian of Proband" /></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.guardianOfProband}" false="No" true="Yes" /></td>

                </tr>
            </g:if>

            <g:if test="${personInstance.familyIdentifier}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.contactDetails.label" default="Family Members" /></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <% def familyIdentifier = personInstance?.familyIdentifier?.toString() %>
                        <% def familyMember = Person.findAllByFamilyIdentifier(familyIdentifier) %>
                        <% familyMember = familyMember.findAll {it.id != personInstance.id} %>
                        <ul>
                            <g:each in="${familyMember}" var="c">
                                <li><g:link controller="person" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>
            </g:if>

            <g:if test="${personInstance.contactDetails}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.contactDetails.label" default="Contact Details" /></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${personInstance.contactDetails}" var="c">
                                <li><g:link controller="contact_details" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>
            </g:if>

            <g:if test="${personInstance.interactions}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.interactions.label" default="Interactions" /></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <% def clinical_withdrawal = Clinical_withdrawal.listOrderById() %>
                        <% def complaint = Complaint.listOrderById() %>
                        <% def consent = Consent.listOrderById() %>
                        <% def engage = Engage.listOrderById() %>
                        <% def enquiry = Enquiry.listOrderById() %>
                        <% def exit_interview = Exit_interview.listOrderById() %>
                        <% def patient_withdraw = Patient_withdraw.listOrderById() %>

                        <ul>

                            <g:each in="${complaint}" var="item">
                                <g:each in="${personInstance.interactions}" var="pos">
                                    <g:if test="${pos.id ==item.id}">
                                        <li><g:link controller="complaint" action="show" id="${item.id}">${item}</g:link></li>
                                    </g:if>
                                </g:each>
                            </g:each>

                            <g:each in="${enquiry}" var="item">
                                <g:each in="${personInstance.interactions}" var="pos">
                                    <g:if test="${pos.id ==item.id}">
                                        <li><g:link controller="enquiry" action="show" id="${item.id}">${item}</g:link></li>
                                    </g:if>
                                </g:each>
                            </g:each>

                            <g:each in="${exit_interview}" var="item">
                                <g:each in="${personInstance.interactions}" var="pos">
                                    <g:if test="${pos.id ==item.id}">
                                        <li><g:link controller="exit_interview" action="show" id="${item.id}">${item}</g:link></li>
                                    </g:if>
                                </g:each>
                            </g:each>

                            <g:each in="${patient_withdraw}" var="item">
                                <g:each in="${personInstance.interactions}" var="pos">
                                    <g:if test="${pos.id ==item.id}">
                                        <li><g:link controller="patient_withdraw" action="show" id="${item.id}">${item}</g:link></li>
                                    </g:if>
                                </g:each>
                            </g:each>

                            <g:each in="${consent}" var="item">
                                <g:each in="${personInstance.interactions}" var="pos">
                                    <g:if test="${pos.id ==item.id}">
                                        <li><g:link controller="consent" action="show" id="${item.id}">${item}</g:link></li>
                                    </g:if>
                                </g:each>
                            </g:each>

                            <g:each in="${clinical_withdrawal}" var="item">
                                <g:each in="${personInstance.interactions}" var="pos">
                                    <g:if test="${pos.id ==item.id}">
                                        <li><g:link controller="clinical_withdrawal" action="show" id="${item.id}">${item}</g:link></li>
                                    </g:if>
                                </g:each>
                            </g:each>

                            <g:each in="${engage}" var="item">
                                <g:each in="${personInstance.interactions}" var="pos">
                                    <g:if test="${pos.id ==item.id}">
                                        <li><g:link controller="engage" action="show" id="${item.id}">${item}</g:link></li>
                                    </g:if>
                                </g:each>
                            </g:each>

                        </ul>
                    </td>
                </tr>
            </g:if>
		
		</tbody>
	</table>
</section>

<hr/>

<p class="text-primary">Available Actions</p>

<a class='btn btn-primary btn-small' <g:link controller="contact_details" action="create" params="['person': personInstance?.id]"><i class="glyphicon glyphicon-plus"></i> ${message(code: 'default.add.label', args: [message(code: 'contact_details.label', default: 'Contact details')])}</g:link>

<g:if test="${personInstance?.disease?.encodeAsHTML() != "Cancer"}">
    <a class='btn btn-primary btn-small' <g:link controller="contact_details" action="copyContactDetails" params="['person': personInstance?.id]"><i class="glyphicon glyphicon-plus"></i> Copy Contact details</g:link>
</g:if>

<g:if test="${PreConsent.Engage.list().person.findAll{it.findAll {it == personInstance}}.empty}">
    <a class='btn btn-primary btn-small' <g:link controller="engage" action="create" params="['person': personInstance?.id]"><i class="glyphicon glyphicon-plus"></i> Engage this patient</g:link>
</g:if>

<g:if test="${personInstance?.disease?.encodeAsHTML() != "Cancer"}">
    <a class='btn btn-primary btn-small' <g:link controller="person" action="create" params="['familyIdentifier': personInstance?.familyIdentifier,'disease': personInstance?.disease?.id, 'isProband':false]"><i class="glyphicon glyphicon-plus"></i> Add a family member</g:link>
</g:if>

<a class='btn btn-primary btn-small' <g:link controller="appointment" action="create" params="['person': personInstance?.id]"><i class="glyphicon glyphicon-plus"></i> Create Appointment</g:link>

<hr/>

</body>

</html>
