<%-- 
    Document   : shopping
    Created on : Apr 17, 2023, 3:06:12 PM
    Author     : truc0
--%>

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
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form action="MainController">
            <input type="submit" name="action" value="Get all"/>
            <input type="submit" name="action" value="View cart"/>
        </form>
        <%
            List<Product> listProduct = (List<Product>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
        %>
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
                <%
                    int count = 1;
                    for (Product list : listProduct) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=count++%></td>
                    <td><%=list.getProductID()%></td>
                    <td><%=list.getName()%></td>
                    <td><%=list.getPrice()%></td>
                    <td>
                        <input type="number" name="quantity" value="<%=list.getQuantity()%>" min="1" max="<%=list.getQuantity()%>" required=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Add"/>
                        <input type="hidden" name="productID" value="<%=list.getProductID()%>"/>
                    </td>
                </tr>
            </form>

            <%
                }
            %>

        </tbody>
    </table>
    
    <%                }
        }
    %>
    <%
          String message=(String) request.getAttribute("MESSAGE");
          if(message==null) message="";
    %>
    <%=message%>
</body>
</html>
