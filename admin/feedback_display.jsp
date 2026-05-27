<%@page import ="java.io.*" %>
<%@page import ="java.sql.*" %>

<html>
<head>
    <%
    if(session.getAttribute("admin") == null){
        response.sendRedirect("admin_login.jsp");
        return;
    }
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
    <style>
        body{
        margin:0;
        font-family: Arial, Helvetica, sans-serif;
        background:#eaf9fb;
        }

        /* HERO SECTION */
        .feedback-hero{
            height:350px;
            background:url("assets/img/feedback-bg.jpg") center/cover no-repeat;
            position:relative;
        }
        .feedback-hero {
            margin-top: 90px; /* height of navbar */
        }
        .feedback-hero::before{
            content:"";
            position:absolute;
            top:0; left:0;
            width:100%; height:100%;
            background:rgba(0,0,0,0.6);
        }
        .hero-text{
            position:relative;
            color:white;
            padding:100px 80px;
        }
        .hero-text h1{
            font-size:42px;
        }
        .hero-text p{
            font-size:18px;
        }

        /* TABLE */
        .feedback-box{
            width:85%;
            margin:-80px auto 50px;
            background:white;
            padding:25px;
            border-radius:12px;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
        }
        table{
            width:100%;
            border-collapse:collapse;
        }
        th{
            background:#0bbcd6;
            color:white;
            padding:12px;
        }
        td{
            padding:12px;
            text-align:center;
        }
        tr:nth-child(even){
            background:#e8f6f8;
        }
        .btn-edit{
            background:#28a745;
            color:white;
            padding:6px 12px;
            text-decoration:none;
            border-radius:5px;
        }
        .btn-delete{
            background:#dc3545;
            color:white;
            padding:6px 12px;
            text-decoration:none;
            border-radius:5px;
        }   
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <!-- <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-4 px-lg-5 wow fadeIn"
      data-wow-delay="0.1s">
      <a href="index.jsp" class="navbar-brand p-0">
        <img class="img-fluid me-3" src="img/icon/icon-10.png" alt="Icon" />
        <h1 class="m-0 text-primary">Zoofari</h1>
      </a>
      <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse py-4 py-lg-0" id="navbarCollapse">
        <div class="navbar-nav ms-auto">
          <a href="index.jsp" class="nav-item nav-link">Home</a>
          <a href="service_display.jsp" class="nav-item nav-link">Services</a>
          <a href="animal_display.jsp" class="nav-item nav-link">Our Animals</a>
          <a href="feedback_display.jsp" class="nav-item nav-link active">Feedback</a>
          <a href="login_display.jsp" class="nav-item nav-link">Login</a>
          <a href="contact_display.jsp" class="nav-item nav-link">Contact</a>
        </div>
        <a href="buy_display.jsp" class="btn btn-primary">Ticket Bookings<i class="fa fa-arrow-right ms-3"></i></a>
      </div>
    </nav> -->
    <div style="height:90px;"></div>

    <div class="feedback-box">
<h2 class="text-center mb-4">Feedback List</h2>

<div class="table-responsive">
<table class="table table-bordered table-striped table-hover text-center align-middle">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Experience</th>
            <th>Rating</th>
            <th>Message</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

<%
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

Statement st = cn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM feedback");

while(rs.next()){
%>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("experience")%></td>
            <td><%=rs.getInt("rating")%></td>
            <td><%=rs.getString("message")%></td>
            <td>
                <a href="../crud/editFeedback.jsp?id=<%=rs.getInt("id")%>" 
                   class="btn btn-success btn-sm">Edit</a>

                <a href="../crud/deleteFeedback.jsp?id=<%=rs.getInt("id")%>" 
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('Delete this feedback?')">
                   Delete
                </a>
            </td>
        </tr>
<%
}
%>

    </tbody>
</table>
</div>
</div>

</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>