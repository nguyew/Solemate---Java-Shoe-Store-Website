<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/extra.css">
    <link rel="stylesheet" href="assets/css/custom.css">
</head>

<body>
    <div class="container" id="container">
        <!-- Form dang ky -->
        <div class="form-container sign-up-container">
            <form action="RegisterController" method="POST">
                <h1>Create Account</h1>
                <input type="text" placeholder="Full Name" name="fullName" required />
                <input type="text" placeholder="Username" name="username" required />
                <input type="email" placeholder="Email" name="email" required />
                <input type="tel" placeholder="Phone Number" name="phone" required />
                <input type="password" placeholder="Password" name="password" required />
                <input type="submit" id="buttonSignup" value="Sign up">
            </form>
        </div>

        <%-- Form dang nhap --%>
        <div class="form-container sign-in-container">
            <form action="LoginController" method="POST">
                <h1>Sign In</h1>

                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                    <div class="alert alert-danger mt-2"><%= error %></div>
                <%
                    }
                %>

                <input type="text" name="loginName" placeholder="Username" required />
                <input type="password" name="loginPass" placeholder="Password" required />

                <div class="remember-me">
                    <input type="checkbox" name="remember" id="remember" />
                    <label for="remember">Remember Me</label>
                </div>

                <a href="#">Forgot your password?</a>
                <input type="submit" id="buttonLogin" value="Sign In">
            </form>
        </div>

        <%-- Hi?n th? thông báo sau khi ??ng nh?p thành công --%>
        <%
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
        <div class="alert alert-info mt-3">
            <%= successMessage %>
        </div>
        <%
            }
        %>

        <!-- Overlay -->
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>

    <footer></footer>

    <!-- JavaScript -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/extra.js"></script>
    <script src="assets/js/custom.js"></script>
</body>

</html>
