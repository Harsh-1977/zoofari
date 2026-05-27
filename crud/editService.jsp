<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("admin_login.jsp");
    return;
}
%>

<%
int id = 0;
String title = "", description = "", icon = "";

/* ===== FETCH DATA ===== */
if(!ServletFileUpload.isMultipartContent(request)){
    id = Integer.parseInt(request.getParameter("id"));

    try{
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/zoofari","root",""
        );

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM services WHERE id=?"
        );
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            title = rs.getString("title");
            description = rs.getString("description");
            icon = rs.getString("icon");
        }
        con.close();
    }catch(Exception e){
        out.println(e);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Service</title>

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

img{
    border-radius: 8px;
    border: 2px solid #c8e6c9;
    padding: 5px;
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

<h3 class="mb-4">Edit Service</h3>

<form action="updateService.jsp" method="post" enctype="multipart/form-data">

    <input type="hidden" name="id" value="<%=id%>">
    <input type="hidden" name="oldIcon" value="<%=icon%>">

    <div class="mb-3">
        <label>Title</label>
        <input type="text" name="title" value="<%=title%>" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Description</label>
        <textarea name="description" class="form-control" required><%= description %></textarea>
    </div>

    <div class="mb-3">
        <label>Current Icon</label><br>
        <img src="../<%=icon%>" width="120">
    </div>

    <div class="mb-3">
        <label>Change Icon</label>
        <input type="file" name="icon" class="form-control">
    </div>

    <button type="submit" class="btn btn-primary w-100">
        Update Service
    </button>

</form>

</div>
</div>

</body>
</html>