<%@ page import="java.sql.*" %>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("admin_login.jsp");
    return;
}

int booking_id = Integer.parseInt(request.getParameter("id"));

String name="", email="", mobile="";
String visit_date="";
int adults=0, children=0;
String payment_method="", card_type="", payment_proof="";
int total_amount=0;
String payment_status="";

try{

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/zoofari","root",""
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM booking WHERE booking_id=?"
    );

    ps.setInt(1, booking_id);
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("name");
        email = rs.getString("email");
        mobile = rs.getString("mobile");
        visit_date = rs.getString("visit_date");
        adults = rs.getInt("adults");
        children = rs.getInt("children");
        payment_method = rs.getString("payment_method");
        card_type = rs.getString("card_type");
        payment_proof = rs.getString("payment_proof");
        total_amount = rs.getInt("total_amount");
        payment_status = rs.getString("payment_status");
    }

    con.close();

}catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Ticket</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg, #e8f5e9, #c8e6c9);
    font-family: 'Segoe UI', sans-serif;
}

.container{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.admin-card{
    background: #ffffff;
    padding: 30px;
    border-radius: 12px;
    width: 500px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}

h3{
    color: #2e7d32;
    text-align: center;
    font-weight: 600;
}

label{
    font-weight: 500;
    color: #2e7d32;
}

.form-control{
    border-radius: 8px;
    border: 1px solid #c8e6c9;
}

.form-control:focus{
    border-color: #66bb6a;
    box-shadow: 0 0 5px rgba(102,187,106,0.5);
}

.btn-primary{
    background-color: #2e7d32;
    border: none;
    border-radius: 8px;
    font-weight: 500;
    transition: 0.3s;
}

.btn-primary:hover{
    background-color: #1b5e20;
}
</style>

</head>

<body>

<div class="container">
<div class="admin-card">

<h3 class="mb-4">Edit Ticket</h3>

<form action="updateTickets.jsp" method="post">

<input type="hidden" name="booking_id" value="<%=booking_id%>">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" class="form-control" value="<%=name%>" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" value="<%=email%>" required>
</div>

<div class="mb-3">
<label>Mobile</label>
<input type="text" name="mobile" class="form-control" value="<%=mobile%>" required>
</div>

<div class="mb-3">
<label>Visit Date</label>
<input type="date" name="visit_date" class="form-control" value="<%=visit_date%>" required>
</div>

<div class="mb-3">
<label>Adults</label>
<input type="number" name="adults" class="form-control" value="<%=adults%>" required>
</div>

<div class="mb-3">
<label>Children</label>
<input type="number" name="children" class="form-control" value="<%=children%>" required>
</div>

<div class="mb-3">
<label>Payment Method</label>
<select name="payment_method" class="form-control">
<option value="CARD" <%= payment_method.equals("CARD")?"selected":"" %>>CARD</option>
<option value="CASH" <%= payment_method.equals("CASH")?"selected":"" %>>CASH</option>
<option value="UPI" <%= payment_method.equals("UPI")?"selected":"" %>>UPI</option>
</select>
</div>

<div class="mb-3">
<label>Card Type</label>
<select name="card_type" class="form-control">
    <option value="">Not Required</option>

    <option value="Debit Card" 
    <%= "Debit Card".equals(card_type) ? "selected" : "" %>>
    Debit Card
    </option>

    <option value="Credit Card"
    <%= "Credit Card".equals(card_type) ? "selected" : "" %>>
    Credit Card
    </option>
</select>
</div>

<div class="mb-3">
<label>Total Amount</label>
<input type="number" name="total_amount" class="form-control" value="<%=total_amount%>" required>
</div>

<div class="mb-3">
<label>Payment Status</label>
<select name="payment_status" class="form-control">
<option value="PENDING" <%= payment_status.equals("PENDING")?"selected":"" %>>PENDING</option>
<option value="PAID" <%= payment_status.equals("PAID")?"selected":"" %>>PAID</option>
</select>
</div>

<button type="submit" class="btn btn-primary w-100">
Update Ticket
</button>

</form>

</div>
</div>

</body>
</html>