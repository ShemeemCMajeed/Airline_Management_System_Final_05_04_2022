<%@page import="addflight.FlightDao"%>  
<jsp:useBean id="u" class="addflight.Flight"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
FlightDao.delete(u);  
response.sendRedirect("airline_flight_report.jsp");  
%> 