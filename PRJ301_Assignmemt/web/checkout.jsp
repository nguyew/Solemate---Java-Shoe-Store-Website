<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Checkout - Solemate</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    <style>
        .checkout-section { padding: 30px 0; }
        .checkout-heading { margin-bottom: 25px; position: relative; }
        .checkout-heading h3 { font-size: 20px; font-weight: 500; margin-bottom: 15px; }
        .form-control { margin-bottom: 15px; }
        .order-summary { background: #f8f9fa; padding: 20px; border-radius: 5px; margin-bottom: 20px; }
        .order-product { display: flex; align-items: center; margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #e5e5e5; }
        .order-product:last-child { border-bottom: none; }
        .order-product img { width: 60px; height: 60px; object-fit: cover; margin-right: 15px; }
        .order-product-info h6 { margin-bottom: 5px; }
        .order-product-info p { margin: 0; color: #6c757d; font-size: 0.9em; }
        .order-totals table { width: 100%; }
        .order-totals td { padding: 8px 0; }
        .order-totals tr:last-child td { border-top: 1px solid #dee2e6; font-weight: bold; padding-top: 15px; }
        .payment-methods { margin-top: 20px; }
        .payment-method { margin-bottom: 15px; padding: 15px; border: 1px solid #e5e5e5; border-radius: 5px; cursor: pointer; }
        .payment-method.active { border-color: #28a745; background-color: rgba(40, 167, 69, 0.05); }
        .payment-method-header { display: flex; align-items: center; justify-content: space-between; }
        .payment-method-logo { display: flex; align-items: center; }
        .payment-method-logo img { height: 30px; margin-right: 10px; }
        .payment-method-details { margin-top: 15px; display: none; }
        .payment-method.active .payment-method-details { display: block; }
        .btn-back { background: #6c757d; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; display: inline-block; }
        .btn-back:hover { background: #5a6268; color: white; }
        .btn-order { background: #28a745; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; display: inline-block; width: 100%; text-align: center; font-weight: bold; }
        .btn-order:disabled { background: #cccccc; cursor: not-allowed; }
        .btn-order:hover:not(:disabled) { background: #218838; color: white; }
        .form-group label { margin-bottom: 5px; font-weight: 500; }
        .form-check { margin-bottom: 10px; }
        .vietqr-container { text-align: center; margin-top: 15px; }
        .vietqr-code { max-width: 200px; margin: 0 auto; border: 1px solid #e5e5e5; padding: 10px; background-color: white; }
        .vietqr-info { margin-top: 10px; font-size: 0.9em; }
        .vietqr-bank { font-weight: bold; margin-bottom: 5px; }
        .camera-container { width: 100%; max-width: 300px; margin: 15px auto; border: 1px solid #e5e5e5; padding: 10px; text-align: center; }
        .camera-btn { background: #007bff; color: white; border: none; padding: 8px 15px; border-radius: 5px; margin-top: 10px; cursor: pointer; }
        .camera-btn:hover { background: #0069d9; }
        .cod-info { padding: 15px; background-color: #f8f9fa; border-radius: 5px; margin-top: 15px; }
        .cod-icon { font-size: 24px; color: #28a745; margin-right: 10px; }
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
                        <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="shop.jsp">Shop</a></li>
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
                    <a class="nav-icon position-relative text-decoration-none" href="login.jsp">
                        <i class="fa fa-fw fa-user text-dark mr-3">User</i>
                    </a>
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

    <!-- Checkout Section -->
    <section class="checkout-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="mb-4">Checkout</h2>
                    <% 
                        String errorMessage = (String) session.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                        <div class="alert alert-danger" role="alert">
                            <%= errorMessage %>
                        </div>
                    <% 
                        session.removeAttribute("errorMessage");
                        }
                    %>
                    <% 
                        // Handle form submission directly in JSP
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            // Generate order ID
                            String orderId = "SO-" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                            double total = session.getAttribute("totalPrice") != null ? (Double) session.getAttribute("totalPrice") : 0.0;
                            total = total + (total * 0.08) + 10.00; // Add Shipping Fee and Tax
                            if ("cod".equals(request.getParameter("paymentMethod"))) {
                                total += 2.00; // Add COD Fee
                            }
                            String orderDetails = String.format("Order: %s\nTotal: $%.2f", orderId, total);

                            // Log order details to console
                            System.out.println("Order has been created:\n" + orderDetails);

                            // Clear the cart
                            session.removeAttribute("cart");
                            session.removeAttribute("totalPrice");

                            // Set success message and redirect to confirmation page
                            session.setAttribute("successMessage", "Payment successful! Order ID: " + orderId);
                            response.sendRedirect("confirmation.jsp");
                            return; // Stop further processing
                        }
                    %>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-8">
                    <!-- Shipping Information -->
                    <div class="checkout-heading" id="shipping-section">
                        <h3>Shipping Information</h3>
                    </div>
                    
                    <form id="shipping-form" action="checkout.jsp" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="firstName">First Name</label>
                                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" required>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <input type="text" class="form-control" id="city" name="city" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="state">State/Province</label>
                                    <input type="text" class="form-control" id="state" name="state" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="country">Country</label>
                            <select class="form-control" id="country" name="country" required>
                                <option value="">Select Country</option>
                                <option value="VN">Vietnam</option>
                                <option value="USA">USA</option>
                                <option value="CAN">Canada</option>
                                <option value="UK">United Kingdom</option>
                                <option value="AUS">Australia</option>
                            </select>
                        </div>
                        
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="saveAddress" name="saveAddress">
                            <label class="form-check-label" for="saveAddress">
                                Save this address for future orders
                            </label>
                        </div>
                        
                        <div class="checkout-heading mt-4" id="payment-section">
                            <h3>Payment Methods</h3>
                        </div>
                        
                        <div class="payment-methods">
                            <!-- COD Payment -->
                            <div class="payment-method" id="codMethod">
                                <div class="payment-method-header">
                                    <div class="payment-method-logo">
                                        <input type="radio" name="paymentMethod" id="cod" value="cod">
                                        <label for="cod" class="ms-2">Cash On Delivery (COD)</label>
                                    </div>
                                    <div class="payment-cards">
                                        <i class="fas fa-money-bill-wave fa-lg"></i>
                                    </div>
                                </div>
                                <div class="payment-method-details">
                                    <div class="cod-info">
                                        <div class="d-flex align-items-center mb-2">
                                            <i class="fas fa-check-circle cod-icon"></i>
                                            <h6 class="mb-0">Cash On Delivery</h6>
                                        </div>
                                        <p>Our delivery staff will collect cash on delivery. Please prepare the exact amount.</p>
                                        <div class="alert alert-info" role="alert">
                                            <small>Note: COD option is only available for orders under $500. A $2.00 handling fee will be added to the total amount.</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- VietQR Payment -->
                            <div class="payment-method" id="vietqrMethod">
                                <div class="payment-method-header">
                                    <div class="payment-method-logo">
                                        <input type="radio" name="paymentMethod" id="vietqr" value="vietqr">
                                        <label for="vietqr" class="ms-2">VietQR</label>
                                    </div>
                                    <div class="payment-cards">
                                        <img src="assets/img/vietqr-logo.png" alt="VietQR" height="30">
                                    </div>
                                </div>
                                <div class="payment-method-details">
                                    <div class="vietqr-container">
                                        <div class="vietqr-code">
                                            <img src="assets/img/vietqr-sample.png" alt="VietQR Code" class="img-fluid">
                                        </div>
                                        <div class="vietqr-info">
                                            <div class="vietqr-bank">BIDV</div>
                                            <div>Account Number: 19037298576</div>
                                            <div>Account Name: SOLEMATE CO., LTD</div>
                                            <div>Amount: <span id="vietqrAmount">${sessionScope.totalPrice != null ? (sessionScope.totalPrice + (sessionScope.totalPrice * 0.08) + 10.00) : 0.00}</span> USD</div>
                                            <div>Content: SO-<span id="orderId"><%= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) %></span></div>
                                        </div>
                                    </div>
                                    <div class="camera-container">
                                        <p>Scan the code with your banking app.</p>
                                        <div>
                                            <button type="button" class="camera-btn" id="scanQrBtn">
                                                <i class="fa fa-camera me-2"></i> Scan QR Code
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Credit Card Payment -->
                            <div class="payment-method" id="creditCardMethod">
                                <div class="payment-method-header">
                                    <div class="payment-method-logo">
                                        <input type="radio" name="paymentMethod" id="creditCard" value="creditCard">
                                        <label for="creditCard" class="ms-2">Credit/Debit Card</label>
                                    </div>
                                    <div class="payment-cards">
                                        <i class="fab fa-cc-visa fa-lg me-2"></i>
                                        <i class="fab fa-cc-mastercard fa-lg me-2"></i>
                                        <i class="fab fa-cc-amex fa-lg me-2"></i>
                                        <i class="fab fa-cc-discover fa-lg"></i>
                                    </div>
                                </div>
                                <div class="payment-method-details">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="cardName">Name On Card</label>
                                                <input type="text" class="form-control" id="cardName" name="cardName" placeholder="John Doe">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="cardNumber">Card Number</label>
                                                <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="expDate">Expiration Date</label>
                                                <input type="text" class="form-control" id="expDate" name="expDate" placeholder="MM/YY">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="cvv">CVV</label>
                                                <input type="text" class="form-control" id="cvv" name="cvv" placeholder="123">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- PayPal Payment -->
                            <div class="payment-method" id="paypalMethod">
                                <div class="payment-method-header">
                                    <div class="payment-method-logo">
                                        <input type="radio" name="paymentMethod" id="paypal" value="paypal">
                                        <label for="paypal" class="ms-2">PayPal</label>
                                    </div>
                                    <div class="payment-cards">
                                        <i class="fab fa-paypal fa-lg"></i>
                                    </div>
                                </div>
                                <div class="payment-method-details">
                                    <p>You will be redirected to PayPal to complete the payment.</p>
                                </div>
                            </div>
                            
                            <!-- Bank Transfer Payment -->
                            <div class="payment-method" id="bankTransferMethod">
                                <div class="payment-method-header">
                                    <div class="payment-method-logo">
                                        <input type="radio" name="paymentMethod" id="bankTransfer" value="bankTransfer">
                                        <label for="bankTransfer" class="ms-2">Bank Transfer</label>
                                    </div>
                                    <div class="payment-cards">
                                        <i class="fas fa-university fa-lg"></i>
                                    </div>
                                </div>
                                <div class="payment-method-details">
                                    <p>Make payment directly to our bank account. Please use Order Number as payment reference.</p>
                                    <p><strong>Bank:</strong> Sample Bank</p>
                                    <p><strong>Bank Account Number:</strong> 123456789</p>
                                    <p><strong>Identification Code:</strong> 987654321</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="d-flex justify-content-between mt-4">
                            <a href="cart.jsp" class="btn-back">Back to Cart</a>
                        </div>
                    </form>
                </div>
                
                <div class="col-lg-4">
                    <div class="order-summary">
                        <h4 class="mb-4">Order Summary</h4>
                        <div class="order-products">
                            <c:choose>
                                <c:when test="${empty sessionScope.cart}">
                                    <p>Your cart is empty.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="item" items="${sessionScope.cart}">
                                        <div class="order-product">
                                            <img src="${item.productImage}" alt="${item.productName}">
                                            <div class="order-product-info">
                                                <h6>${item.productName}</h6>
                                                <p>Size: ${item.productSize}</p>
                                                <p>${item.quantity} × $${item.price}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="order-totals mt-4">
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
                                <tr id="codFeeRow" style="display: none;">
                                    <td>COD Fee</td>
                                    <td class="text-right">$<span id="codFee">2.00</span></td>
                                </tr>
                                <tr>
                                    <td><strong>Total</strong></td>
                                    <td class="text-right"><strong>$<span id="orderTotal">${sessionScope.totalPrice != null ? sessionScope.totalPrice + (sessionScope.totalPrice * 0.08) + 10.00 : 0.00}</span></strong></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="mt-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="termsConditions" required>
                            <label class="form-check-label" for="termsConditions">
                                I agree with the <a href="#">terms and conditions</a>
                            </label>
                        </div>
                        <button type="submit" form="shipping-form" class="btn-order mt-3" id="placeOrderBtn" disabled>Place Order</button>
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
                        <li><i class="fas fa-map-marker-alt fa-fw"></i> 123 Shoe Street, Shoe City, FS 12345</li>
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
                    <h2 class="h2 text-light border-bottom pb-3 border-light">More Information</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Home</a></li>
                        <li><a class="text-decoration-none" href="#">About Us</a></li>
                        <li><a class="text-decoration-none" href="#">Store Locations</a></li>
                        <li><a class="text-decoration-none" href="#">FAQ</a></li>
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
            </div>
        </div>
    </footer>
    <!-- End Footer -->

    <!-- Load Bootstrap JS and Popper.js -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>

    <!-- JavaScript for Form Validation, Payment Method Toggle, and COD Fee -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Elements
            const placeOrderBtn = document.getElementById('placeOrderBtn');
            const firstName = document.getElementById('firstName');
            const lastName = document.getElementById('lastName');
            const email = document.getElementById('email');
            const phone = document.getElementById('phone');
            const address = document.getElementById('address');
            const city = document.getElementById('city');
            const state = document.getElementById('state');
            const country = document.getElementById('country');
            const termsConditions = document.getElementById('termsConditions');
            const paymentMethods = document.querySelectorAll('input[name="paymentMethod"]');
            const paymentMethodDivs = document.querySelectorAll('.payment-method');
            const codFeeRow = document.getElementById('codFeeRow');
            const orderTotal = document.getElementById('orderTotal');
            const vietqrAmount = document.getElementById('vietqrAmount');

            // Calculate initial values from session data
            const cartEmpty = ${empty sessionScope.cart ? 'true' : 'false'};
            const subtotal = cartEmpty ? 0.00 : parseFloat('${sessionScope.totalPrice}');
            const shippingFee = cartEmpty ? 0.00 : 10.00;
            const taxRate = 0.08;
            const tax = subtotal * taxRate;
            let baseTotal = subtotal + shippingFee + tax;
            const codFee = 2.00;

            // Update initial display
            document.getElementById('subtotal').innerText = subtotal.toFixed(2);
            document.getElementById('tax').innerText = tax.toFixed(2);
            orderTotal.innerText = baseTotal.toFixed(2);
            vietqrAmount.innerText = baseTotal.toFixed(2);

            // Function to validate form and enable/disable Place Order button
            function validateForm() {
                var isFormFilled = 
                    firstName.value.trim() !== '' &&
                    lastName.value.trim() !== '' &&
                    email.value.trim() !== '' &&
                    phone.value.trim() !== '' &&
                    address.value.trim() !== '' &&
                    city.value.trim() !== '' &&
                    state.value.trim() !== '' &&
                    country.value !== '';

                var isPaymentSelected = false;
                for (var i = 0; i < paymentMethods.length; i++) {
                    if (paymentMethods[i].checked) {
                        isPaymentSelected = true;
                        break;
                    }
                }

                var isTermsAgreed = termsConditions.checked;

                if (isFormFilled && isPaymentSelected && isTermsAgreed && !cartEmpty) {
                    placeOrderBtn.disabled = false;
                } else {
                    placeOrderBtn.disabled = true;
                }
            }

            // Add event listeners to form fields
            [firstName, lastName, email, phone, address, city, state, country].forEach(function(input) {
                input.addEventListener('input', validateForm);
            });

            // Add event listener to country select
            country.addEventListener('change', validateForm);

            // Add event listener to terms and conditions checkbox
            termsConditions.addEventListener('change', validateForm);

            // Add event listeners to payment methods
            paymentMethods.forEach(function(method) {
                method.addEventListener('change', validateForm);
            });

            // Payment method toggle and COD fee logic
            paymentMethodDivs.forEach(function(method) {
                method.addEventListener('click', function() {
                    paymentMethodDivs.forEach(function(m) { m.classList.remove('active'); });
                    this.classList.add('active');
                    var radio = this.querySelector('input[type="radio"]');
                    radio.checked = true;

                    if (this.id === 'codMethod') {
                        codFeeRow.style.display = 'table-row';
                        orderTotal.innerText = (baseTotal + codFee).toFixed(2);
                        vietqrAmount.innerText = (baseTotal + codFee).toFixed(2);
                    } else {
                        codFeeRow.style.display = 'none';
                        orderTotal.innerText = baseTotal.toFixed(2);
                        vietqrAmount.innerText = baseTotal.toFixed(2);
                    }

                    validateForm();
                });
            });

            // Initial validation check
            validateForm();
        });
    </script>
</body>
</html>