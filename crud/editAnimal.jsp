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
String animal_type = "";
String animal_name = "";
String image = "";

if(!ServletFileUpload.isMultipartContent(request)){
    id = Integer.parseInt(request.getParameter("id"));

    try{
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM animals WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            animal_type = rs.getString("animal_type");
            animal_name = rs.getString("animal_name");
            image = rs.getString("image");
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
<title>Edit Animal</title>

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

<h3 class="mb-4">Edit Animal</h3>

<form action="updateAnimal.jsp" method="post" enctype="multipart/form-data">

    <input type="hidden" name="id" value="<%=id%>">
    <input type="hidden" name="oldImage" value="<%=image%>">

    <div class="mb-3">
        <label>Animal Type</label>
        <input type="text" name="animal_type" value="<%=animal_type%>" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Animal Name</label>
        <textarea name="animal_name" class="form-control" required><%= animal_name %></textarea>
    </div>

    <div class="mb-3">
        <label>Current Image</label><br>
        <img src="../<%=image%>" width="120">
    </div>

    <div class="mb-3">
        <label>Change Image</label>
        <input type="file" name="image" class="form-control">
    </div>

    <button type="submit" class="btn btn-primary w-100">
        Update Animal
    </button>

</form>

</div>
</div>

</body>
</html>