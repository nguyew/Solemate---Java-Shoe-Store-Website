<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Models.UserDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shopping Cart - Solemate</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    <style>
        .cart-table { width: 100%; margin-bottom: 30px; }
        .cart-table th { padding: 15px; text-align: left; border-bottom: 1px solid #dee2e6; }
        .cart-table td { padding: 15px; vertical-align: middle; border-bottom: 1px solid #dee2e6; }
        .product-info { display: flex; align-items: center; }
        .product-info img { width: 80px; height: 80px; object-fit: cover; margin-right: 15px; }
        .product-details h5 { margin-bottom: 5px; }
        .product-details p { margin: 0; color: #6c757d; font-size: 0.9em; }
        .quantity-input { width: 70px; text-align: center; }
        .cart-totals { background: #f8f9fa; padding: 20px; border-radius: 5px; }
        .cart-totals table { width: 100%; }
        .cart-totals td { padding: 10px 0; }
        .cart-totals tr:last-child td { border-top: 1px solid #dee2e6; font-weight: bold; }
        .btn-remove { color: #dc3545; background: none; border: none; }
        .btn-remove:hover { color: #bb2d3b; }
        .btn-checkout { background: #28a745; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; display: inline-block; text-align: center; width: 100%; }
        .btn-checkout:hover { background: #218838; color: white; }
        .btn-continue { background: #6c757d; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; display: inline-block; text-align: center; width: 100%; }
        .btn-continue:hover { background: #5a6268; color: white; }
        .empty-cart { text-align: center; padding: 50px 0; }
    </style>
</head>
<body>
    <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@solemate.com">info@solemate.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:123-123-1234">123-123-1234</a>
                </div>
                <div>
                    <a class="text-light" href="https://facebook.com/" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->

    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand text-success logo h1 align-self-center" href="index.jsp">Solemate</a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="ShopController">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="cart.jsp">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${sessionScope.cart != null ? sessionScope.cart.size() : 0}</span>
                    </a>
                    <c:if test="${not empty sessionScope.currentUser}">
                        <a class="nav-icon position-relative text-decoration-none" href="#">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i> Hello, ${sessionScope.currentUser.fullName}
                        </a>
                        <a href="LogoutController" class="nav-link">Logout</a>
                    </c:if>
                    <c:if test="${empty sessionScope.currentUser}">
                        <a class="nav-icon position-relative text-decoration-none" href="login.jsp">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i> Sign In
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Header -->

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Shopping Cart Section -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="mb-4">Your Shopping Cart</h2>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <c:choose>
                        <c:when test="${empty sessionScope.cart}">
                            <div class="empty-cart">
                                <h4>Your cart is empty.</h4>
                                <p><a href="ShopController">Continue shopping</a> to add items to your cart.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="cart-table">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Size</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${sessionScope.cart}" varStatus="loop">
                                            <tr>
                                                <td>
                                                    <div class="product-info">
                                                        <img src="${item.productImage}" alt="${item.productName}">
                                                        <div class="product-details">
                                                            <h5>${item.productName}</h5>
                                                            <p>${item.productSize}</p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>${item.productSize}</td>
                                                <td>$${item.price}</td>
                                                <td>
                                                    <form action="UpdateCartController" method="post" style="display:inline;">
                                                        <input type="hidden" name="index" value="${loop.index}">
                                                        <input type="number" class="form-control quantity-input" name="quantity" value="${item.quantity}" min="1" onchange="this.form.submit()">
                                                    </form>
                                                </td>
                                                <td>$${item.totalPrice}</td>
                                                <td>
                                                    <form action="RemoveFromCartController" method="post" style="display:inline;">
                                                        <input type="hidden" name="index" value="${loop.index}">
                                                        <button type="submit" class="btn-remove">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <div class="d-flex justify-content-between mb-4">
                        <a href="ShopController" class="btn-continue">Continue Shopping</a>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="cart-totals">
                        <h4 class="mb-4">Cart Summary</h4>
                        <table>
                            <tr>
                                <td>Subtotal</td>
                                <td class="text-right">$<span id="subtotal">${sessionScope.totalPrice != null ? sessionScope.totalPrice : 0.00}</span></td>
                            </tr>
                            <tr>
                                <td>Shipping Fee</td>
                                <td class="text-right">$<span id="shippingFee">${sessionScope.totalPrice != null ? 10.00 : 0.00}</span></td>
                            </tr>
                            <tr>
                                <td>Tax (8%)</td>
                                <td class="text-right">$<span id="tax">${sessionScope.totalPrice != null ? sessionScope.totalPrice * 0.08 : 0.00}</span></td>
                            </tr>
                            <tr>
                                <td><strong>Total</strong></td>
                                <td class="text-right"><strong>$<span id="totalPrice">${sessionScope.totalPrice != null ? sessionScope.totalPrice + (sessionScope.totalPrice * 0.08) + 10.00 : 0.00}</span></strong></td>
                            </tr>
                        </table>
                        <c:if test="${not empty sessionScope.cart}">
                            <a href="checkout.jsp" class="btn-checkout mt-3">Proceed to Checkout</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">Solemate</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><i class="fas fa-map-marker-alt fa-fw"></i> 123 Shoe Street, Footville, FS 12345</li>
                        <li><i class="fa fa-phone fa-fw"></i> <a class="text-decoration-none" href="tel:123-123-1234">123-123-1234</a></li>
                        <li><i class="fa fa-envelope fa-fw"></i> <a class="text-decoration-none" href="mailto:info@solemate.com">info@solemate.com</a></li>
                    </ul>
                </div>
                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Women's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Running Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Casual Shoes</a></li>
                    </ul>
                </div>
                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Home</a></li>
                        <li><a class="text-decoration-none" href="#">About Us</a></li>
                        <li><a class="text-decoration-none" href="#">Shop Locations</a></li>
                        <li><a class="text-decoration-none" href="#">FAQs</a></li>
                        <li><a class="text-decoration-none" href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>