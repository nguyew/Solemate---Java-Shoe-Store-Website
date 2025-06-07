<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Products - SoleMate Admin</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }
            body {
                background-color: #f4f6f9;
            }
            .container {
                display: flex;
                min-height: 100vh;
            }
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: white;
                padding: 20px;
                transition: width 0.3s ease;
            }
            .sidebar h3 {
                font-size: 24px;
                margin-bottom: 30px;
                text-align: center;
            }
            .sidebar form {
                margin-bottom: 10px;
            }
            .sidebar button {
                display: block;
                width: 100%;
                color: white;
                text-decoration: none;
                padding: 10px 15px;
                border: none;
                background: none;
                text-align: left;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                font-size: 16px;
            }
            .sidebar button:hover, .sidebar button.active {
                background-color: #3498db;
            }
            .main-content {
                flex: 1;
                padding: 30px;
                background-color: #fff;
                overflow-x: hidden;
            }
            .main-content h2 {
                font-size: 28px;
                color: #333;
                margin-bottom: 20px;
            }
            .search-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .search-bar input {
                width: 250px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 14px;
                transition: border-color 0.3s ease;
            }
            .search-bar input:focus {
                outline: none;
                border-color: #3498db;
            }
            .create-btn, .toggle-btn {
                padding: 8px 15px;
                background-color: #8e44ad;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }
            .create-btn:hover, .toggle-btn:hover {
                background-color: #9b59b6;
            }
            .create-form {
                display: none;
                background-color: #f9f9f9;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 20px;
            }
            .create-form form {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .create-form input[type="text"],
            .create-form input[type="number"],
            .create-form textarea {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                resize: none;
            }
            .create-form textarea {
                height: 60px;
            }
            .create-form .confirm-btn {
                background-color: #2ecc71;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
            .create-form-field {
                flex: 1;
                min-width: 100px;
            }
            .create-form-field.confirm {
                flex: 0 0 100px; /* Fixed width for the Confirm button */
            }
            .table-container {
                max-height: 400px;
                overflow-y: auto;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                table-layout: fixed;
            }
            th, td {
                padding: 12px 15px;
                text-align: left;
                font-size: 14px;
                border-bottom: 1px solid #eee;
                overflow-wrap: break-word;
            }
            th {
                background-color: #f8f9fa;
                color: #555;
                font-weight: bold;
                text-transform: uppercase;
                border-bottom: 1px solid #ddd;
            }
            td {
                color: #333;
            }
            tr:hover {
                background-color: #f9f9f9;
            }
            .action-buttons {
                display: flex;
                flex-direction: column;
                gap: 10px;
                align-items: stretch;
            }
            .action-buttons button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
                width: 100%;
            }
            .action-buttons .update-btn {
                background-color: #3498db;
                color: white;
            }
            .action-buttons .update-btn:hover {
                background-color: #2980b9;
            }
            .action-buttons .delete-btn {
                background-color: #e74c3c;
                color: white;
            }
            .edit-row {
                display: none;
                background-color: #f9f9f9;
            }
            .edit-row td {
                padding: 12px 15px;
            }
            .edit-row input[type="text"],
            .edit-row input[type="number"],
            .edit-row textarea {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                resize: none;
            }
            .edit-row textarea {
                height: 60px;
            }
            .edit-row .confirm-btn {
                background-color: #2ecc71;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="sidebar">
                <h3>SoleMate Admin</h3>
                <form action="index.jsp" method="GET">
                    <button type="submit">Home Page</button>
                </form>
                <form action="ProductAdminController" method="GET">
                    <button type="submit" class="active">Products</button>
                </form>
                <form action="OrderAdminController" method="GET">
                    <button type="submit">Orders</button>
                </form>
                <form action="UserAdminController" method="GET">
                    <button type="submit">Users</button>
                </form>

            </div>

            <div class="main-content">
                <h2>Items</h2>
                <div class="search-bar">
                    <form action="ProductAdminController" method="GET">
                        <input type="text" name="search" id="searchInput" placeholder="Search everything..." autocomplete="off" />
                       <input type="submit" value="Search">
                    </form>

                    <button class="create-btn" onclick="toggleCreateForm()">Create new Product</button>
                </div>


                <div class="create-form" id="createForm">
                    <form action="ProductAdminController" method="POST">
                        <input type="hidden" name="action" value="create">
                        <div class="create-form-field">
                            <input type="text" name="product_name" placeholder="Name">
                        </div>
                        <div class="create-form-field">
                            <textarea name="description" placeholder="Description"></textarea>
                        </div>
                        <div class="create-form-field">
                            <input type="number" name="price" placeholder="Price" step="0.01">
                        </div>
                        <div class="create-form-field">
                            <input type="text" name="image" placeholder="Image URL">
                        </div>
                        <div class="create-form-field">
                            <input type="number" name="brand_id" placeholder="Brand ID">
                        </div>
                        <div class="create-form-field">
                            <input type="number" name="size" placeholder="Size">
                        </div>
                        <div class="create-form-field">
                            <input type="number" name="category_id" placeholder="Category ID">
                        </div>
                        <div class="create-form-field confirm">
                            <button type="submit" class="confirm-btn">Confirm</button>
                        </div>
                    </form>
                </div>

                <div class="table-container">
                    <table id="itemsTable">
                        <thead>
                            <tr>
                                <th style="width: 10%;">Product ID</th>
                                <th style="width: 15%;">Name</th>
                                <th style="width: 20%;">Description</th>
                                <th style="width: 10%;">Price</th>
                                <th style="width: 15%;">Image URL</th>
                                <th style="width: 10%;">Brand</th>
                                <th style="width: 10%;">Size</th>
                                <th style="width: 12%;">Category ID</th>
                                <th style="width: 15%;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${products == null}">
                                <tr>
                                    <td colspan="9">Products list is null.</td>
                                </tr>
                            </c:if>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td>${product.product_id}</td>
                                    <td>${product.product_name}</td>
                                    <td>${product.description}</td>
                                    <td>${product.price}</td>
                                    <td>${product.image}</td>
                                    <td>${product.brand_id}</td>
                                    <td>${product.size}</td>
                                    <td>${product.category_id}</td>
                                    <td>
                                        <div class="action-buttons">
                                            <button class="update-btn" onclick="toggleEditRow(${product.product_id})">Edit</button>
                                            <form action="ProductAdminController" method="POST">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="product_id" value="${product.product_id}">
                                                <button class="delete-btn" type="submit" onclick="return confirm('Are you sure you want to delete this product?')">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="edit-row" id="edit-row-${product.product_id}">
                            <form action="ProductAdminController" method="POST">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="product_id" value="${product.product_id}">
                                <td><input type="text" name="product_id" value="${product.product_id}" readonly></td>
                                <td><input type="text" name="product_name" value="${product.product_name}"></td>
                                <td><textarea name="description">${product.description}</textarea></td>
                                <td><input type="number" name="price" value="${product.price}" step="0.01"></td>
                                <td><input type="text" name="image" value="${product.image}"></td>
                                <td><input type="number" name="brand_id" value="${product.brand_id}"></td>
                                <td><input type="number" name="size" value="${product.size}"></td>
                                <td><input type="number" name="category_id" value="${product.category_id}"></td>
                                <td><button type="submit" class="confirm-btn">Confirm</button></td>
                            </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>


            function toggleEditRow(productId) {
                let editRow = document.getElementById('edit-row-' + productId);
                if (editRow) {
                    if (editRow.style.display === 'table-row') {
                        editRow.style.display = 'none';
                    } else {
                        document.querySelectorAll('.edit-row').forEach(row => {
                            row.style.display = 'none';
                        });
                        editRow.style.display = 'table-row';
                    }
                }
            }

            function toggleCreateForm() {
                let createForm = document.getElementById('createForm');
                if (createForm) {
                    if (createForm.style.display === 'flex') {
                        createForm.style.display = 'none';
                    } else {
                        createForm.style.display = 'flex';
                    }
                }
            }
        </script>
    </body>
</html>