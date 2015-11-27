<%@ page import="PreConsent.Exit_interview" %>



            <div class="row">
                <div class="col-lg-6">
                    <label for="person" class="control-label"><g:message code="exit_interview.person.label" default="Person (enter surname or family identifier or NHS or MRN number)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: exit_interviewInstance, field: 'person', 'error')} required">
                        <g:if test="${exit_interviewInstance?.person?.id}">
                            <div>
                                <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${exit_interviewInstance?.person?.id}" />
                                <span class="help-inline">${hasErrors(bean: exit_interviewInstance, field: 'person', 'error')}</span>
                            </div>
                        </g:if>
                        <g:else>
                            <richui:autoComplete class="form-control"  name="personName" action="${createLinkTo('dir': 'person/findPerson')}" value="${exit_interviewInstance?.person}" onItemSelect="callPerson(id)"  />
                            <g:hiddenField id ="person" name ="person" value="${exit_interviewInstance?.person?.id}"/>
                        </g:else>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="clinician" class="control-label"><g:message code="exit_interview.clinician.label" default="Clinician (enter forenames or surname or department)" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: exit_interviewInstance, field: 'clinician', 'error')} required">
                        <div>
                            <richui:autoComplete class="form-control"  name="clinicianName" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${exit_interviewInstance?.clinician}" onItemSelect="callClinician(id)"  />
                            <g:hiddenField id ="clinician" name ="clinician" value="${exit_interviewInstance?.clinician?.id}"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: exit_interviewInstance, field: 'date', 'error')} required">
                        <label for="date" class="control-label"><g:message code="exit_interview.date.label" default="Date" /><span class="required-indicator">*</span></label>
                        <div>
                            <bs:datePicker name="date" precision="day"  value="${exit_interviewInstance?.date}"  />
                            <span class="help-inline">${hasErrors(bean: exit_interviewInstance, field: 'date', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: exit_interviewInstance, field: 'mode', 'error')} required">
                        <label for="mode" class="control-label"><g:message code="exit_interview.mode.label" default="Mode" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="mode" name="mode.id" size="1" from="${PreConsent.ContactMode.list()}" optionKey="id" required="" value="${exit_interviewInstance?.mode?.id}" noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: exit_interviewInstance, field: 'mode', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: exit_interviewInstance, field: 'notes', 'error')} ">
                        <label for="notes" class="control-label"><g:message code="exit_interview.notes.label" default="Notes" /></label>
                        <div>
                            <g:textArea class="form-control" name="notes" cols="40" rows="5" value="${exit_interviewInstance?.notes}"/>
                            <span class="help-inline">${hasErrors(bean: exit_interviewInstance, field: 'notes', 'error')}</span>
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







