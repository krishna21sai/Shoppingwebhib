<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
    }
    .container {
        max-width: 400px;
        margin: 0 auto;
    }
    label {
        display: block;
        margin-bottom: 5px;
    }
    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .back-button {
        margin-top: 20px;
        text-align: center;
    }
    .back-button a {
        text-decoration: none;
        color: #007bff;
        display: inline-block;
        border: 1px solid #007bff;
        padding: 8px 16px;
        border-radius: 5px;
    }
    .back-button a:hover {
        background-color: #007bff;
        color: white;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Product Details</h2>
    <form action="storeProductServlet" method="post">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>
        <label for="productPrice">Product Price:</label>
        <input type="number" id="productPrice" name="productPrice" step="0.01" required>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>
        <input type="submit" value="Submit">
    </form>
    <div class="back-button">
        <a href="index.jsp">Back to Index</a>
    </div>
</div>
</body>
</html>
