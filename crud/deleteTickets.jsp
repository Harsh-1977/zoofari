<%@ page import="java.sql.*,java.io.*" %>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("admin_login.jsp");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));
String icon = "";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

    ps = con.prepareStatement("SELECT payment_proof FROM booking WHERE booking_id=?");
    ps.setInt(1, id);
    rs = ps.executeQuery();

    if(rs.next()){
        icon = rs.getString("payment_proof");
    }

    /* ===== 2. DELETE IMAGE FILE ===== */
    if(icon != null && !icon.equals("")){
        File imgFile = new File(application.getRealPath("/") + "uploads/");
        if(imgFile.exists()){
            imgFile.delete();
        }
    }

    /* ===== 3. DELETE RECORD ===== */
    ps = con.prepareStatement("DELETE FROM booking WHERE booking_id=?");
    ps.setInt(1, id);
    ps.executeUpdate();

    response.sendRedirect("../admin/buy_display.jsp");
    return;

}catch(Exception e){
    out.println("ERROR: " + e);
}
finally{
    if(rs != null) rs.close();
    if(ps != null) ps.close();
    if(con != null) con.close();
}
%>