<%@ page import="PreConsent.Clinical_withdrawal" %>





            <g:if test="${!clinical_withdrawalInstance?.person?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="person" class="control-label"><g:message code="approach.person.label" default="Find Person" /><span class="required-indicator">*</span></label>
                        <div class="input-group">
                            <g:textField type="text" id="searchPerson" name="searchPerson" class="form-control"  placeholder="Enter person's surname or Family Identifier or NHS or MRN number" required="" ></g:textField>
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-success" value="Find" onClick= 'getPerson()'><span class="glyphicon glyphicon-search"></span> Find</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div id="selectPerson"></div>
                    </div>
                </div>
            </g:if>

            <g:if test="${clinical_withdrawalInstance?.person?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="person" class="control-label"><g:message code="approach.person.label" default="Person" /><span class="required-indicator">*</span></label>
                        <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'person', 'error')} required">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${clinical_withdrawalInstance?.person?.id}" />
                                <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'person', 'error')}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>

            <g:if test="${!clinical_withdrawalInstance?.clinician?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="person" class="control-label"><g:message code="approach.clinician.label" default="Find Clinician" /><span class="required-indicator">*</span></label>
                        <div class="input-group">
                            <g:textField type="text" id="searchClinician" name="searchClinician" class="form-control"  placeholder="Enter clinician's surname or forenames or department" required="" ></g:textField>
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-success" value="Find" onClick= 'getClinician()'><span class="glyphicon glyphicon-search"></span> Find</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div id="selectClinician"></div>
                    </div>
                </div>
            </g:if>

            <g:if test="${clinical_withdrawalInstance?.clinician?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="clinician" class="control-label"><g:message code="approach.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
                        <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'clinician', 'error')} required">
                            <div>
                                <g:select class="form-control" id="clinician" name="clinician.id" size="1" from="${PreConsent.Clinician.list()}" optionKey="id" required="" value="${clinical_withdrawalInstance?.clinician?.id}"/>
                                <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'clinician', 'error')}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'date', 'error')} required">
                        <label for="date" class="control-label"><g:message code="clinical_withdrawal.date.label" default="Date" /><span class="required-indicator">*</span></label>
                        <div>
                            <bs:datePicker name="date" precision="day"  value="${clinical_withdrawalInstance?.date}"  />
                            <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'date', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'mode', 'error')} required">
                        <label for="mode" class="control-label"><g:message code="clinical_withdrawal.mode.label" default="Mode" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="mode" name="mode.id" size="1" from="${PreConsent.ContactMode.list()}" optionKey="id" required="" value="${clinical_withdrawalInstance?.mode?.id}" noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'mode', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'notes', 'error')} ">
                        <label for="notes" class="control-label"><g:message code="clinical_withdrawal.notes.label" default="Notes" /></label>
                        <div>
                            <g:textArea class="form-control" name="notes" cols="40" rows="5" value="${clinical_withdrawalInstance?.notes}"/>
                            <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'notes', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'reason', 'error')} required">
                        <label for="reason" class="control-label"><g:message code="clinical_withdrawal.reason.label" default="Reason" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="reason" name="reason.id" size="1" from="${PreConsent.RejectionReason.list()}" optionKey="id" required="" value="${clinical_withdrawalInstance?.reason?.id}" noSelection="['': '- Choose -']" />
                            <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'reason', 'error')}</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="clinicianNotFound">
                <div class="modal-dialog" style="position: absolute; left: 0%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Not Found!</h4>
                        </div>
                        <div class="modal-body">
                            <p>No clinician found! </p>
                        </div>
                        <div class="modal-footer">
                            <a class='btn btn-primary btn-small' <g:link controller="clinician" action="create" ><i class="glyphicon glyphicon-plus"></i> ${message(code: 'default.add.label', args: [message(code: 'clinician.label', default: 'Clinician')])}</g:link>
                            <button type="button" class="btn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="personNotFound">
                <div class="modal-dialog" style="position: absolute; left: 0%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Not Found!</h4>
                        </div>
                        <div class="modal-body">
                            <p>No clinician found! </p>
                        </div>
                        <div class="modal-footer">
                            <a class='btn btn-primary btn-small' <g:link controller="clinician" action="create" ><i class="glyphicon glyphicon-plus"></i> ${message(code: 'default.add.label', args: [message(code: 'clinician.label', default: 'Clinician')])}</g:link>
                            <button type="button" class="btn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

<g:javascript plugin="jquery" library="jquery" />
<script>
    function getClinician(){
        ${remoteFunction (controller: 'clinical_withdrawal',
                        action: 'findClinician',
                        params: '"searchClinician=" + $("#searchClinician").val()',
                        update: 'selectClinician',
                        onFailure:'clinicianError()'
                )}
    }

    function clinicianError(){
        var select = $("#selectClinician");
        select.empty().append("Clinician not found");
        $('#clinicianNotFound').modal()
    }

    function getPerson(){
        ${remoteFunction (controller: 'clinical_withdrawal',
                        action: 'findPerson',
                        params: '"searchPerson=" + $("#searchPerson").val()',
                        update: 'selectPerson',
                        onFailure:'personError()'
                )}
    }

    function personError(){
        var select = $("#selectPerson");
        select.empty().append("Person not found");
        $('#personNotFound').modal()
    }
</script>


