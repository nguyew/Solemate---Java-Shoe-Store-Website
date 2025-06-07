<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Users - SoleMate Admin</title>
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
        }
        .main-content h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }
        .search-bar {
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
            max-height: 500px;
            overflow-y: auto;
            overflow-x: auto;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            font-size: 14px;
            border-bottom: 1px solid #eee;
            overflow-wrap: break-word;
            white-space: normal;
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
            background-color: #f44336;
            color: white;
        }
        .action-buttons .delete-btn:hover {
            background-color: #e53935;
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
        .edit-row select {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .edit-row .confirm-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .role-admin {
            color: #2ecc71; /* Green for Admin */
        }
        .role-user {
            color: #3498db; /* Blue for User */
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
                <button type="submit">Orders</button>
            </form>
            <form action="UserAdminController" method="GET">
                <button type="submit" class="active">Users</button>
            </form>
           
        </div>

        <div class="main-content">
            <h2>Customer</h2>
            
            <div class="search-bar">
              <div class="search-bar">
    <form action="UserAdminController" method="GET">
        <input type="text" name="keyword" placeholder="Search User..." autocomplete="off" />
       <input type="submit" value="Search">
    </form>
</div>

            </div>

            <div class="table-container">
                <table id="customerTable">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${users == null}">
                            <tr>
                                <td colspan="8">Users list is null.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>#${user.userId}</td>
                                <td>${user.fullName}</td>
                                <td>${user.username}</td>
                                <td>${user.email}</td>
                                <td>${user.phoneNumber}</td>
                                <td>${user.password}</td>
                                <td>
                                    <span class="${user.isAdmin ? 'role-admin' : 'role-user'}">
                                        ${user.isAdmin ? 'Admin' : 'User'}
                                    </span>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="update-btn" onclick="toggleEditRow(${user.userId})">Edit</button>
                                        <form action="UserAdminController" method="POST">
                                            <input type="hidden" name="user_id" value="${user.userId}">
                                            <input type="hidden" name="action" value="delete">
                                            <button class="delete-btn" type="submit" onclick="return confirm('Are you sure you want to delete this user?')">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <tr class="edit-row" id="edit-row-${user.userId}">
                                <form action="UserAdminController" method="POST">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="user_id" value="${user.userId}">
                                    <td><input type="text" name="userId" value="${user.userId}" readonly></td>
                                    <td><input type="text" name="fullName" value="${user.fullName}"></td>
                                    <td><input type="text" name="username" value="${user.username}"></td>
                                    <td><input type="text" name="email" value="${user.email}"></td>
                                    <td><input type="text" name="phoneNumber" value="${user.phoneNumber}"></td>
                                    <td><input type="text" name="password" value="${user.password}"></td>
                                    <td>
                                        <select name="isAdmin">
                                            <option value="true" ${user.isAdmin ? 'selected' : ''}>Admin</option>
                                            <option value="false" ${user.isAdmin ? '' : 'selected'}>User</option>
                                        </select>
                                    </td>
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
     

        function toggleEditRow(userId) {
            let editRow = document.getElementById('edit-row-' + userId);
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