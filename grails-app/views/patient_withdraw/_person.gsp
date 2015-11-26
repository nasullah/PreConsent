



            <label for="person" class="control-label"><g:message code="approach.person.label" default="Person" /><span class="required-indicator">*</span></label>
            <div class="${hasErrors(bean: patient_withdrawInstance, field: 'person', 'error')} required">
                <div>
                    <g:select class="form-control" id="person" name="person" size="1" from="${getPerson}" optionKey="id" required="" value="${patient_withdrawInstance?.person?.id}" class="many-to-one"/>
                    <span class="help-inline">${hasErrors(bean: patient_withdrawInstance, field: 'person', 'error')}</span>
                </div>
            </div>