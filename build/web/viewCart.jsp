<%-- 
    Document   : viewCart
    Created on : Apr 17, 2023, 4:47:11 PM
    Author     : truc0
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sp.bw.utils.Cart"%>
<%@page import="sp.bw.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="sp.bw.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>

     
        <h1>Your shopping cart</h1>

        <c:if test="${sessionScope.CART !=null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:set var="cart" value="${sessionScope.CART}" />
                    <c:forEach var="product" varStatus="counter" items="${cart.cart.values()}">
                        <c:set var="total" value="${total + product.price * product.quantity}" />
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td>
                                <input type="text" name="productID" value="${product.productID}" readonly=""/>
                            </td>
                            <td>${product.name}</td>
                            <td>${product.price}$</td>
                            <td>
                                <input type="number" name="quantity" value="${product.quantity}" min="1" required=""/>
                            </td>
                            <td>${product.price * product.quantity}$</td>
                            <!--edit cart o day-->
                            <td>
                                <input type="submit" name="action" value="Edit"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Remove"/>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                <h1>Total:${total}</h1></br>
            </tbody>
        </table>
    </c:if>
    <a href="MainController?action=Get all">Add more</a>
</body>
</html>
