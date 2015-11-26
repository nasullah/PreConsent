<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_USER">

    <ul class="nav nav-tabs">

        <li>
            <g:link controller="appointment" action="calendarView">Calendar view of events</g:link>
        </li>

        <li>
            <g:link controller="person" action="list">Lists</g:link>
        </li>

        <li>
            <g:link controller="person" action="create">Register a new patient</g:link>
        </li>

        <li>
            <g:link controller="engage" action="listPerson">Engage a patient</g:link>
        </li>

        <li>
            <g:link controller="clinical_withdrawal" action="listPersonsToBeClinicalWithdrawn">Record clinical withdrawal</g:link>
        </li>

        <li>
            <g:link controller="consent" action="listPersonsToBeConsented">Record patient consent</g:link>
        </li>

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                More<b class="caret"></b>
            </a>
            <ul class="dropdown-menu">

                <li>
                    <g:link controller="complaint" action="index">Complaint</g:link>
                </li>

                <li>
                    <g:link controller="enquiry" action="index">Enquiry</g:link>
                </li>

                <li>
                    <g:link controller="patient_withdraw" action="listPersonsToBeWithdrawn">Record patient withdrawal</g:link>
                </li>

            </ul>
        </li>

    </ul>

</sec:ifAnyGranted>


%{--<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_USER">--}%

%{--<ul class="nav nav-tabs">--}%

    %{--<li>--}%
        %{--<g:link controller="person" action="index">Person</g:link>--}%
    %{--</li>--}%

    %{--<li>--}%
        %{--<g:link controller="clinical_withdrawal" action="index">Clinical Withdrawal</g:link>--}%
    %{--</li>--}%

    %{--<li>--}%
        %{--<g:link controller="engage" action="index">Engage</g:link>--}%
    %{--</li>--}%

    %{--<li>--}%
        %{--<g:link controller="exit_interview" action="index">Exit Interview</g:link>--}%
    %{--</li>--}%

    %{--<li>--}%
        %{--<g:link controller="consent" action="index">Consent</g:link>--}%
    %{--</li>--}%

    %{--<li>--}%
        %{--<g:link controller="patient_withdraw" action="index">Patient Withdraw</g:link>--}%
    %{--</li>--}%

    %{--<li class="dropdown">--}%
        %{--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--}%
            %{--Other Interactions  <b class="caret"></b>--}%
        %{--</a>--}%
        %{--<ul class="dropdown-menu">--}%

            %{--<li>--}%
                %{--<g:link controller="complaint" action="index">Complaint</g:link>--}%
            %{--</li>--}%

            %{--<li>--}%
                %{--<g:link controller="enquiry" action="index">Enquiry</g:link>--}%
            %{--</li>--}%

        %{--</ul>--}%
    %{--</li>--}%

%{--</ul>--}%

%{--</sec:ifAnyGranted>--}%