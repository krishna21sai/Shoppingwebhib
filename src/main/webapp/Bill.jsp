<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.model.Product" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Products</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
    <h1>List of Products</h1>
    
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th> <!-- New column for total -->
        </tr>
        
        <% 
            Session hibernateSession = FactoryProvider.getFactory().openSession();
            double grandTotal = 0.0;
            try {
                hibernateSession.beginTransaction();
                List<Product> products = hibernateSession.createQuery("from Product", Product.class).getResultList();
                
                for (Product product : products) {
                    int quantity = product.getProductInventory();
                    double price = product.getProductPrice();
                    double total = quantity * price;
                    grandTotal += total; // Accumulate total
        %>
                <tr>
                    <td><%= product.getProductId() %></td>
                    <td><%= product.getProductName() %></td>
                    <td><%= quantity %></td>
                    <td><%= price %></td>
                    <td><%= total %></td> <!-- Display total amount -->
                </tr>
        <%
                }
                hibernateSession.getTransaction().commit();
            } finally {
                hibernateSession.close();
            }
        %>
        <tr>
            <td colspan="4"><strong>Total Amount:</strong></td>
            <td><%= grandTotal %></td> <!-- Display total amount -->
        </tr>
    </table>
    
    <div class="container text-center mt-2">
        <a href="index.jsp" class="btn btn-primary">Home</a>
    </div>

</body>
</html>
