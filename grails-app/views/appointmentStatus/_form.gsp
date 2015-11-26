<%@ page import="PreConsent.AppointmentStatus" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentStatusInstance, field: 'appointmentStatusName', 'error')} ">
						<label for="appointmentStatusName" class="control-label"><g:message code="appointmentStatus.appointmentStatusName.label" default="Appointment Status Name" /><span class="required-indicator">*</span></label>
						<div>
							<g:textField class="form-control" name="appointmentStatusName" value="${appointmentStatusInstance?.appointmentStatusName}" required=""/>
							<span class="help-inline">${hasErrors(bean: appointmentStatusInstance, field: 'appointmentStatusName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>
