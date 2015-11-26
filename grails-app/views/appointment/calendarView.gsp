
<!DOCTYPE html>
<html>
<head>

    <meta charset='utf-8' />
    <link rel='stylesheet' href='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/cupertino/jquery-ui.min.css' />
    <link href='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.css' rel='stylesheet' />
    <link href='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
    <script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery.min.js'></script>
    <script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>

        $(document).ready(function() {
            $('#calendar').fullCalendar({
                theme: true,
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: '${createLink(controller: "appointment", action: "eventList")}'
            });

        });

    </script>
    <style>

    body {
        padding: 50px;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 1150px;
        margin: 0 auto;
    }

    #navbar {
        max-width: 1150px;
        margin: 0 auto;
    }

    </style>

</head>
<body>
<center><h1>Calendar</h1></center>
<div id='navbar'>
    <g:render template="/_menu/navbar"/>

    <g:render template="/_menu/menubar"/>

    <g:render template="/_menu/submenubar"/>

    <hr/>
</div>

<div id='calendar'></div>

</body>
</html>