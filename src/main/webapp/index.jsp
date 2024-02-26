<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Management</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        text-align: center;
    }
    .container {
        max-width: 400px;
        margin: 0 auto;
    }
    .btn {
        display: inline-block;
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        margin: 10px;
        text-decoration: none;
        cursor: pointer;
    }
    .btn:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<h2>Product Management</h2>
<div class="container">
    <a href="AddProduct.jsp" class="btn">Add Product</a>
    <a href="DeleteProduct.jsp" class="btn">Delete Product</a>
    <a href="UpdateProduct.jsp" class="btn">Update Quantity</a>
    <a href="ViewCart.jsp" class="btn">ViewCart</a>
    <a href="Bill.jsp" class="btn">Generate Bill</a>
</div>
</body>
</html>
