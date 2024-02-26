<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product Quantity</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .operation-links {
            text-align: center;
            margin-top: 20px;
        }
        .operation-links a {
            display: inline-block;
            margin-right: 10px;
            text-decoration: none;
            background-color: #007bff;
            color: #fff;
            padding: 8px 16px;
            border-radius: 5px;
        }
        .operation-links a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Update Product Quantity</h1>
    <form action="UpdateProductServlet" method="post">
        <label for="productId">Product ID:</label>
        <input type="text" name="productId" required>
                
        <label for="quantity">New Quantity:</label>
        <input type="number" name="quantity" required>
        
        <input type="submit" value="Update Quantity">
    </form>

    <div class="operation-links">
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
