<%@ page import="PreConsent.ComplaintStatus" %>




			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: complaintStatusInstance, field: 'complaintStatusName', 'error')} ">
						<label for="complaintStatusName" class="control-label"><g:message code="complaintStatus.complaintStatusName.label" default="Complaint Status Name" /></label>
						<div>
							<g:textField class="form-control" name="complaintStatusName" value="${complaintStatusInstance?.complaintStatusName}"/>
							<span class="help-inline">${hasErrors(bean: complaintStatusInstance, field: 'complaintStatusName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

