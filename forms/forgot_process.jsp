<%@ page import="java.sql.*" %>
<%
String msg = "";
String email = request.getParameter("email");

if (email != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

        PreparedStatement ps = con.prepareStatement("SELECT id FROM register WHERE email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            response.sendRedirect("send_otp.jsp?email=" + email);
            return;
        } else {
            out.println("<script>alert('Email not registered!'); window.location='../forgot.jsp';</script>");
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        msg = "Server error!";
    }
}
%>