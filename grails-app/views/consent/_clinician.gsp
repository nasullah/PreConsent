

            <label for="clinician" class="control-label"><g:message code="approach.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
            <div class="${hasErrors(bean: consentInstance, field: 'clinician', 'error')} required">
                <div>
                    <g:select class="form-control" id="clinician" name="clinician.id" size="1" from="${listClinician}" optionKey="id" required="" value="${consentInstance?.clinician?.id}"/>
                    <span class="help-inline">${hasErrors(bean: consentInstance, field: 'clinician', 'error')}</span>
                </div>
            </div>