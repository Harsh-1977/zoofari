<%@ page import="java.sql.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");

    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari", "root", "");

    PreparedStatement ps = cn.prepareStatement("UPDATE contact SET name=?, email=?, subject=?, message=? WHERE id=?");

    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, subject);
    ps.setString(4, message);
    ps.setInt(5, id);

    ps.executeUpdate();

    response.sendRedirect("../admin/contact_display.jsp");
%>
