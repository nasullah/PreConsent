<%@ page import="PreConsent.IdentificationMethod" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: identificationMethodInstance, field: 'identificationMethodName', 'error')} ">
						<label for="identificationMethodName" class="control-label"><g:message code="identificationMethod.identificationMethodName.label" default="Identification Method Name" /></label>
						<div>
							<g:textField class="form-control" name="identificationMethodName" value="${identificationMethodInstance?.identificationMethodName}"/>
							<span class="help-inline">${hasErrors(bean: identificationMethodInstance, field: 'identificationMethodName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

