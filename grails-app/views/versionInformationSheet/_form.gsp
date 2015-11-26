<%@ page import="PreConsent.VersionInformationSheet" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: versionInformationSheetInstance, field: 'versionInformationSheet', 'error')} ">
						<label for="versionInformationSheet" class="control-label"><g:message code="versionInformationSheet.versionInformationSheet.label" default="Version Information Sheet" /></label>
						<div>
							<g:textField class="form-control" name="versionInformationSheet" value="${versionInformationSheetInstance?.versionInformationSheet}"/>
							<span class="help-inline">${hasErrors(bean: versionInformationSheetInstance, field: 'versionInformationSheet', 'error')}</span>
						</div>
					</div>
				</div>
			</div>


