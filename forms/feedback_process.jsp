<%@ page import="java.sql.*" %>

<%
    String experience = request.getParameter("experience");
    String rating = request.getParameter("rating");
    String message = request.getParameter("message");

    int ratingValue = 0;
    if (rating != null) {
        ratingValue = Integer.parseInt(rating);
    }

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

        String sql = "INSERT INTO feedback (experience, rating, message) VALUES (?, ?, ?)";
        ps = con.prepareStatement(sql);

        ps.setString(1, experience);
        ps.setString(2, rating);
        ps.setString(3, message);

        int i = ps.executeUpdate();

        if (i > 0) {
            out.println("<script>alert('Thank you for your feedback!'); window.location.href = '../feedback.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to submit feedback. Please try again.'); window.location.href = '../feedback.jsp';</script>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
