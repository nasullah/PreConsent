<sec:ifAnyGranted roles="ROLE_ADMIN">

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: white">
            <i class="glyphicon glyphicon-cog white"></i>
            Administration
        </a>

        <ul class="dropdown-menu" style="height: auto; max-height: 350px; overflow-x: hidden;">
            <li class="">
                <a tabindex="-1" href="#">
                    <b>User Access Management</b></a>
            </li>

            <p>

            <li class="">
                <a href="${createLink(uri: '/role/create')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Role
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/role')}">
                    <i class="glyphicon glyphicon-search"></i>
                    Search Role
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/user/create')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add User
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/user')}">
                    <i class="glyphicon glyphicon-search"></i>
                    Search User
                </a>
            </li>
            <hr />

            <li class="">
                <a tabindex="-1" href="#">
                    <b>Dropdown Lists Management</b></a>
            </li>

            <p>

            <li class="">
                <a href="${createLink(uri: '/appointmentStatus')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Appointment Status
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/appointmentType')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Appointment Type
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/clinician')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Clinician
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/complaintStatus')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Complaint Status
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/consentVersion')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Consent Version
                </a>
            </li>
            <li class="">
                <a href="${createLink(uri: '/contactMode')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Contact Mode
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/diseaseClass')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Disease Class
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/identificationMethod')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Identification Method
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/rejectionReason')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Rejection Reason
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/withdrawStatus')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Withdraw Status
                </a>
            </li>

            <li class="">
                <a href="${createLink(uri: '/versionInformationSheet')}">
                    <i class="glyphicon glyphicon-plus-sign"></i>
                    Add Version Information Sheet
                </a>
            </li>
        </ul>

    </li>

</sec:ifAnyGranted>
