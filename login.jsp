<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            padding:0px;
            margin:0px;
        }
        body{
            display:flex;
            align-items:center;
            justify-content:center;
        }
        .outer-box{
            display:flex;
            align-items:center;
            justify-content:center;
        }
    </style>
</head>
<body>
    <div class="outer-box">
    <form action="login.jsp" method="post">
        <label for="email">Email Id:</label>
        <input type="text" name="email" placeholder="write your mail id">
        <br>
        <label for="pwd">Password:</label>
        <input type="password" name="pwd" placeholder="write your password">
        <br>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>

<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("pwd");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/TrainReservation","raju","Nagaraju1136@");
    String sql="select * from login";
    PreparedStatement ps=conn.prepareStatement(sql);
    ResultSet resultset=ps.executeQuery();
    int flag=0;
    while(resultset.next())
    {
        if(email.equals(resultset.getString("emailId")) && password.equals(resultset.getString("password"))){
            flag=1;
            break;
        }
    }
    if(flag==1)
    {
        response.sendRedirect("Details.html");
    }else{
        out.println("login not success");
    }
}catch(Exception e)
{
    out.println(e.getMessage());
}
%>