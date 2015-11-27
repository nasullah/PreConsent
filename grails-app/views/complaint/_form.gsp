<%@ page import="PreConsent.Complaint" %>



            <div class="row">
                <div class="col-lg-6">
                    <label for="person" class="control-label"><g:message code="complaint.person.label" default="Person (enter surname or family identifier or NHS or MRN number)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: complaintInstance, field: 'person', 'error')} required">
                        <g:if test="${complaintInstance?.person?.id}">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${complaintInstance?.person?.id}" />
                                <span class="help-inline">${hasErrors(bean: complaintInstance, field: 'person', 'error')}</span>
                            </div>
                        </g:if>
                        <g:else>
                            <richui:autoComplete class="form-control"  name="personName" action="${createLinkTo('dir': 'person/findPerson')}" value="${complaintInstance?.person}" onItemSelect="callPerson(id)"  />
                            <g:hiddenField id ="person" name ="person" value="${complaintInstance?.person?.id}"/>
                        </g:else>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="clinician" class="control-label"><g:message code="complaint.clinician.label" default="Clinician (enter forenames or surname or department)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: complaintInstance, field: 'clinician', 'error')} required">
                        <div>
                            <richui:autoComplete class="form-control"  name="clinicianName" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${complaintInstance?.clinician}" onItemSelect="callClinician(id)"  />
                            <g:hiddenField id ="clinician" name ="clinician" value="${complaintInstance?.clinician?.id}"/>
                        </div>
                    </div>
                </div>
            </div>

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

<g:javascript plugin="jquery" library="jquery" />
<script>
    function callClinician(clinician){
        document.getElementById('clinician').value = clinician;
    }

    function callPerson(person){
        document.getElementById('person').value = person;
    }
</script>

