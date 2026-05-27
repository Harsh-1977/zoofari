<%@page import="java.sql.*" %>
<html>
    <body>jaqcxxowrxpzkxvj
        <%
        String name= request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari", "root", "");
            String que="INSERT INTO contact (name, email, subject, message) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(que);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, subject);
            stmt.setString(4, message);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<script>alert('Message Sent Successfully!');window.location.href='../contact.jsp';</script>");
            } else {
                out.println("<script>alert('Message Sending Failed!');</script>");
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>
    </body>
</html>