<%@ page import="PreConsent.Consent" %>



            <div class="row">
                <div class="col-lg-6">
                    <label for="person" class="control-label"><g:message code="consent.person.label" default="Person (enter surname or family identifier or NHS or MRN number)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: consentInstance, field: 'person', 'error')} required">
                        <g:if test="${consentInstance?.person?.id}">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${consentInstance?.person?.id}" />
                                <span class="help-inline">${hasErrors(bean: consentInstance, field: 'person', 'error')}</span>
                            </div>
                        </g:if>
                        <g:else>
                            <richui:autoComplete class="form-control"  name="personName" action="${createLinkTo('dir': 'person/findPerson')}" value="${consentInstance?.person}" onItemSelect="callPerson(id)"  />
                            <g:hiddenField id ="person" name ="person" value="${consentInstance?.person?.id}"/>
                        </g:else>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="clinician" class="control-label"><g:message code="consent.clinician.label" default="Clinician (enter forenames or surname or department)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: consentInstance, field: 'clinician', 'error')} required">
                        <div>
                            <richui:autoComplete class="form-control"  name="clinicianName" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${consentInstance?.clinician}" onItemSelect="callClinician(id)"  />
                            <g:hiddenField id ="clinician" name ="clinician" value="${consentInstance?.clinician?.id}"/>
                        </div>
                    </div>
                </div>
            </div>

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

<g:javascript plugin="jquery" library="jquery" />
<script>
    function callClinician(clinician){
        document.getElementById('clinician').value = clinician;
    }

    function callPerson(person){
        document.getElementById('person').value = person;
    }

</script>



