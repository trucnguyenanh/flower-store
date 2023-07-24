<%-- 
    Document   : index
    Created on : Apr 22, 2023, 2:45:19 PM
    Author     : truc0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Index</h1>
        <%
          String id = (String)request.getAttribute("id");
          String name = (String)request.getAttribute("name");
          out.print("Id: " + id);
          out.print("<br/>Name: " + name);
          
        %>
        ${requestScope.email}
    </body>
</html>
