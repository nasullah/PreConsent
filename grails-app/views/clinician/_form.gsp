<%@ page import="PreConsent.Clinician" %>



            <div class="row">
                <div class="col-lg-6">
                    <div class="${hasErrors(bean: clinicianInstance, field: 'forenames', 'error')} ">
                        <label for="forenames" class="control-label"><g:message code="clinician.forenames.label" default="Forenames" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textField class="form-control" name="forenames" value="${clinicianInstance?.forenames}" required=""/>
                            <span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'forenames', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: clinicianInstance, field: 'surname', 'error')} ">
                        <label for="surname" class="control-label"><g:message code="clinician.surname.label" default="Surname" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textField class="form-control" name="surname" value="${clinicianInstance?.surname}" required=""/>
                            <span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'surname', 'error')}</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="${hasErrors(bean: clinicianInstance, field: 'department', 'error')} ">
                        <label for="department" class="control-label"><g:message code="clinician.department.label" default="Department" /><span class="required-indicator">*</span></label>
                        <div>
                            <g:textField class="form-control" name="department" value="${clinicianInstance?.department}" required=""/>
                            <span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'department', 'error')}</span>
                        </div>
                    </div>
                </div>
            </div>

			%{--<div class="${hasErrors(bean: clinicianInstance, field: 'interactions', 'error')} ">--}%
				%{--<label for="interactions" class="control-label"><g:message code="clinician.interactions.label" default="Interactions" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${clinicianInstance?.interactions?}" var="i">--}%
    %{--<li><g:link controller="interaction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="interaction" action="create" params="['clinician.id': clinicianInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'interaction.label', default: 'Interaction')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'interactions', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

