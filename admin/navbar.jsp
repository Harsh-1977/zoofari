<%
String currentPage = request.getRequestURI();
String admin = (String) session.getAttribute("admin");
String ctx = request.getContextPath();
%>

<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-4 px-lg-5 wow fadeIn"
     data-wow-delay="0.1s">

    <!-- Logo -->
    <a href="<%=ctx%>/admin/index.jsp" class="navbar-brand p-0">
        <img class="img-fluid me-3" src="<%=ctx%>/img/icon/icon-10.png" alt="Icon" />
        <h1 class="m-0 text-primary">Zoofari Admin</h1>
    </a>

    <!-- Mobile Toggle -->
    <button type="button" class="navbar-toggler" data-bs-toggle="collapse"
        data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar Menu -->
    <div class="collapse navbar-collapse py-4 py-lg-0" id="navbarCollapse">

        <div class="navbar-nav ms-auto">

            <a href="<%=ctx%>/admin/index.jsp"
               class="nav-item nav-link <%= currentPage.endsWith("index.jsp") ? "active" : "" %>">
               Dashboard
            </a>

            <a href="<%=ctx%>/admin/scan_qr.jsp"
               class="nav-item nav-link <%= currentPage.endsWith("scan_qr.jsp") ? "active" : "" %>">
               Scan QR
            </a>

            <a href="<%=ctx%>/admin/service_display.jsp"
               class="nav-item nav-link <%= currentPage.endsWith("service_display.jsp") ? "active" : "" %>">
               Services
            </a>

            <a href="<%=ctx%>/admin/animal_display.jsp"
               class="nav-item nav-link <%= currentPage.endsWith("animal_display.jsp") ? "active" : "" %>">
               Our Animals
            </a>

            <a href="<%=ctx%>/admin/login_display.jsp"
               class="nav-item nav-link <%= currentPage.endsWith("login_display.jsp") ? "active" : "" %>">
               Login Data
            </a>

            <a href="<%=ctx%>/admin/feedback_display.jsp"
               class="nav-item nav-link <%= currentPage.endsWith("feedback_display.jsp") ? "active" : "" %>">
               Feedback
            </a>

            <a href="<%=ctx%>/admin/contact_display.jsp"
               class="nav-item nav-link <%= currentPage.endsWith("contact_display.jsp") ? "active" : "" %>">
               Contact
            </a>

            <% if(admin == null){ %>

            <a href="<%=ctx%>/admin/admin_login.jsp"
               class="nav-item nav-link auth-btn login-btn <%= currentPage.endsWith("admin_login.jsp") ? "active" : "" %>">
               Login
            </a>

            <% } else { %>

            <a href="<%=ctx%>/admin/logout.jsp"
               class="nav-item nav-link auth-btn logout-btn <%= currentPage.endsWith("logout.jsp") ? "active" : "" %>">
               Logout
            </a>

            <% } %>

        </div>

        <!-- Booking Button -->
        <a href="<%=ctx%>/admin/buy_display.jsp"
            class="btn btn-success auth-gap">
            Ticket Booking<i class="fa fa-arrow-right ms-3"></i>
         </a>

    </div>
</nav>