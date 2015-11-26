<%@ page import="PreConsent.Engage" %>




            <div class="row">
                <div class="col-lg-6">
                    <label for="person" class="control-label"><g:message code="approach.person.label" default="Person" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: engageInstance, field: 'person', 'error')} required">
                        <div>
                            <g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${engageInstance?.person?.id}"/>
                            <span class="help-inline">${hasErrors(bean: engageInstance, field: 'person', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="clinician" class="control-label"><g:message code="approach.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
                    <div class="${hasErrors(bean: engageInstance, field: 'clinician', 'error')} required">
                        <div>
                            <richui:autoComplete class="form-control"  name="clinicianName" action="${createLinkTo('dir': 'engage/findClinician')}" value="${engageInstance?.clinician}" onItemSelect="callClinician(id)"  />
                            <g:hiddenField id ="clinician" name ="clinician" value="${engageInstance?.clinician?.id}"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: engageInstance, field: 'date', 'error')} required">
                        <label for="date" class="control-label"><g:message code="engage.date.label" default="Date" /><span class="required-indicator">*</span></label>
                        <div>
                            <bs:datePicker id="date" name="date" precision="day"  value="${engageInstance?.date}" />
                            <span class="help-inline">${hasErrors(bean: engageInstance, field: 'date', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: engageInstance, field: 'mode', 'error')} required">
                        <label for="mode" class="control-label"><g:message code="engage.mode.label" default="Mode" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:select class="form-control" id="mode" name="mode.id" size="1" from="${PreConsent.ContactMode.list()}" optionKey="id" required="" value="${engageInstance?.mode?.id}" onchange="askIfCreateAppointment()" noSelection="['': '- Choose -']"/>
                            <span class="help-inline">${hasErrors(bean: engageInstance, field: 'mode', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: engageInstance, field: 'notes', 'error')} ">
                        <label for="notes" class="control-label"><g:message code="engage.notes.label" default="Notes" /></label>
                        <div>
                            <g:textArea class="form-control" name="notes" cols="40" rows="5" value="${engageInstance?.notes}"/>
                            <span class="help-inline">${hasErrors(bean: engageInstance, field: 'notes', 'error')}</span>
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

            <div class="modal fade" id="createAppointment">
                <div class="modal-dialog" style="position: absolute; left: 0%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Create appointment</h4>
                        </div>
                        <div class="modal-body">
                            <p>Would like to create appointment in your diary?</p>
                        </div>
                        <div class="modal-footer">
                            %{--<a class='btn btn-primary btn-small' <g:link controller="engage" action="createAppointment" ><i class="glyphicon glyphicon-plus"></i> Create Appointment</g:link>--}%
                            <button type="button" class="btn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

<g:javascript plugin="jquery" library="jquery" />
<script>
    function askIfCreateAppointment(){
        var selectedDate = new Date($("#date").val());
        var today = new Date();
        if (selectedDate > today){
            $('#createAppointment').modal()
        }

    }

    function callClinician(clinician){
        document.getElementById('clinician').value = clinician;
    }
</script>



