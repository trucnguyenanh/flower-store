<%-- 
    Document   : user
    Created on : Apr 13, 2023, 3:53:09 PM
    Author     : truc0
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sp.bw.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>User Information</h1>
        User ID:${sessionScope.LOGIN_USER.userID}
        </br>Full Name:${sessionScope.LOGIN_USER.fullName}
        </br>Role ID:${sessionScope.LOGIN_USER.roleID}
        </br>Password:${sessionScope.LOGIN_USER.password}
        <a href="shopping.html">Shopping</a>
    </body>
</html>
