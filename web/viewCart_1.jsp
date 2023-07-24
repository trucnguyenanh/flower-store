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
         <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null ||!"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
       
        <h1>Your shopping cart</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if ( cart!= null) {
        %>
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
                <%
                    int count = 1;
                    double total=0;
                    for (Product pro : cart.getCart().values()) {
                       total+= pro.getPrice()*pro.getQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=count++%></td>
                    <td>
                        <input type="text" name="productID" value="<%=pro.getProductID()%>" readonly=""/>
                    </td>
                    <td><%=pro.getName()%></td>
                    <td><%=pro.getPrice()%>$</td>
                    <td>
                        <input type="number" name="quantity" value="<%=pro.getQuantity()%>" min="1" required=""/>
                    </td>
                    <td><%=pro.getPrice()*pro.getQuantity()%>$</td>
                    <!--edit cart o day-->
                    <td>
                        <input type="submit" name="action" value="Edit"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                </tr>
            </form>
                
            <%
                }
            %>

        </tbody>
    </table>
            <h1>Total:<%=total%></h1></br>
    <%                
        }
    %>
    <a href="MainController?action=Get all">Add more</a>
    </body>
</html>
