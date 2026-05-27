<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/zoofari", "root", ""
    );

    PreparedStatement ps = cn.prepareStatement(
        "UPDATE register SET name=?, email=?, password=? WHERE id=?"
    );
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.setInt(4, id);

    ps.executeUpdate();

    response.sendRedirect("../admin/login_display.jsp");
%>
