<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% if (session.getAttribute("name") != null) { %>

<jsp:include page="userheader.jsp" />  
    
<div class="panel-body">
	
 <jsp:include page="applyjob.jsp" />  
</div>
<jsp:include page="userfooter.jsp" />  

<% } else {%>

<jsp:include page="index.jsp" />  
<% } %>


</body>
</html>