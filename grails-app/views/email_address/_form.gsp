<%@ page import="PreConsent.Email_address" %>



			<div class="${hasErrors(bean: email_addressInstance, field: 'contactDetails', 'error')} required">
				<label for="contactDetails" class="control-label"><g:message code="email_address.contactDetails.label" default="Contact Details" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="contactDetails" name="contactDetails.id" from="${PreConsent.Contact_details.list()}" optionKey="id" required="" value="${email_addressInstance?.contactDetails?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: email_addressInstance, field: 'contactDetails', 'error')}</span>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: email_addressInstance, field: 'emailAddress', 'error')} ">
						<label for="emailAddress" class="control-label"><g:message code="email_address.emailAddress.label" default="Email Address" /></label>
						<div>
							<g:textField class="form-control" name="emailAddress" value="${email_addressInstance?.emailAddress}"/>
							<span class="help-inline">${hasErrors(bean: email_addressInstance, field: 'emailAddress', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

