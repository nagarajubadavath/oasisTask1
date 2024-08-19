<%@page import="java.sql.*,java.util.*"%>

<%
String pnr=(String)session.getAttribute("pnr");
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/TrainReservation","raju","Nagaraju1136@");
    String sql="delete from Reservation where pnr='"+pnr+"'";
    PreparedStatement ps=conn.prepareStatement(sql);
    int i=ps.executeUpdate();
    if(i>0)
    {
        %>
        <html><body>
            <p>you have cancelled your tickets successfully</p>
        </body></html>
        <%
    }else{
        out.println("Not cancelled yet");
    }
}catch(Exception e)
{
    out.println(e.getMessage());
}
%>