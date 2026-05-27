<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));

Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

PreparedStatement ps =cn.prepareStatement("DELETE FROM feedback WHERE id=?");
ps.setInt(1, id);
ps.executeUpdate();

response.sendRedirect("../admin/feedback_display.jsp");
%>