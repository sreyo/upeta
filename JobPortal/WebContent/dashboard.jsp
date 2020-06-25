<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% if (session.getAttribute("name") != null) { %>

<jsp:include page="adminheader.jsp" />  
    
<div class="panel-body">
	
 <jsp:include page="jobapplied.jsp" />  
</div>
<jsp:include page="footer.jsp" />  

<% } else {%>

<jsp:include page="login.jsp" />  
<% } %>


</body>
</html>