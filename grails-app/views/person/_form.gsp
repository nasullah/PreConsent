<%@ page import="PreConsent.Person" %>



<div class="row">
    <div class="col-lg-6">
        <div class="${hasErrors(bean: personInstance, field: 'nhsNumber', 'error')} ">
            <label for="nhsNumber" class="control-label"><g:message code="person.nhsNumber.label" default="NHS Number" /></label>
            <div>
                <g:textField class="form-control" name="nhsNumber" value="${personInstance?.nhsNumber}"/>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'nhsNumber', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="${hasErrors(bean: personInstance, field: 'mrnNumber', 'error')} ">
            <label for="mrnNumber" class="control-label"><g:message code="person.mrnNumber.label" default="MRN Number" /></label>
            <div>
                <g:textField class="form-control" name="mrnNumber" value="${personInstance?.mrnNumber}"/>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'mrnNumber', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="${hasErrors(bean: personInstance, field: 'dateOfBirth', 'error')} ">
            <label for="dateOfBirth" class="control-label"><g:message code="person.dateOfBirth.label" default="Date of Birth" /></label>
            <div>
                <bs:datePicker name="dateOfBirth" precision="day"  value="${personInstance?.dateOfBirth}" default="none" noSelection="['': '']" />
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'dateOfBirth', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="${hasErrors(bean: personInstance, field: 'surname', 'error')} ">
            <label for="surname" class="control-label"><g:message code="person.surname.label" default="Surname" /><span class="required-indicator">*</span></label>
            <div>
                <g:textField class="form-control" name="surname" value="${personInstance?.surname}" required=""/>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'surname', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="${hasErrors(bean: personInstance, field: 'forenames', 'error')} ">
            <label for="forenames" class="control-label"><g:message code="person.forenames.label" default="Forenames" /></label>
            <div>
                <g:textField class="form-control" name="forenames" value="${personInstance?.forenames}"/>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'forenames', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="${hasErrors(bean: personInstance, field: 'disease', 'error')} required">
            <label for="disease" class="control-label"><g:message code="person.disease.label" default="Disease" /><span class="required-indicator">*</span></label>
            <div>
                <g:select class="form-control" id="disease" name="disease.id" size="1" from="${PreConsent.DiseaseClass.list()}" optionKey="id" required="" value="${personInstance?.disease?.id}" onchange="hideFamilyIdentifier()"  noSelection="['': '- Choose -']"/>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'disease', 'error')}</span>
            </div>
        </div>
    </div>
</div>

<div class="row" id="rareDiseaseText">
    <hr style="border:1; height:1px" />
    <p class="col-lg-12" >Please enter the proband for the family grouping first and enter/generate a family identifier before adding the details of the other members.</p>
</div>

<div class="row">
    <div class="col-lg-6" id="showIsProband">
        <div class="${hasErrors(bean: personInstance, field: 'isProband', 'error')} ">
            <label for="isProband" class="control-label"><g:message code="person.isProband.label" default="Is Proband" /></label>
            <div>
                <label class="radio-inline"><input type="radio" name="isProband" id="isProbandYes" value="true" ${personInstance.isProband == true ? 'checked="checked"' : ''} onclick="hideFindFamilyId()">Yes</label>
                <label class="radio-inline"><input type="radio" name="isProband" id="isProbandNo" value="false" ${personInstance.isProband == false ? 'checked="checked"' : ''} onclick="hideButtonFamilyId()">No</label>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'isProband', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6" id="showSequencingTarget">
        <div class="${hasErrors(bean: personInstance, field: 'sequencingTarget', 'error')} ">
            <label for="guardianOfProband" class="control-label"><g:message code="person.sequencingTarget.label" default="Sequencing Target" /></label>
            <div>
                <label class="radio-inline"><input type="radio" name="sequencingTarget" value="true" ${personInstance.sequencingTarget == true ? 'checked="checked"' : ''} >Yes</label>
                <label class="radio-inline"><input type="radio" name="sequencingTarget" value="false" ${personInstance.sequencingTarget == false ? 'checked="checked"' : ''} >No</label>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'sequencingTarget', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6" id="showGuardianOfProband">
        <div class="${hasErrors(bean: personInstance, field: 'guardianOfProband', 'error')} ">
            <label for="guardianOfProband" class="control-label"><g:message code="person.guardianOfProband.label" default="Guardian of Proband" /></label>
            <div>
                <label class="radio-inline"><input type="radio" name="guardianOfProband" value="true" ${personInstance.guardianOfProband == true ? 'checked="checked"' : ''} >Yes</label>
                <label class="radio-inline"><input type="radio" name="guardianOfProband" value="false" ${personInstance.guardianOfProband == false ? 'checked="checked"' : ''} >No</label>
                <span class="help-inline">${hasErrors(bean: personInstance, field: 'guardianOfProband', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="col-lg-6" id="familyIdentifierId">
        <label for="familyIdentifier" class="control-label"><g:message code="person.familyIdentifier.label" default="Family Identifier" /></label>
        <div class="input-group">
            <g:textField class="form-control" id="familyIdentifier" name="familyIdentifier" value="${personInstance?.familyIdentifier}" placeholder="Click the button or enter Family Identifier" ></g:textField>
            <div class="input-group-btn" id="generateButtonId">
                <button type="button" class="btn btn-success" value="Find" onClick= 'generateIdentifier()'><span class="glyphicon glyphicon-plus"></span> Generate Family Identifier</button>
            </div>
        </div>
    </div>

    <div class="col-lg-6" id="searchPersonId">
        <label for="person" class="control-label"><g:message code="approach.person.label" default="Find Family Identifier" /><span class="required-indicator">*</span></label>
        <div class="input-group">
            <g:textField type="text" id="searchPerson" name="searchPerson" class="form-control"  placeholder="Enter person's surname or Family Identifier or NHS or MRN number" ></g:textField>
            <div class="input-group-btn">
                <button type="button" class="btn btn-success" value="Find" onClick= 'getPerson()'><span class="glyphicon glyphicon-search"></span> Find</button>
            </div>
        </div>
    </div>

    <g:if test="${personInstance.gelIdentifier}">
        <div class="col-lg-6">
            <div class="${hasErrors(bean: personInstance, field: 'gelIdentifier', 'error')} ">
                <label for="gelIdentifier" class="control-label"><g:message code="person.gelIdentifier.label" default="Gel Identifier" /></label>
                <div>
                    <g:textField class="form-control" name="gelIdentifier" value="${personInstance?.gelIdentifier}"/>
                    <span class="help-inline">${hasErrors(bean: personInstance, field: 'gelIdentifier', 'error')}</span>
                </div>
            </div>
        </div>
    </g:if>

    <div class="col-lg-6" id="selectPersonId">
        <p>
        <p>
        <div id="selectPerson"></div>
    </div>
</div>

<g:javascript plugin="jquery" library="jquery" />
<script>

    function generateIdentifier(){
        var id = new Date().getTime();
        $('#familyIdentifier').val(id);
    }

    function hideButtonFamilyId(){
        $('#familyIdentifierId').hide();
        $('#searchPersonId').show();
        $('#selectPersonId').show();
    }

    $('#searchPersonId').hide();

    function hideFindFamilyId(){
        $('#searchPersonId').hide();
        $('#generateButtonId').show();
        $('#familyIdentifierId').show();
    }

    function hideList(){
        $('#searchPersonId').hide();
        $('#selectPersonId').hide();
        $('#generateButtonId').hide();
        $('#familyIdentifierId').show();
    }

    $('#familyIdentifierId').hide();
    $('#showIsProband').hide();
    $('#showGuardianOfProband').hide();
    $('#showSequencingTarget').hide();
    $('#rareDiseaseText').hide();

    hideFamilyIdentifier();
    function hideFamilyIdentifier(){
        var disease = "${PreConsent.DiseaseClass.findByDiseaseClassName('Rare')?.id}";
        if ( disease != "" && disease == $('#disease').val()){
            $('#familyIdentifierId').show();
            $('#showIsProband').show();
            $('#showGuardianOfProband').show();
            $('#showSequencingTarget').show();
            $('#rareDiseaseText').show();
            hideFindFamilyId();
            if (${personInstance?.familyIdentifier != null}){
                hideList();
            }
        }else{
            $('#familyIdentifierId').hide();
            $('#showIsProband').hide();
            $('#showGuardianOfProband').hide();
            $('#searchPersonId').hide();
            $('#showSequencingTarget').hide();
            $('#rareDiseaseText').hide();
        }
    }

    function getPerson(){
        ${remoteFunction (controller: 'person',
                        action: 'findPerson',
                        params: '"searchPerson=" + $("#searchPerson").val()',
                        update: 'selectPerson',
                        onFailure:'personError()'
                )}
    }

    function getFamilyId(){

        var baseUrl = "${createLink(controller:'person', action:'findFamilyId')}";
        var selectPerson = $("#person").val();
        var url = baseUrl + "?personId="+selectPerson;
        $.ajax({
            url:url,
            type: 'POST',
            dataType: 'xml',
            async:true,
            success: function(res) {

                if (res){
                    var findFamilyId = $(res).find("map").text();
                    $('#familyIdentifier').val(findFamilyId);
                    hideList()
                }
            },
            error: function(request, status, error) {
                $('#familyIdentifier').val("");

            }
        });
    }

    function personError(){
        var select = $("#selectPerson");
        select.empty().append("Person not found");
        $('#personNotFound').modal()
    }
</script>


