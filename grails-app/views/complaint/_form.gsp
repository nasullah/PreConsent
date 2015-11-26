<%@ page import="PreConsent.Complaint" %>



            <g:if test="${!complaintInstance?.person?.id}">
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

            <g:if test="${complaintInstance?.person?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="person" class="control-label"><g:message code="approach.person.label" default="Person" /><span class="required-indicator">*</span></label>
                        <div class="${hasErrors(bean: complaintInstance, field: 'person', 'error')} required">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${complaintInstance?.person?.id}"/>
                                <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'person', 'error')}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>

            <g:if test="${!complaintInstance?.clinician?.id}">
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

            <g:if test="${complaintInstance?.clinician?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="person" class="control-label"><g:message code="approach.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
                        <div class="${hasErrors(bean: complaintInstance, field: 'clinician', 'error')} required">
                            <div>
                                <g:select class="form-control" id="clinician" name="clinician.id" size="1" from="${PreConsent.Clinician.list()}" optionKey="id" required="" value="${complaintInstance?.clinician?.id}"/>
                                <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'clinician', 'error')}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: complaintInstance, field: 'date', 'error')} required">
                        <label for="date" class="control-label"><g:message code="complaint.date.label" default="Date" /><span class="required-indicator">*</span></label>
                        <div>
                            <bs:datePicker name="date" precision="day"  value="${complaintInstance?.date}"  />
                            <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'date', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: complaintInstance, field: 'mode', 'error')} required">
                        <label for="mode" class="control-label"><g:message code="complaint.mode.label" default="Mode" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="mode" name="mode.id" size="1" from="${PreConsent.ContactMode.list()}" optionKey="id" required="" value="${complaintInstance?.mode?.id}" noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'mode', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: complaintInstance, field: 'notes', 'error')} ">
                        <label for="notes" class="control-label"><g:message code="complaint.notes.label" default="Notes" /></label>
                        <div>
                            <g:textArea class="form-control" name="notes" cols="40" rows="4" value="${complaintInstance?.notes}"/>
                            <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'notes', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: complaintInstance, field: 'complaintSummary', 'error')} ">
                        <label for="complaintSummary" class="control-label"><g:message code="complaint.complaintSummary.label" default="Complaint Summary" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textField class="form-control" name="complaintSummary" value="${complaintInstance?.complaintSummary}" required=""/>
                            <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'complaintSummary', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: complaintInstance, field: 'complaintStatus', 'error')} required">
                        <label for="complaintStatus" class="control-label"><g:message code="complaint.complaintStatus.label" default="Status" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="complaintStatus" name="complaintStatus.id" size="1" from="${PreConsent.ComplaintStatus.list()}" optionKey="id" required="" value="${complaintInstance?.complaintStatus?.id}"/>
                            <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'complaintStatus', 'error')}</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: complaintInstance, field: 'resolutionNotes', 'error')} ">
                        <label for="resolutionNotes" class="control-label"><g:message code="complaint.resolutionNotes.label" default="Resolution Notes" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textArea class="form-control" name="resolutionNotes" cols="40" rows="4" value="${complaintInstance?.resolutionNotes}" required=""/>
                            <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'resolutionNotes', 'error')}</span>
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
        ${remoteFunction (controller: 'complaint',
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
        ${remoteFunction (controller: 'complaint',
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

