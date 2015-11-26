<%@ page import="PreConsent.AppointmentType" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentTypeInstance, field: 'appointmentTypeName', 'error')} ">
						<label for="appointmentTypeName" class="control-label"><g:message code="appointmentType.appointmentTypeName.label" default="Appointment Type Name" /><span class="required-indicator">*</span></label>
						<div>
							<g:textField class="form-control" name="appointmentTypeName" value="${appointmentTypeInstance?.appointmentTypeName}" required=""/>
							<span class="help-inline">${hasErrors(bean: appointmentTypeInstance, field: 'appointmentTypeName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>
