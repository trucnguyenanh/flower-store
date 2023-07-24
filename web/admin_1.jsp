<%-- 
    Document   : admin
    Created on : Apr 13, 2023, 3:57:38 PM
    Author     : truc0
--%>

<%@page import="java.util.List"%>
<%@page import="sp.bw.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null ||!"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search=(String)request.getParameter("search");
            if(search==null) search="";
        %>
        welcome: <h1><%=loginUser.getFullName()%></h1>
        <form action="MainController">
            Search<input type="text" name="search" value="<%=search%>"/>
            <input type="submit" name="action" value="Search"/>
            <input type="submit" name="action" value="Logout"/>
        </form>
            
        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController">
                <tr>
                    <td><%=count++%></td>
                    <td><%=user.getUserID()%></td>
                    <td>
                        <input type="text" name="fullName" value="<%=user.getFullName()%>"/>
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%=user.getRoleID()%>"/>
                    </td>
                    <td><%=user.getPassword()%></td>
                    <td>
                        <a href="MainController?action=Delete&userID=<%= user.getUserID()%>&search=<%= search%>">Delete</a>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="userID" value="<%=user.getUserID()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/>
                    </td>
                </tr>
            </form>
                
            <%
                    }
                %>

            </tbody>
        </table>
            <%
                String error=(String) request.getAttribute("ERROR");
                if(error==null) error="";
            %>
            <%=error%>
        <%
                }
            }
        %>
    </body>
</html>