<%@ page import="PreConsent.WithdrawStatus" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: withdrawStatusInstance, field: 'withdrawStatusName', 'error')} ">
						<label for="withdrawStatusName" class="control-label"><g:message code="withdrawStatus.withdrawStatusName.label" default="Withdraw Status Name" /></label>
						<div>
							<g:textField class="form-control" name="withdrawStatusName" value="${withdrawStatusInstance?.withdrawStatusName}"/>
							<span class="help-inline">${hasErrors(bean: withdrawStatusInstance, field: 'withdrawStatusName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

