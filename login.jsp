<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html>

    <head>
        <meta charset="utf-8" />
        <title>Zoofari</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="keywords" />
        <meta content="" name="description" />

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon" />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Quicksand:wght@600;700&display=swap"
            rel="stylesheet" />

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet" />
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/login_css.css" rel="stylesheet" />

    </head>


    <body>
        <jsp:include page="forms/navbar.jsp" />

        <!-- Page Header Start -->
        <div class="container-fluid header-bg py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <h1 class="display-4 text-white mb-3 animated slideInDown">
                    Login & register
                </h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a class="text-white" href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-white" href="#">Pages</a>
                        </li>
                        <li class="breadcrumb-item text-primary active" aria-current="page">
                            Login & register
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->

        <section class="login-section">
            <div class="login-wrapper">

                <!-- Left Image -->
                <div class="login-image">
                    <img src="img/tiger.jpg" alt="Zoo Animal">
                </div>

                <!-- Right Login Form -->
                <div class="login-form">
                    <h2>Login</h2>
                    <p>Welcome back! Please login to your account</p>

                    <form action="forms/login_process.jsp" method="post">

                        <div class="form-group">
                            <input type="email" placeholder="Enter your email" name="email" id="email" required>
                        </div>

                        <div class="form-group password-group">
                            <input type="password" placeholder="Enter your password" name="password" id="password" required>
                            <span class="toggle-password" onclick="togglePassword('password', this)">👁</span>
                        </div>

                        <button type="submit">Login</button>

                        <div class="form-links">
                            <a href="forgot.jsp">Forgot Password?</a>
                            <a href="register.jsp">Create Account</a>
                        </div>

                    </form>
                </div>
            </div>
        </section>


        <!-- Footer Start -->
        <div class="container-fluid footer bg-dark text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-light mb-4">Address</h5>
                        <p class="mb-2">
                            <i class="fa fa-map-marker-alt me-3"></i>Zoofari, Sasan Gir, Gujarat
                        </p>
                        <p class="mb-2">
                            <i class="fa fa-phone-alt me-3"></i>+91 99099 88066
                        </p>
                        <p class="mb-2">
                            <i class="fa fa-envelope me-3"></i>info@zoofari.com
                        </p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social"
                                href="https://www.instagram.com/__harshparmar_?igsh=OTR1cXVoNnVmZ253"><i
                                    class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <h5 class="text-light mb-4">Thank You</h5>
                        <p class="thank-text">
                            Thank you for visiting Zoofari! We appreciate your interest
                            in our zoo and safari park. We hope to see you soon!
                        </p>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-light mb-4">Quick Links</h5>
                        <a class="btn btn-link" href="about.jsp">About Us</a>
                        <a class="btn btn-link" href="contact.jsp">Contact Us</a>
                        <a class="btn btn-link" href="service.jsp">Our Services</a>
                        <a class="btn btn-link">Terms & Condition</a>
                        <a class="btn btn-link">Support</a>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Zoofari</a>, All
                            Right Reserved.
                            <br/> Developed By: HARSH PARMAR & HARSH BHATT
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
            /* Toggle Password */
            function togglePassword(id, icon) {

                let field = document.getElementById(id);

                if (field.type === "password") {
                    field.type = "text";
                    icon.innerHTML = "👁";
                } else {
                    field.type = "password";
                    icon.innerHTML = "👁";
                }
            }

            /* Confirm Password Match */
            document.getElementById("confirmPassword").addEventListener("keyup", function () {

                let pass = document.getElementById("password").value;
                let confirm = this.value;
                let msg = document.getElementById("matchMsg");

                if (pass === confirm) {
                    msg.style.color = "green";
                    msg.innerHTML = "Passwords Match";
                } else {
                    msg.style.color = "red";
                    msg.innerHTML = "Passwords Do Not Match";
                }
            });
        </script>
    </body>

    </html>