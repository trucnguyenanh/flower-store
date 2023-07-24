<%-- 
    Document   : createUser
    Created on : Apr 15, 2023, 3:28:00 PM
    Author     : truc0
--%>

<%@page import="sp.bw.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        Create new user:
        <%
            UserError userError=(UserError) request.getAttribute("USER_ERROR");
            if(userError==null) userError=new UserError();
        %>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/>
            ${requestScope.USER_ERROR.userIDError}</br>
            Full Name<input type="text" name="fullName" required=""/>
            ${requestScope.USER_ERROR.fullNameError}</br>
            Role ID<input type="text" name="roleID" value="US" readonly=""/>
            ${requestScope.USER_ERROR.roleIDError}</br>
            Password<input type="password" name="password" required=""/></br>
            Confirm<input type="password" name="confirm" required=""/>
            ${requestScope.USER_ERROR.confirmError}</br>
            <input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>
            ${requestScope.userError.error}
            
        </form>
    </body>
</html>
