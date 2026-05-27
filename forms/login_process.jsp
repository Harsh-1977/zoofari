<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

        String que = "SELECT * FROM register WHERE email=? AND password=?";
        stmt = con.prepareStatement(que);

        stmt.setString(1, email);
        stmt.setString(2, password);

        rs = stmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("user", email);

            out.println("<script>" +"alert('Login Successful!');" +"window.location.href='../index.jsp';" +"</script>");

        } else {
            out.println("<script>alert('Invalid email or password. Please try again.');window.location.href='../login.jsp?error=1';" +"</script>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>
