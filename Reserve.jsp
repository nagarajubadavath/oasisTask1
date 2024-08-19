<%@page import="java.sql.*,java.util.*"%>

<%
String trainNum=request.getParameter("trainNum");
String trainName=request.getParameter("trainName");
String classType=request.getParameter("classType");
String DateOfJourney=request.getParameter("DateOfJourney");
String departure=request.getParameter("from");
String destination=request.getParameter("to");
String pnr=request.getParameter("pnr");

session.setAttribute("trainNum",trainNum);
session.setAttribute("trainName",trainName);
session.setAttribute("classType",classType);
session.setAttribute("DateOfJourney",DateOfJourney);
session.setAttribute("departure",departure);
session.setAttribute("destination",destination);
session.setAttribute("pnr",pnr);
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/TrainReservation","raju","Nagaraju1136@");
    String sql="insert into Reservation (train_no,train_name,classType,DateOfJourney,departue,destination,pnr) values (?,?,?,?,?,?,?)";
    PreparedStatement ps=conn.prepareStatement(sql);
    ps.setString(1,trainNum);
    ps.setString(2,trainName);
    ps.setString(3,classType);
    ps.setString(4,DateOfJourney);
    ps.setString(5,departure);
    ps.setString(6,destination);
    ps.setString(7,pnr);
    int i=ps.executeUpdate();
    if(i>0)
    {
        response.sendRedirect("displayTicket.jsp");
    }else{
        out.println("not reserved");
    }
}catch(Exception e)
{
    out.println(e.getMessage());
}
%>