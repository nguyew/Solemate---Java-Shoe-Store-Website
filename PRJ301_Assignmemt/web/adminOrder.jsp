<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Orders - SoleMate Admin</title>
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
            .table-container {
                max-height: 400px;
                overflow-y: auto;
                overflow-x: auto; /* Allow horizontal scrolling */
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                /* Removed table-layout: fixed to allow dynamic column widths */
            }
            th, td {
                padding: 12px 15px;
                text-align: left;
                font-size: 14px;
                border-bottom: 1px solid #eee;
                overflow-wrap: break-word; /* Allow text to wrap */
                white-space: normal; /* Allow wrapping */
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
            .status-shipped {
                color: #2ecc71; /* Green for shipped */
            }
            .status-not-shipped {
                color: #e74c3c; /* Red for not shipped */
            }
            .status-completed {
                color: #2ecc71; /* Green for completed */
            }
            .status-pending {
                color: #f39c12; /* Orange for pending */
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
            .edit-row input[type="datetime-local"],
            .edit-row textarea {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                resize: none;
                box-sizing: border-box;
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
                    <button type="submit">Products</button>
                </form>
                <form action="OrderAdminController" method="GET">
                    <button type="submit" class="active">Orders</button>
                </form>
                <form action="UserAdminController" method="GET">
                    <button type="submit">Users</button>
                </form>

            </div>

            <div class="main-content">
                <h2>Orders</h2>
                <div class="search-bar">
                    <form action="OrderAdminController" method="POST">
                        <input type="hidden" name="action" value="search">
                        <input type="text" name="keyword" id="searchInput" placeholder="Search Recipient Name...">
                        <input type="submit" value="Search">
                    </form>
                </div>



                <div class="table-container">
                    <table id="ordersTable">
                        <thead>
                            <tr>
                                <th style="width: 5%;">Order ID</th>
                                <th style="width: 5%;">User ID</th>
                                <th style="width: 10%;">Order Date</th>
                                <th style="width: 5%;">Status</th>
                                <th style="width: 8%;">Recipient Name</th>
                                <th style="width: 15%;">Address</th>
                                <th style="width: 8%;">Phone</th>
                                <th style="width: 10%;">Shipping Date</th>
                                <th style="width: 8%;">Delivery Status</th>
                                <th style="width: 8%;">Payment Method</th>
                                <th style="width: 10%;">Payment Date</th>
                                <th style="width: 8%;">Payment Status</th>
                                <th style="width: 10%;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${orders == null}">
                                <tr>
                                    <td colspan="13">Orders list is null.</td>
                                </tr>
                            </c:if>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.order_id}</td>
                                    <td>${order.user_id}</td>
                                    <td>${order.order_date}</td>
                                    <td>${order.status}</td>
                                    <td>${order.recipient_name}</td>
                                    <td>${order.address}</td>
                                    <td>${order.phone}</td>
                                    <td>${order.shipping_date}</td>
                                    <td>
                                        <span class="${order.delivery_status == 'shipped' ? 'status-shipped' : 'status-not-shipped'}">
                                            ${order.delivery_status}
                                        </span>
                                    </td>
                                    <td>${order.payment_method}</td>
                                    <td>${order.payment_date}</td>
                                    <td>
                                        <span class="${order.payment_status == 'completed' ? 'status-completed' : 'status-pending'}">
                                            ${order.payment_status}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <button class="update-btn" onclick="toggleEditRow(${order.order_id})">Edit</button>
                                            <form action="OrderAdminController" method="POST">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="order_id" value="${order.order_id}">
                                                <button class="delete-btn" type="submit" onclick="return confirm('Are you sure you want to delete this order?')">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="edit-row" id="edit-row-${order.order_id}">
                            <form action="OrderAdminController" method="POST">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="order_id" value="${order.order_id}">
                                <td><input type="text" name="order_id" value="${order.order_id}" readonly></td>
                                <td><input type="number" name="user_id" value="${order.user_id}"></td>
                                <td><input type="date" name="order_date" value="${order.order_date}"></td>
                                <td><input type="text" name="status" value="${order.status}"></td>
                                <td><input type="text" name="recipient_name" value="${order.recipient_name}"></td>
                                <td><textarea name="address">${order.address}</textarea></td>
                                <td><input type="text" name="phone" value="${order.phone}"></td>
                                <td><input type="date" name="shipping_date" value="${order.shipping_date}"></td>
                                <td><input type="text" name="delivery_status" value="${order.delivery_status}"></td>
                                <td><input type="text" name="payment_method" value="${order.payment_method}"></td>
                                <td><input type="date" name="payment_date" value="${order.payment_date}"></td>
                                <td><input type="text" name="payment_status" value="${order.payment_status}"></td>
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


            function toggleEditRow(orderId) {
                let editRow = document.getElementById('edit-row-' + orderId);
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
        </script>
    </body>
</html>