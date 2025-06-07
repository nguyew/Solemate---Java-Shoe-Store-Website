<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Models.UserDTO"%>
<html lang="en">

    <head>
        <title>Nike Air Max - Solemate</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">

        <style>
            .review-card {
                border: 1px solid #dee2e6;
                border-radius: 5px;
                padding: 15px;
                margin-bottom: 20px;
            }
            .review-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .review-author {
                font-weight: bold;
            }
            .review-date {
                color: #6c757d;
                font-size: 0.9em;
            }
            .review-rating {
                color: #ffc107;
                margin-bottom: 10px;
            }
            .related-products {
                margin-top: 50px;
            }
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
                <a class="navbar-brand text-success logo h1 align-self-center" href="index.jsp">
                    Solemate
                </a>

                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                    <div class="flex-fill">
                        <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                            <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.isAdmin}">
                                <li class="nav-item">
                                    <a class="nav-link" href="ProductAdminController">Admin</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ShopController">Shop</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">Contact</a>
                            </li>
                        </ul>
                    </div>
                    <div class="navbar align-self-center d-flex">
                        <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                                <div class="input-group-text">
                                    <i class="fa fa-fw fa-search"></i>
                                </div>
                            </div>
                        </div>
                        <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                            <i class="fa fa-fw fa-search text-dark mr-2"></i>
                        </a>
                        <a class="nav-icon position-relative text-decoration-none" href="cart.jsp">
                            <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        </a>
                        <%
                            UserDTO user = (UserDTO) request.getAttribute("currentUser");
                            if (user != null) {
                        %>
                        <a class="nav-icon position-relative text-decoration-none" href="#">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i> Hello, <%= user.getFullName()%>
                        </a>
                        <a href="LogoutController" class="nav-link">Logout</a>
                        <%
                        } else {
                        %>
                        <a class="nav-icon position-relative text-decoration-none" href="login.jsp">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i> Sign In
                        </a>
                        <%
                            }
                        %>
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

        <!-- Open Content -->
        <section class="bg-light">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-lg-5 mt-5">
                        <div class="card mb-3">
                            <img class="card-img img-fluid" src="${pDetail.image}" id="product-detail">
                        </div>
                    </div>
                    <!-- col end -->
                    <div class="col-lg-7 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="h2">${pDetail.product_name}</h1>
                                <p class="h3 py-2">${pDetail.price}$</p>
                                <p class="py-2">
                                    <i class="fa fa-star text-warning"></i>
                                    <i class="fa fa-star text-warning"></i>
                                    <i class="fa fa-star text-warning"></i>
                                    <i class="fa fa-star text-warning"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <span class="list-inline-item text-dark">Rating 4.2 | 36 Reviews</span>
                                </p>
                                <h4>Description:</h4>
                                <h6>${pDetail.description}</h6>

                                <!-- Form g?i thông tin s?n ph?m ??n AddToCartController -->
                                <form action="AddToCartController" method="POST">
                                    <input type="hidden" name="product-title" value="${pDetail.product_name}">
                                    <input type="hidden" name="product-price" value="${pDetail.price}">
                                    <input type="hidden" name="product-image" value="${pDetail.image}"> <!-- ? Thêm dòng này -->

                                    <input type="hidden" name="product-quantity" id="product-quanity" value="1">

                                    <div class="row">
                                        <div class="col-auto">
                                            <ul class="list-inline pb-3">
                                                <li class="list-inline-item text-right">
                                                    Quantity
                                                </li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                                <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <label for="sizeSelect" class="form-label">Size:</label>
                                            <select class="form-select" name="product-size" id="sizeSelect" required style="margin-bottom: 20px;">
                                                <option value="" disabled selected>Select your size</option>
                                                <option value="37">37</option>
                                                <option value="38">38</option>
                                                <option value="39">39</option>
                                                <option value="40">40</option>
                                                <option value="41">41</option>
                                                <option value="42">42</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row pb-3">
                                        <div class="col d-grid">
                                            <button type="submit" class="btn btn-success btn-lg" name="submit" value="buy">Buy Now</button>
                                        </div>
                                        <div class="col d-grid">
                                            <button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocart">Add To Cart</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Reviews Section -->
        <div class="row mt-5">
            <div class="col-lg-12">
                <h3 class="mb-4">Customer Reviews</h3>

                <!-- Review Form -->
                <div class="card mb-4">
                    <div class="card-body">
                        <h5>Write a Review</h5>
                        <form>
                            <div class="mb-3">
                                <label class="form-label">Rating</label>
                                <div class="rating">
                                    <i class="far fa-star" data-rating="1"></i>
                                    <i class="far fa-star" data-rating="2"></i>
                                    <i class="far fa-star" data-rating="3"></i>
                                    <i class="far fa-star" data-rating="4"></i>
                                    <i class="far fa-star" data-rating="5"></i>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="reviewTitle" class="form-label">Title</label>
                                <input type="text" class="form-control" id="reviewTitle" placeholder="Summary of your experience">
                            </div>
                            <div class="mb-3">
                                <label for="reviewText" class="form-label">Review</label>
                                <textarea class="form-control" id="reviewText" rows="3" placeholder="Share your experience with this product"></textarea>
                            </div>
                            <button type="submit" class="btn btn-success">Submit Review</button>
                        </form>
                    </div>
                </div>

                <!-- Existing Reviews -->
                <div class="review-card">
                    <div class="review-header">
                        <span class="review-author">Michael Johnson</span>
                        <span class="review-date">March 15, 2023</span>
                    </div>
                    <div class="review-rating">
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                    </div>
                    <h5>Perfect running shoes!</h5>
                    <p>I've been using these for my daily 5k runs and they're incredibly comfortable. The cushioning is just right - not too soft, not too firm. They fit true to size and the breathability is excellent.</p>
                </div>

                <div class="review-card">
                    <div class="review-header">
                        <span class="review-author">Sarah Williams</span>
                        <span class="review-date">February 28, 2023</span>
                    </div>
                    <div class="review-rating">
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-secondary"></i>
                    </div>
                    <h5>Great shoes but runs slightly large</h5>
                    <p>Love the design and comfort of these shoes. The only issue is that they seem to run about half a size large. I normally wear size 9 but had to exchange for 8.5. Other than that, they're perfect!</p>
                </div>

                <div class="review-card">
                    <div class="review-header">
                        <span class="review-author">David Kim</span>
                        <span class="review-date">January 10, 2023</span>
                    </div>
                    <div class="review-rating">
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star text-secondary"></i>
                    </div>
                    <h5>Good but not for wide feet</h5>
                    <p>The shoes look great and are comfortable for short periods, but I have wide feet and after a full day of wear they become uncomfortable. Would recommend for normal or narrow feet.</p>
                </div>
            </div>
        </div>


        <!-- Close Content -->

        <!-- Start Footer -->
        <footer class="bg-dark" id="tempaltemo_footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-success border-bottom pb-3 border-light logo">Solemate</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li>
                                <i class="fas fa-map-marker-alt fa-fw"></i>
                                123 Shoe Street, Footville, FS 12345
                            </li>
                            <li>
                                <i class="fa fa-phone fa-fw"></i>
                                <a class="text-decoration-none" href="tel:123-123-1234">123-123-1234</a>
                            </li>
                            <li>
                                <i class="fa fa-envelope fa-fw"></i>
                                <a class="text-decoration-none" href="mailto:info@solemate.com">info@solemate.com</a>
                            </li>
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

        <!-- Start Slider Script -->
        <script src="assets/js/slick.min.js"></script>
        <script>
            $('#carousel-related-product').slick({
                infinite: true,
                arrows: false,
                slidesToShow: 4,
                slidesToScroll: 3,
                dots: true,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    }
                ]
            });

            // Star rating interaction for review form
            $(document).ready(function () {
                $('.rating i').click(function () {
                    const rating = $(this).data('rating');
                    $('.rating i').removeClass('fas').addClass('far');
                    $(this).prevAll().addBack().removeClass('far').addClass('fas');
                    $('#ratingValue').val(rating);
                });
            });
        </script>
        <!-- End Slider Script -->
    </body>
</html>