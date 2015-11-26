


            <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'person', 'error')} required">
                <div>
                    <g:select class="form-control" id="person" name="person" size="1" from="${getPerson}" optionKey="id" required="" value="${clinical_withdrawalInstance?.person?.id}" />
                    <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'person', 'error')}</span>
                </div>
            </div>