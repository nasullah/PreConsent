<%@ page import="PreConsent.Telephone_number" %>



			<div class="${hasErrors(bean: telephone_numberInstance, field: 'contactDetails', 'error')} required">
				<label for="contactDetails" class="control-label"><g:message code="telephone_number.contactDetails.label" default="Contact Details" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="contactDetails" name="contactDetails.id" from="${PreConsent.Contact_details.list()}" optionKey="id" required="" value="${telephone_numberInstance?.contactDetails?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: telephone_numberInstance, field: 'contactDetails', 'error')}</span>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: telephone_numberInstance, field: 'telephoneNumber', 'error')} ">
						<label for="telephoneNumber" class="control-label"><g:message code="telephone_number.telephoneNumber.label" default="Telephone Number" /></label>
						<div>
							<g:textField class="form-control" name="telephoneNumber" value="${telephone_numberInstance?.telephoneNumber}"/>
							<span class="help-inline">${hasErrors(bean: telephone_numberInstance, field: 'telephoneNumber', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

