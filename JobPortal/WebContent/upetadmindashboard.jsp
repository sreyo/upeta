<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% if (session.getAttribute("name") != null) { %>

<jsp:include page="upetadminheader.jsp" />  
    
<div class="panel-body">
	
 <jsp:include page="upetaland.jsp" />  
</div>
<jsp:include page="upetadminfooter.jsp" />  

<% } else {%>

<jsp:include page="index.jsp" />  
<% } %>


</body>
</html>