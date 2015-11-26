<%@ page import="PreConsent.ContactMode" %>




			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: contactModeInstance, field: 'contactModeName', 'error')} ">
						<label for="contactModeName" class="control-label"><g:message code="contactMode.contactModeName.label" default="Contact Mode Name" /></label>
						<div>
							<g:textField class="form-control" name="contactModeName" value="${contactModeInstance?.contactModeName}"/>
							<span class="help-inline">${hasErrors(bean: contactModeInstance, field: 'contactModeName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

