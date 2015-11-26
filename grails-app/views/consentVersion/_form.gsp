<%@ page import="PreConsent.ConsentVersion" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: consentVersionInstance, field: 'consentVersionName', 'error')} ">
						<label for="consentVersionName" class="control-label"><g:message code="consentVersion.consentVersionName.label" default="Consent Version Name" /></label>
						<div>
							<g:textField class="form-control" name="consentVersionName" value="${consentVersionInstance?.consentVersionName}"/>
							<span class="help-inline">${hasErrors(bean: consentVersionInstance, field: 'consentVersionName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

