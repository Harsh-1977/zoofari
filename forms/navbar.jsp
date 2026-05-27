<%
    String currentPage = request.getRequestURI();
%>
<% String user=(String) session.getAttribute("user"); %>

    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-4 px-lg-5 wow fadeIn"
        data-wow-delay="0.1s">

        <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand p-0">
            <img class="img-fluid me-3" src="${pageContext.request.contextPath}/img/icon/icon-10.png" alt="Icon" />
            <h1 class="m-0 text-primary">Zoofari</h1>
        </a>

        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse py-4 py-lg-0" id="navbarCollapse">
            <div class="navbar-nav ms-auto">
                <a href="${pageContext.request.contextPath}/index.jsp"
                class="nav-item nav-link <%= currentPage.endsWith("index.jsp") ? "active" : "" %>">Home</a>
                <a href="${pageContext.request.contextPath}/about.jsp"
                    class="nav-item nav-link <%= currentPage.endsWith("about.jsp") ? "active" : "" %>">About</a>
                <a href="${pageContext.request.contextPath}/service.jsp"
                    class="nav-item nav-link <%= currentPage.endsWith("service.jsp") ? "active" : "" %>">Services</a>
                <a href="${pageContext.request.contextPath}/animal.jsp"
                    class="nav-item nav-link <%= currentPage.endsWith("animal.jsp") ? "active" : "" %>">Our Animals</a>
                <a href="${pageContext.request.contextPath}/feedback.jsp"
                    class="nav-item nav-link <%= currentPage.endsWith("feedback.jsp") ? "active" : "" %>">Feedback</a>

                <a href="${pageContext.request.contextPath}/contact.jsp"
                    class="nav-item nav-link <%= currentPage.endsWith("contact.jsp") ? "active" : "" %>">Contact</a>
            </div>
            <% if (user==null) { %>
                <a href="${pageContext.request.contextPath}/login.jsp"
                    class="btn btn-outline-success auth-gap">
                    Login 
                </a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/forms/logout.jsp"
                    class="btn btn-success auth-gap">
                    Logout
                </a>
            <% } %>

                <a href="${pageContext.request.contextPath}/buy.jsp"
                    class="btn btn-success auth-gap">
                    Buy Ticket <i class="fa fa-arrow-right ms-3"></i>
                </a>
        </div>
    </nav>
    <!-- Navbar End -->