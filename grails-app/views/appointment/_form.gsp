<%@ page import="PreConsent.AppointmentType; PreConsent.Appointment" %>
<ui:resources includeJQuery="true"/>


			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'person', 'error')} required">
						<label for="person" class="control-label"><g:message code="appointment.person.label" default="Person" /><span class="required-indicator">*</span></label>
						<div>
							<g:select class="form-control" id="person" name="person" size="1" from="${PreConsent.Person.list()}" optionKey="id" required="" value="${appointmentInstance?.person?.id}"/>
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'person', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<label for="person" class="control-label"> Add Other Family Members </label>
					<div>
						<button type="button" class="btn btn" value="Find" onClick= 'getFamilyMembers()'><span class="glyphicon glyphicon-plus"></span> Add</button>
					</div>
				</div>
			</div>

			<div id="selectPerson"></div>


			<g:if test="${!appointmentInstance?.clinician?.id}">
				<div class="row">
					<div class="col-lg-6">
						<label for="clinician" class="control-label"><g:message code="appointment.clinician.label" default="Find Clinician" /><span class="required-indicator">*</span></label>
						<div class="input-group">
							<g:textField type="text" id="searchClinician" name="searchClinician" class="form-control"  placeholder="Enter clinician's surname or forenames or department" required="" />
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

			<g:if test="${appointmentInstance?.clinician?.id}">
				<div class="row">
					<div class="col-lg-6">
						<label for="clinician" class="control-label"><g:message code="appointment.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
						<div class="${hasErrors(bean: appointmentInstance, field: 'clinician', 'error')} required">
							<div>
								<g:select class="form-control" id="clinician" name="clinician.id" size="1" from="${PreConsent.Clinician.list()}" optionKey="id" required="" value="${appointmentInstance?.clinician?.id}"  />
								<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'clinician', 'error')}</span>
							</div>
						</div>
					</div>
				</div>
			</g:if>

			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'date', 'error')} required">
						<label for="date" class="control-label"><g:message code="appointment.date.label" default="Date" /><span class="required-indicator">*</span></label>
						<div>
							<bs:datePicker name="date" precision="day"  value="${appointmentInstance?.date}" />
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'date', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'startTime', 'error')} ">
						<label for="startTime" class="control-label"><g:message code="appointment.startTime.label" default="Start Time" /></label>
						<div>
							<g:field type="time" class="form-control" name="startTime" value="${appointmentInstance?.startTime}" required="" />
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'startTime', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'endTime', 'error')} ">
						<label for="endTime" class="control-label"><g:message code="appointment.endTime.label" default="End Time" /></label>
						<div>
							<g:field type="time" class="form-control" name="endTime" value="${appointmentInstance?.endTime}" required=""/>
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'endTime', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'notes', 'error')} ">
						<label for="notes" class="control-label"><g:message code="appointment.notes.label" default="Notes" /></label>
						<div>
							<g:textArea class="form-control" name="notes" cols="40" rows="4" value="${appointmentInstance?.notes}"/>
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'notes', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'status', 'error')} required">
						<label for="status" class="control-label"><g:message code="appointment.status.label" default="Status" /><span class="required-indicator">*</span></label>
						<div>
							<g:select class="form-control" id="status" name="status.id" from="${PreConsent.AppointmentStatus.list()}" optionKey="id" required="" value="${appointmentInstance?.status?.id}"/>
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'status', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'location', 'error')} ">
						<label for="location" class="control-label"><g:message code="appointment.location.label" default="Location" /></label>
						<div>
							<g:field  type="text" name="location" class="form-control"/>
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'location', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="">
						<label for="location" class="control-label">Type</label>
						<div>
							<ui:multiSelect
									class="form-control"
									name="types"
									multiple="yes"
									from="${PreConsent.AppointmentType.list()}"
									value="${appointmentInstance.type}"
									noSelection="['':'-Choose-']" />
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'types', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: appointmentInstance, field: 'mode', 'error')} required">
						<label for="mode" class="control-label"><g:message code="appointment.mode.label" default="Mode" /><span class="required-indicator">*</span></label>
						<div>
							<g:select class="form-control" id="mode" name="mode.id" from="${PreConsent.ContactMode.list()}" optionKey="id" required="" value="${appointmentInstance?.mode?.id}"/>
							<span class="help-inline">${hasErrors(bean: appointmentInstance, field: 'mode', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

<g:javascript plugin="jquery" library="jquery" />
<script>
//	$('#familyMembers').hide();
	function askIfCreateAppointment(){
		var selectedDate = new Date($("#date").val());
		var today = new Date();
		if (selectedDate > today){
			$('#createAppointment').modal()
		}

	}
	function getClinician(){
		${remoteFunction (controller: 'engage',
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

	function getFamilyMembers(){
		${remoteFunction (controller: 'appointment',
							action: 'findFamilyMember',
							params: '"person=" + $("#person").val()',
							update: 'selectPerson',
							onFailure:'error()'
					)}
	}

	function error(){
		var select = $("#selectPerson");
		select.empty().append("Not found");
	}
</script>