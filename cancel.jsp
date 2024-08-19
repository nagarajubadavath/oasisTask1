<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #btn{
            margin-left:700px;
            padding:10px;
            font-size:small;
        }
    </style>
</head>
<body>
    <form action="cancel.jsp" method="post">
        <label for="pnr">PNR:</label>
        <input type="number" name="pnr">
        <br>
        <input type="submit" value="submit">
    </form>


<%
String pnr=request.getParameter("pnr");
session.setAttribute("pnr",pnr);
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/TrainReservation","raju","Nagaraju1136@");
    String sql="select * from Reservation where pnr='"+pnr+"'";
    PreparedStatement ps=conn.prepareStatement(sql);
    ResultSet resultset=ps.executeQuery();
    while(resultset.next())
    {
        if(pnr.equals(resultset.getString("pnr"))){
    %>
    <table border="1" align="center" width="50%">
        <tr>
            <td><%=resultset.getString("pnr")%></td>
        </tr>
        <tr>
            <td><%=resultset.getString("train_no")%></td>
        </tr>
        <tr>
            <td><%=resultset.getString("train_name")%></td>
        </tr>
        <tr>
            <td><%=resultset.getString("classType")%></td>
        </tr>
        <tr>
            <td><%=resultset.getString("departue")%></td>
        </tr>
        <tr>
            <td><%=resultset.getString("destination")%></td>
        </tr>
        <tr>
            <td><%=resultset.getString("DateOfJourney")%></td>
        </tr>
    </table>
    <form action="cancel2.jsp" method="post">
    <input type="submit" value="OK" id="btn">
    </form>
    </body>
    </html>
    <%
    break;
}else{
    out.println("pnr no not found");
}
}
}catch(Exception e)
{
    out.println(e.getMessage());
}
%>