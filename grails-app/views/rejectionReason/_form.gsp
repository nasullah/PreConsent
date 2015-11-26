<%@ page import="PreConsent.RejectionReason" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: rejectionReasonInstance, field: 'rejectionReasonName', 'error')} ">
						<label for="rejectionReasonName" class="control-label"><g:message code="rejectionReason.rejectionReasonName.label" default="Rejection Reason Name" /></label>
						<div>
							<g:textField class="form-control" name="rejectionReasonName" value="${rejectionReasonInstance?.rejectionReasonName}"/>
							<span class="help-inline">${hasErrors(bean: rejectionReasonInstance, field: 'rejectionReasonName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

