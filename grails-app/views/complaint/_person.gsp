

            <label for="person" class="control-label"><g:message code="approach.person.label" default="Person" /><span class="required-indicator">*</span></label>
            <div class="${hasErrors(bean: complaintInstance, field: 'person', 'error')} required">
                <div>
                    <g:select class="form-control" id="person" name="person" size="1" from="${listPerson}" optionKey="id" required="" value="${complaintInstance?.person?.id}"/>
                    <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'person', 'error')}</span>
                </div>
            </div>