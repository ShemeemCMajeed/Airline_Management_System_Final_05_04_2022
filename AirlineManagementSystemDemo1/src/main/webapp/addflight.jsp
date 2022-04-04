<%@page import="addflight.FlightDao"%> 
<jsp:useBean id="u" class="addflight.Flight"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=FlightDao.save(u);  
if(i>0){  
response.sendRedirect("addflight-success.jsp");  
}else{  
response.sendRedirect("addflight-error.jsp");  
}  
%>