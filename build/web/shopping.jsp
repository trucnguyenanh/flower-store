<%-- 
    Document   : shopping
    Created on : Apr 17, 2023, 3:06:12 PM
    Author     : truc0
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sp.bw.user.UserDTO"%>
<%@page import="sp.bw.product.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    <body>

      
        <form action="MainController">
            <input type="submit" name="action" value="Get all"/>
            <input type="submit" name="action" value="View cart"/>
        </form>
        <c:if test="${requestScope.LIST_PRODUCT !=null}">
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Add</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_PRODUCT}">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${user.productID}</td>
                                <td>${user.name}</td>
                                <td>${user.price}</td>
                                <td>
                                    <input type="number" name="quantity" value="${user.quantity}" min="1" max="${user.quantity}" required=""/>
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Add"/>
                                    <input type="hidden" name="productID" value="${user.productID}"/>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>

    ${requestScope.MESSAGE}

</body>
</html>
