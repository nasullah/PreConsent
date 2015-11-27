<%@ page import="PreConsent.Patient_withdraw" %>



            <div class="row">
                <div class="col-lg-6">
                    <label for="person" class="control-label"><g:message code="patient_withdraw.person.label" default="Person (enter surname or family identifier or NHS or MRN number)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'person', 'error')} required">
                        <g:if test="${patient_withdrawInstance?.person?.id}">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${patient_withdrawInstance?.person?.id}" />
                                <span class="help-inline">${hasErrors(bean: patient_withdrawInstance, field: 'person', 'error')}</span>
                            </div>
                        </g:if>
                        <g:else>
                            <richui:autoComplete class="form-control"  name="personName" action="${createLinkTo('dir': 'person/findPerson')}" value="${patient_withdrawInstance?.person}" onItemSelect="callPerson(id)"  />
                            <g:hiddenField id ="person" name ="person" value="${patient_withdrawInstance?.person?.id}"/>
                        </g:else>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="clinician" class="control-label"><g:message code="patient_withdraw.clinician.label" default="Clinician (enter forenames or surname or department)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'clinician', 'error')} required">
                        <div>
                            <richui:autoComplete class="form-control"  name="clinicianName" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${patient_withdrawInstance?.clinician}" onItemSelect="callClinician(id)"  />
                            <g:hiddenField id ="clinician" name ="clinician" value="${patient_withdrawInstance?.clinician?.id}"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'date', 'error')} required">
                        <label for="date" class="control-label"><g:message code="patient_withdraw.date.label" default="Date" /><span class="required-indicator">*</span></label>
                        <div>
                            <bs:datePicker name="date" precision="day"  value="${patient_withdrawInstance?.date}"  />
                            <span class="help-inline">${hasErrors(bean: patient_withdrawInstance, field: 'date', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'mode', 'error')} required">
                        <label for="mode" class="control-label"><g:message code="patient_withdraw.mode.label" default="Mode" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="mode" name="mode.id" size="1" from="${PreConsent.ContactMode.list()}" optionKey="id" required="" value="${patient_withdrawInstance?.mode?.id}"  noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: patient_withdrawInstance, field: 'mode', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'notes', 'error')} ">
                        <label for="notes" class="control-label"><g:message code="patient_withdraw.notes.label" default="Notes" /></label>
                        <div>
                            <g:textArea class="form-control" name="notes" cols="40" rows="4" value="${patient_withdrawInstance?.notes}"/>
                            <span class="help-inline">${hasErrors(bean: patient_withdrawInstance, field: 'notes', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'consentForInterview', 'error')} ">
                        <label for="consentForInterview" class="control-label"><g:message code="patient_withdraw.consentForInterview.label" default="Consent For Interview" /></label>
                        <div>
                            %{--<bs:checkBox name="consentForInterview" value="${patient_withdrawInstance?.consentForInterview}" onLabel="Yes" offLabel="No"/>--}%
                            %{--<span class="help-inline">${hasErrors(bean: patient_withdrawInstance, field: 'consentForInterview', 'error')}</span>--}%
                            <label class="radio-inline"><input type="radio" name="consentForInterview" value="true" ${patient_withdrawInstance.consentForInterview == true ? 'checked="checked"' : ''}>Yes</label>
                            <label class="radio-inline"><input type="radio" name="consentForInterview" value="false" ${patient_withdrawInstance.consentForInterview == false ? 'checked="checked"' : ''}>No</label>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'okWithScience', 'error')} ">
                        <label for="okWithScience" class="control-label"><g:message code="patient_withdraw.okWithScience.label" default="Ok With Science" /></label>
                        <div>
                            <g:radioGroup name="okWithScience"
                                          values="[true, false, '']"
                                          labels="['Yes', 'No', 'No opinion expressed']"
                                          value="${patient_withdrawInstance?.okWithScience}">
                                ${it.radio}  ${it.label}
                            </g:radioGroup>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: patient_withdrawInstance, field: 'reason', 'error')} ">
                        <label for="reason" class="control-label"><g:message code="patient_withdraw.reason.label" default="Reason" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textField class="form-control" name="reason" value="${patient_withdrawInstance?.reason}" required=""/>
                            <span class="help-inline">${hasErrors(bean: patient_withdrawInstance, field: 'reason', 'error')}</span>
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
