<%@ page import="PreConsent.Clinical_withdrawal" %>




            <div class="row">
                <div class="col-lg-6">
                    <label for="person" class="control-label"><g:message code="clinical_withdrawal.person.label" default="Person (enter surname or family identifier or NHS or MRN number)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'person', 'error')} required">
                        <g:if test="${clinical_withdrawalInstance?.person?.id}">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${clinical_withdrawalInstance?.person?.id}" />
                                <span class="help-inline">${hasErrors(bean: clinical_withdrawalInstance, field: 'person', 'error')}</span>
                            </div>
                        </g:if>
                        <g:else>
                            <richui:autoComplete class="form-control"  name="personName" action="${createLinkTo('dir': 'person/findPerson')}" value="${clinical_withdrawalInstance?.person}" onItemSelect="callPerson(id)"  />
                            <g:hiddenField id ="person" name ="person" value="${clinical_withdrawalInstance?.person?.id}"/>
                        </g:else>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="clinician" class="control-label"><g:message code="clinical_withdrawal.clinician.label" default="Clinician (enter forenames or surname or department)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: clinical_withdrawalInstance, field: 'clinician', 'error')} required">
                        <div>
                            <richui:autoComplete class="form-control"  name="clinicianName" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${clinical_withdrawalInstance?.clinician}" onItemSelect="callClinician(id)"  />
                            <g:hiddenField id ="clinician" name ="clinician" value="${clinical_withdrawalInstance?.clinician?.id}"/>
                        </div>
                    </div>
                </div>
            </div>

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

<g:javascript plugin="jquery" library="jquery" />
<script>
    function callPerson(person){
        document.getElementById('person').value = person;
    }

    function callClinician(clinician){
        document.getElementById('clinician').value = clinician;
    }
</script>


