<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="img/favicon.ico" rel="icon">

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Quicksand:wght@600;700&display=swap" rel="stylesheet">

<!-- Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Theme -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<style>
/* GENERAL */
body{
    font-family: Arial, Helvetica, sans-serif;
    background:#eaf9fb;
}

.table-responsive{
    margin-top:10px;
}

/* CONTAINER */
.feedback-box{
    width:99%;
    margin:20px auto 40px;
    background:#fff;
    padding:20px 25px 25px;
    border-radius:14px;
    box-shadow:0 12px 30px rgba(0,0,0,0.15);
}

/* TABLE */
.table{
    margin-bottom:0;
    border-radius:12px;
    overflow:hidden;
}

.table thead th{
    background:#2f3640;
    color:#fff;
    font-weight:600;
    font-size:15px;
    text-align:center;
    border:none;
}

.table td{
    font-size:14px;
    padding:14px;
    text-align:center;
    vertical-align:middle;
}

.table tbody tr:nth-child(even){
    background:#f3fbfc;
}

/* STATUS */
.status-paid{
    background:#4cd964;
    color:#fff;
    padding:6px 16px;
    border-radius:20px;
    font-weight:600;
}

.status-pending{
    background:#ff3b30;
    color:#fff;
    padding:6px 16px;
    border-radius:20px;
    font-weight:600;
}

/* IMAGE */
.payment-img{
    width:70px;
    height:70px;
    object-fit:cover;
    border-radius:8px;
    border:1px solid #ddd;
}

/* ACTION BUTTONS */
.action-buttons{
    display:flex;
    justify-content:center;
    gap:8px;
}

.action-buttons a{
    min-width:65px;
}
</style>
</head>

<body>

<!-- NAVBAR -->
 <jsp:include page="navbar.jsp" />
<!-- <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5">
    <a href="index.jsp" class="navbar-brand p-0">
        <img src="img/icon/icon-10.png" class="img-fluid me-3">
        <h1 class="m-0 text-primary">Zoofari</h1>
    </a>

    <div class="collapse navbar-collapse">
        <div class="navbar-nav ms-auto">
            <a href="index.jsp" class="nav-item nav-link">Home</a>
            <a href="service_display.jsp" class="nav-item nav-link">Services</a>
            <a href="animal_display.jsp" class="nav-item nav-link">Our Animals</a>
            <a href="feedback_display.jsp" class="nav-item nav-link">Feedback</a>
            <a href="login_display.jsp" class="nav-item nav-link">Login</a>
            <a href="contact_display.jsp" class="nav-item nav-link">Contact</a>
        </div>
        <a href="buy_display.jsp" class="btn btn-primary">
            Ticket Bookings <i class="fa fa-arrow-right ms-3"></i>
        </a>
    </div>
</nav> -->

<!-- TABLE -->
<div class="feedback-box">
<h2 class="text-center mb-3 mt-1">Ticket Bookings</h2>

<div class="table-responsive">
<table class="table table-bordered table-hover">
<thead>
<tr>
    <th>Booking ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Visit Date</th>
    <th>Adults</th>
    <th>Children</th>
    <th>Payment Method</th>
    <th>Card Type</th>
    <th>Payment Proof</th>
    <th>Total Amount</th>
    <th>Payment Status</th>
    <th>Booking Time</th>
    <!-- <th>QR Code</th> -->
    <th>Entry Status</th>
    <th>Action</th>
</tr>
</thead>

<tbody>
<%
Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/zoofari", "root", "");

Statement st = cn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM booking ORDER BY booking_id DESC");

while (rs.next()) {

    String proof = rs.getString("payment_proof");
    String status = rs.getString("payment_status");
    String qrCode = rs.getString("qr_code");
    String entryStatus = rs.getString("entry_status");
%>

<tr>
    <td><%=rs.getInt("booking_id")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("email")%></td>
    <td><%=rs.getString("mobile")%></td>
    <td><%=rs.getString("visit_date")%></td>
    <td><%=rs.getInt("adults")%></td>
    <td><%=rs.getInt("children")%></td>
    <td><%=rs.getString("payment_method")%></td>
    <td><%=rs.getString("card_type")%></td>

    <!-- PAYMENT PROOF -->
    <td>
        <% if (proof != null && !proof.trim().equals("")) { %>
            <img src="../uploads/<%=proof%>" class="payment-img">
        <% } else { %>
            <span class="text-muted">No Image</span>
        <% } %>
    </td>

    <!-- TOTAL -->
    <td>Rs. <%=rs.getInt("total_amount")%></td>

    <!-- PAYMENT STATUS -->
    <td>
        <% if ("PAID".equalsIgnoreCase(status)) { %>
            <span class="status-paid">PAID</span>
        <% } else { %>
            <span class="status-pending">PENDING</span>
        <% } %>
    </td>

    <!-- BOOKING TIME -->
    <td><%=rs.getString("booking_time")%></td>

    <!-- QR CODE -->
    <!-- <td>
        <% if (qrCode != null && !qrCode.trim().equals("")) { %>
            <img src="../qr_codes/<%=qrCode%>" class="payment-img">
        <% } else { %>
            <span class="text-muted">No QR</span>
        <% } %>
    </td> -->

    <!-- ENTRY STATUS -->
    <td>
        <% if ("USED".equalsIgnoreCase(entryStatus)) { %>
            <span class="badge badge-danger">USED</span>
        <% } else { %>
            <span class="badge badge-success">NOT USED</span>
        <% } %>
    </td>

    <!-- ACTION -->
    <td>
        <div class="action-buttons">
            <a href="../crud/editTickets.jsp?id=<%=rs.getInt("booking_id")%>" class="btn btn-sm btn-success">Edit</a>
            <a href="../crud/deleteTickets.jsp?id=<%=rs.getInt("booking_id")%>"
               class="btn btn-sm btn-danger"
               onclick="return confirm('Are you sure you want to delete this booking?');">
               Delete
            </a>
        </div>
    </td>
</tr>

<% } %>
</tbody>
</table>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
