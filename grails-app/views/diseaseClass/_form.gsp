<%@ page import="PreConsent.DiseaseClass" %>



				<div class="row">
					<div class="col-lg-6">
						<div class="${hasErrors(bean: diseaseClassInstance, field: 'diseaseClassName', 'error')} ">
							<label for="diseaseClassName" class="control-label"><g:message code="diseaseClass.diseaseClassName.label" default="Disease Class Name" /></label>
							<div>
								<g:textField class="form-control" name="diseaseClassName" value="${diseaseClassInstance?.diseaseClassName}"/>
								<span class="help-inline">${hasErrors(bean: diseaseClassInstance, field: 'diseaseClassName', 'error')}</span>
							</div>
						</div>
					</div>
				</div>

