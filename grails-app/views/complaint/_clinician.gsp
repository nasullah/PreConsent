


            <label for="person" class="control-label"><g:message code="approach.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
            <div class="${hasErrors(bean: complaintInstance, field: 'clinician', 'error')} required">
                <div>
                    <g:select class="form-control" id="clinician" name="clinician.id" size="1" from="${listClinician}" optionKey="id" required="" value="${complaintInstance?.clinician?.id}"/>
                    <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'clinician', 'error')}</span>
                </div>
            </div>