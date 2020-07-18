<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%    out.println("indown:");

    String resumename  = request.getParameter("filename");
    String name = (String)session.getAttribute("name"); 


  out.println("servlet"+resumename);
  String filename = resumename;   
  String filepath=application.getRealPath("/WEB-INF/resume/");
  out.println("servlet"+filepath);
  //String filepath = "D:/upload/";   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%>   

</body>
</html>