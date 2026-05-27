<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
String experience = request.getParameter("experience");
int rating = Integer.parseInt(request.getParameter("rating"));
String message = request.getParameter("message");

Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

PreparedStatement ps = cn.prepareStatement("UPDATE feedback SET experience=?, rating=?, message=? WHERE id=?");

ps.setString(1, experience);
ps.setInt(2, rating);
ps.setString(3, message);
ps.setInt(4, id);

ps.executeUpdate();
response.sendRedirect("../admin/feedback_display.jsp");
%>