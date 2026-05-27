<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
/* ================= GET QR VALUE ================= */

String rawId = request.getParameter("booking_id");

String msg = "";
String color = "black";
String visitorName = "";
int adults = 0;
int children = 0;
String visitDateStr = "";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    if (rawId == null || rawId.trim().isEmpty()) {
        throw new Exception("Invalid QR Data");
    }


    String numericId = rawId.replaceAll("[^0-9]", "");

    if (numericId.isEmpty()) {
        throw new Exception("Invalid Ticket Format");
    }

    int bookingId = Integer.parseInt(numericId);

    /* ================= DATABASE ================= */

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

    ps = con.prepareStatement("SELECT name, adults, children, visit_date, entry_status, payment_status FROM booking WHERE booking_id=?");

    ps.setInt(1, bookingId);
    rs = ps.executeQuery();

    if (rs.next()) {

        visitorName = rs.getString("name");
        visitorName = rs.getString("name");
adults = rs.getInt("adults");
children = rs.getInt("children");

java.sql.Date vdate = rs.getDate("visit_date");
if(vdate != null){
    visitDateStr = vdate.toString();
}
        String entryStatus = rs.getString("entry_status");
String paymentStatus = rs.getString("payment_status");

    if (paymentStatus == null || !"PAID".equalsIgnoreCase(paymentStatus)) {

    msg = "🟠 Payment Pending — Send to Counter";
    color = "#ff9800";

}
else if (entryStatus != null && "NOT_USED".equalsIgnoreCase(entryStatus.trim())) {

    PreparedStatement ps2 = con.prepareStatement("UPDATE booking SET entry_status='USED' WHERE booking_id=?");

    ps2.setInt(1, bookingId);
    ps2.executeUpdate();
    ps2.close();

    msg = "🟢 ENTRY ALLOWED ✔";
    color = "#28a745";

}
else {

    msg = "🔴 Ticket Already Used";
    color = "#dc3545";
}

    } else {

        msg = "❌ Invalid Ticket";
        color = "#dc3545";
    }

} catch (Exception e) {

    msg = "❌ " + e.getMessage();
    color = "#dc3545";

} finally {

    try { if (rs != null) rs.close(); } catch(Exception e){}
    try { if (ps != null) ps.close(); } catch(Exception e){}
    try { if (con != null) con.close(); } catch(Exception e){}
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Zoofari Entry Verification</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background:#f4f6f9;
    text-align:center;
    padding-top:80px;
}
.card{
    background:#fff;
    width:420px;
    margin:auto;
    padding:35px;
    border-radius:14px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
}
.status{
    font-size:28px;
    font-weight:bold;
    margin-bottom:10px;
}
.name{
    color:#666;
    margin-bottom:25px;
}
.btn{
    display:inline-block;
    padding:12px 28px;
    background:#007bff;
    color:#fff;
    text-decoration:none;
    border-radius:8px;
}
.btn:hover{
    background:#0056b3;
}
</style>

</head>

<body>

<div class="card">

    <div class="status" style="color:black;">
        <%=msg%>
    </div>

    <% if(visitorName != null && !visitorName.isEmpty()){ %>
        <div class="name">
            Visitor: <b><%=visitorName%></b>
        </div>
        <% if(msg.contains("ALLOWED")){ %>

<div style="text-align:left; margin-top:10px; font-size:15px; color:#444; background:#f8f9fa; padding:12px; border-radius:8px;">
    <b>Ticket Details</b><br><br>

    👨 Adults: <b><%=adults%></b><br>
    👶 Children: <b><%=children%></b><br>

    <% if(visitDateStr != null && !visitDateStr.isEmpty()){ %>
        🕒 Visit Date: <b><%=visitDateStr%></b><br>
    <% } %>
</div>

<% } %>
    <% } %>

    <a href="scan_qr.jsp" class="btn">Scan Next</a>

</div>

</body>
</html>