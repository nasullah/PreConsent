<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <style>
    p    {color:#000000}
    h2 {
        color: #000000;
        margin-left: 300px;
    }
    </style>
</head>
<body>

<h2>Letter</h2>

<p>Full Name: ${form?.getPerson()?.forenames} ${form?.getPerson()?.surname} <br />
    Address: ${form?.getPerson()?.contactDetails?.address?.toString()?.replace('[', '')?.replace(']', '')}</p>

<p>NHS Number: ${form?.getPerson()?.nhsNumber} <br />
    Hospital Number: ${form?.getPerson()?.mrnNumber} <br />
    Date of Birth: <g:formatDate date="${form?.person?.dateOfBirth}" format="dd MMM yyyy"/></p>

<p>Clinician:  ${form?.getClinician()?.forenames} ${form?.getClinician()?.surname}</p>

<p>Date: <g:formatDate date="${form?.getDate()}" format="dd MMM yyyy"/></p>

<p>Dear ${form?.getPerson()?.forenames}</p>

<p>We are inviting you to attend your free NHS Health Check on xx xxxxx xxxx at xxxx
NHS Health Checks are being offered to people aged between 40 and 74 once every five years.</p>

<p>The check is to assess your risk of developing diabetes, heart disease, kidney disease, stroke and dementia. If there are any warning signs, then together we can do something about it.
The check should take about 20-30 minutes and is based on straightforward questions and measurements such as age, gender, family history, height, weight and blood pressure. There will also be a simple blood test to measure your cholesterol level.
Following the check, you will receive free personalised advice about what you can do to stay healthy.</p>

<p>Yours sincerely</p>
<p>xxxxxxxxx xxxxxxxxxx</p>

</body>
</html>