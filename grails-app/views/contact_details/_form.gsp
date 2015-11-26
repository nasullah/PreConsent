<%@ page import="PreConsent.Contact_details" %>




			<div class="${hasErrors(bean: contact_detailsInstance, field: 'person', 'error')} required">
				<label for="person" class="control-label"><g:message code="contact_details.person.label" default="Person" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="person" name="person.id" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${contact_detailsInstance?.person?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: contact_detailsInstance, field: 'person', 'error')}</span>
				</div>
			</div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: contact_detailsInstance, field: 'address', 'error')} ">
                        <label for="address" class="control-label"><g:message code="contact_details.address.label" default="Address" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textArea class="form-control" name="address" cols="40" rows="4" value="${contact_detailsInstance?.address}" required=""/>
                            <span class="help-inline">${hasErrors(bean: contact_detailsInstance, field: 'address', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: contact_detailsInstance, field: 'postalCode', 'error')} ">
                        <label for="postalCode" class="control-label"><g:message code="contact_details.postalCode.label" default="Postal Code" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textField class="form-control" name="postalCode" value="${contact_detailsInstance?.postalCode}" required=""/>
                            <span class="help-inline">${hasErrors(bean: contact_detailsInstance, field: 'postalCode', 'error')}</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: contact_detailsInstance, field: 'fromDate', 'error')} required">
                        <label for="fromDate" class="control-label"><g:message code="contact_details.fromDate.label" default="From Date" /><span class="required-indicator">*</span></label>
                        <div>
                            <bs:datePicker name="fromDate" precision="day"  value="${contact_detailsInstance?.fromDate}"  />
                            <span class="help-inline">${hasErrors(bean: contact_detailsInstance, field: 'fromDate', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: contact_detailsInstance, field: 'to_date', 'error')} required">
                        <label for="to_date" class="control-label"><g:message code="contact_details.to_date.label" default="To Date" /></label>
                        <div>
                            <bs:datePicker name="to_date" precision="day"  value="${contact_detailsInstance?.to_date}" default="none"  />
                            <span class="help-inline">${hasErrors(bean: contact_detailsInstance, field: 'to_date', 'error')}</span>
                        </div>
                    </div>
                </div>

                <g:if test="${!contact_detailsInstance?.emailAddress && !contact_detailsInstance?.telephoneNumber}">
                    <div class="col-lg-6">
                        <div class="${hasErrors(bean: contact_detailsInstance?.emailAddress, field: 'emailAddress', 'error')} ">
                            <label for="emailAddress" class="control-label"><g:message code="contact_details.emailAddress.label" default="Email Address" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:textField class="form-control" name="emailAddress1"/>
                                <span class="help-inline">${hasErrors(bean: contact_detailsInstance?.emailAddress, field: 'emailAddress', 'error')}</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="${hasErrors(bean: contact_detailsInstance?.telephoneNumber, field: 'telephoneNumber', 'error')} ">
                            <label for="telephoneNumber" class="control-label"><g:message code="contact_details.telephoneNumber.label" default="Telephone Number" /><span class="required-indicator">*</span></label>
                            <div>
                                <g:textField class="form-control" name="telephoneNumber1"/>
                                <span class="help-inline">${hasErrors(bean: contact_detailsInstance?.telephoneNumber, field: 'telephoneNumber', 'error')}</span>
                            </div>
                        </div>
                    </div>
                </g:if>
            </div>



