<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari", "root", "");

    PreparedStatement ps = cn.prepareStatement("SELECT * FROM contact WHERE id=?");
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Contact</title>

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
    width: 450px;
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

<h3 class="mb-4">Edit Contact</h3>

<form action="updateContact.jsp" method="post">

    <input type="hidden" name="id" value="<%=id%>">

    <div class="mb-3">
        <label>Name</label>
        <input type="text" name="name"
               value="<%= rs.getString("name") %>"
               class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Email</label>
        <input type="email" name="email"
               value="<%= rs.getString("email") %>"
               class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Subject</label>
        <input type="text" name="subject"
               value="<%= rs.getString("subject") %>"
               class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Message</label>
        <textarea name="message" class="form-control" required><%= rs.getString("message") %></textarea>
    </div>

    <button type="submit" class="btn btn-primary w-100">
        Update Contact
    </button>

</form>

</div>
</div>

</body>
</html>