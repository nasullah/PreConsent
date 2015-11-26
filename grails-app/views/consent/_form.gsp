<%@ page import="PreConsent.Consent" %>


            <g:if test="${!consentInstance?.person?.id}">
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

            <g:if test="${consentInstance?.person?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="person" class="control-label"><g:message code="approach.person.label" default="Person" /><span class="required-indicator">*</span></label>
                        <div class="${hasErrors(bean: consentInstance, field: 'person', 'error')} required">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${consentInstance?.person?.id}"/>
                                <span class="help-inline">${hasErrors(bean: consentInstance, field: 'person', 'error')}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>

            <g:if test="${!consentInstance?.clinician?.id}">
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

            <g:if test="${consentInstance?.clinician?.id}">
                <div class="row">
                    <div class="col-lg-6">
                        <label for="clinician" class="control-label"><g:message code="approach.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
                        <div class="${hasErrors(bean: consentInstance, field: 'clinician', 'error')} required">
                            <div>
                                <g:select class="form-control" id="clinician" name="clinician.id" size="1" from="${PreConsent.Clinician.list()}" optionKey="id" required="" value="${consentInstance?.clinician?.id}"/>
                                <span class="help-inline">${hasErrors(bean: consentInstance, field: 'clinician', 'error')}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: consentInstance, field: 'date', 'error')} required">
                        <label for="date" class="control-label"><g:message code="consent.date.label" default="Date" /><span class="required-indicator">*</span></label>
                        <div>
                            <bs:datePicker name="date" precision="day"  value="${consentInstance?.date}"  />
                            <span class="help-inline">${hasErrors(bean: consentInstance, field: 'date', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: consentInstance, field: 'mode', 'error')} required">
                        <label for="mode" class="control-label"><g:message code="consent.mode.label" default="Mode" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="mode" name="mode.id" size="1" from="${PreConsent.ContactMode.list()}" optionKey="id" required="" value="${consentInstance?.mode?.id}" noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: consentInstance, field: 'mode', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: consentInstance, field: 'notes', 'error')} ">
                        <label for="notes" class="control-label"><g:message code="consent.notes.label" default="Notes" /></label>
                        <div>
                            <g:textArea class="form-control" name="notes" cols="40" rows="4" value="${consentInstance?.notes}"/>
                            <span class="help-inline">${hasErrors(bean: consentInstance, field: 'notes', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: consentInstance, field: 'consentVersion', 'error')} ">
                        <label for="consentVersion" class="control-label"><g:message code="consent.consentVersion.label" default="Consent Version" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="consentVersion" name="consentVersion.id" size="1" from="${PreConsent.ConsentVersion.list()}" optionKey="id" required="" value="${consentInstance?.consentVersion?.id}" noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: consentInstance, field: 'consentVersion', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: consentInstance, field: 'incidentalFindings', 'error')} ">
                        <label for="incidentalFindings" class="control-label"><g:message code="consent.incidentalFindings.label" default="Incidental Findings" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:radioGroup name="incidentalFindings"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${consentInstance?.incidentalFindings}">
                                ${it.label}  ${it.radio}
                            </g:radioGroup>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: consentInstance, field: 'versionInformationSheet', 'error')} ">
                        <label for="versionInformationSheet" class="control-label"><g:message code="consent.versionInformationSheet.label" default="Version Information Sheet" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="versionInformationSheet" name="versionInformationSheet.id" size="1" from="${PreConsent.VersionInformationSheet.list()}" optionKey="id" required="" value="${consentInstance?.versionInformationSheet?.id}" noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: consentInstance, field: 'versionInformationSheet', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: consentInstance?.person, field: 'gelIdentifier', 'error')} ">
                        <label for="gelIdentifier" class="control-label"><g:message code="consent.person.gelIdentifier.label" default="Gel Identifier" /></label>
                        <div>
                            <g:textField class="form-control" name="gelIdentifier" value="${consentInstance?.person?.find{it?.id}?.gelIdentifier}"/>
                            <span class="help-inline">${hasErrors(bean: consentInstance?.person, field: 'gelIdentifier', 'error')}</span>
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
                            <p>No person found! </p>
                        </div>
                        <div class="modal-footer">
                            <a class='btn btn-primary btn-small' <g:link controller="person" action="create" ><i class="glyphicon glyphicon-plus"></i> ${message(code: 'default.add.label', args: [message(code: 'clinician.label', default: 'Person')])}</g:link>
                            <button type="button" class="btn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

<g:javascript plugin="jquery" library="jquery" />
<script>
    function getClinician(){
        ${remoteFunction (controller: 'consent',
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
        ${remoteFunction (controller: 'consent',
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



