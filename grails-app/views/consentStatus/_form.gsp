<%@ page import="PreConsent.ConsentStatus" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: consentStatusInstance, field: 'consentStatusName', 'error')} ">
						<label for="consentStatusName" class="control-label"><g:message code="consentStatus.consentStatusName.label" default="Consent Status Name" /></label>
						<div>
							<g:textField class="form-control" name="consentStatusName" value="${consentStatusInstance?.consentStatusName}"/>
							<span class="help-inline">${hasErrors(bean: consentStatusInstance, field: 'consentStatusName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

