<%@page import="java.sql.*,java.util.*"%>

<%
String trainNum=(String)session.getAttribute("trainNum");
String trainName=(String)session.getAttribute("trainName");
String classType=(String)session.getAttribute("classType");
String DateOfJourney=(String)session.getAttribute("DateOfJourney");
String departure=(String)session.getAttribute("departure");
String destination=(String)session.getAttribute("destination");
String pnr=(String)session.getAttribute("pnr");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            margin:0px;
            padding:0px;
        }
        body{
            display:flex;
            align-items:center;
            justify-content:center;
        }
        table {
            width: 100%;
            font-size: larger;
            font-style: italic;
            margin: 100px;
            padding: 20px;
            position: relative;
            background-image: url(vandeBharath.jpeg);
            background-repeat: no-repeat;
            background-size: cover;
            color: black;
            border-collapse: collapse;
        }
        table::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent overlay */
            z-index: 1;
        }
        td {
            padding: 20px;
            font-weight: bold;
            z-index: 2; /* Ensure text is above overlay */
            position: relative;
            text-align:center;
        }
        #btn{
            margin-left:200px;
            padding:10px;
            font-size: larger;
            font-weight: bold;
            color: black;
        }
    </style>
</head>
<body>
    <div class="outer">
        <form action="cancel.jsp" method="post">
        <table border="0" width="50%">
            <tr>
                <td colspan="2">PNR: <%=pnr%></td>
            </tr>
            <tr>
                <td>TrainN0: <%=trainNum%></td>
                <td>TrainName: <%=trainName%></td>
            </tr>
            <tr>
                <td>ClassType: <%=classType%></td>
                <td>Date Of Journey: <%=DateOfJourney%></td>
            </tr>
            <tr>
                <td>From: <%=departure%></td>
                <td>To: <%=destination%></td>
            </tr>
        </table>
        <button id="btn" onclick="window.print()">Print Ticket</button>
        <input type="submit" value="Cancel Ticket" id="btn">
    </form>
    </div>
</body>
</html>