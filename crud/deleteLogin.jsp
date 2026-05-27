<%@ page import="java.sql.*" %>
<%
Connection cn = null;
PreparedStatement ps = null;

try {
    int id = Integer.parseInt(request.getParameter("id"));

    cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

    ps = cn.prepareStatement("DELETE FROM register WHERE id=?");
    ps.setInt(1, id);
    ps.executeUpdate();

    response.sendRedirect("../admin/login_display.jsp");

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (ps != null) ps.close();
    if (cn != null) cn.close();
}
%>
