<%@page import="contactus.ContactusDao"%> 
<jsp:useBean id="u" class="contactus.ContactUs"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=ContactusDao.save(u);  
%>
<jsp:include page="contactus.jsp"></jsp:include>