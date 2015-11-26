

            <label for="person" class="control-label"><g:message code="approach.person.label" default="Person" /><span class="required-indicator">*</span></label>
            <div class="${hasErrors(bean: consentInstance, field: 'person', 'error')} required">
                <div>
                    <g:select class="form-control" id="person" name="person" size="1" from="${getPerson}" optionKey="id" required="" value="${consentInstance?.person?.id}"/>
                    <span class="help-inline">${hasErrors(bean: consentInstance, field: 'person', 'error')}</span>
                </div>
            </div>