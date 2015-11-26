<!-- 
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${	params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'home'
            &&	params.controller != 'person'
}">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <ul id="Menu" class="nav nav-pills margin-top-small">

		<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		
		<li class="${ params.action == "list" ? 'active' : '' }">
			<g:link action="list"><i class="glyphicon glyphicon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></g:link>
		</li>

        <g:if test="${	params.controller != "engage"}">
            <li class="${ params.action == "create" ? 'active' : '' }">
                <g:link action="create"><i class="glyphicon glyphicon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></g:link>
            </li>
        </g:if>
		
		<g:if test="${ params.action == 'show' || params.action == 'edit' }">
			<!-- the item is an object (not a list) -->
			<li class="${ params.action == "edit" ? 'active' : '' }">
				<g:link action="edit" id="${params.id}"><i class="glyphicon glyphicon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
			</li>
			<li class="">
				<g:render template="/_common/modals/deleteTextLink"/>
			</li>
		</g:if>
		
	</ul>
</g:if>

<g:if test="${	params.controller == "person" && params.action == "list"
}">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <ul id="Menu" class="nav nav-pills margin-top-small">

        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />

        <li class="${ params.action == "list" ? 'active' : '' }">
            <g:link controller="person" action="list"><i class="glyphicon glyphicon-th-list"></i> All Patients</g:link>
        </li>

        <li class="${ params.action == "list" }">
            <g:link controller="engage" action="list"><i class="glyphicon glyphicon-th-list"></i> Engaged Patients</g:link>
        </li>

        <li class="${ params.action == "list"  }">
            <g:link controller="clinical_withdrawal" action="list"><i class="glyphicon glyphicon-th-list"></i> Clinically Withdrawn Patients</g:link>
        </li>

        <li class="${ params.action == "list"}">
            <g:link controller="consent" action="list"><i class="glyphicon glyphicon-th-list"></i> Consented Patients</g:link>
        </li>
        <li class="${ params.action == "list"  }">
            <g:link controller="patient_withdraw" action="list"><i class="glyphicon glyphicon-th-list"></i> Patients who have withdrawn Consent</g:link>
        </li>
        <li class="${ params.action == "list"}">
            <g:link controller="exit_interview" action="list"><i class="glyphicon glyphicon-th-list"></i> Patients who have completed an exit interview</g:link>
        </li>

        <g:if test="${ params.action == 'show' || params.action == 'edit' }">
            <!-- the item is an object (not a list) -->
            <li class="${ params.action == "edit" ? 'active' : '' }">
                <g:link action="edit" id="${params.id}"><i class="glyphicon glyphicon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
            </li>
            <li class="">
                <g:render template="/_common/modals/deleteTextLink"/>
            </li>
        </g:if>

    </ul>
</g:if>

<g:if test="${	params.controller == "person" && params.action == "create"
}">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <ul id="Menu" class="nav nav-pills margin-top-small">

        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />

        <li class="${ params.action == "create"}">
            <g:link action="create"><i class="glyphicon glyphicon-plus"></i> Register new person</g:link>
        </li>

        <li class="">
            <li><a href="/gel_pm/importparticipant"><span style="color:#46d010"><i class="glyphicon glyphicon-import"></i></span> Import Patient</a>
        </li>


</ul>
</g:if>

<g:if test="${params.controller == "person" && params.action == 'show' || params.controller == "person" && params.action == 'edit' }">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <ul id="Menu" class="nav nav-pills margin-top-small">

        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />

        <li class="${ params.action == "edit" ? 'active' : '' }">
            <g:link action="edit" id="${params.id}"><i class="glyphicon glyphicon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
        </li>
        <li class="">
            <g:render template="/_common/modals/deleteTextLink"/>
        </li>

    </ul>
</g:if>
