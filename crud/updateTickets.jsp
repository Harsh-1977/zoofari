<%@ page import="java.sql.*" %>

<%
int booking_id = Integer.parseInt(request.getParameter("booking_id"));

String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String visit_date = request.getParameter("visit_date");
int adults = Integer.parseInt(request.getParameter("adults"));
int children = Integer.parseInt(request.getParameter("children"));
String payment_method = request.getParameter("payment_method");
String card_type = request.getParameter("card_type");
if(!"CARD".equals(payment_method)){
    card_type = null;
}
int total_amount = Integer.parseInt(request.getParameter("total_amount"));
String payment_status = request.getParameter("payment_status");

try{

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

PreparedStatement ps = con.prepareStatement(
"UPDATE booking SET name=?,email=?,mobile=?,visit_date=?,adults=?,children=?,payment_method=?,card_type=?,total_amount=?,payment_status=? WHERE booking_id=?"
);

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,mobile);
ps.setString(4,visit_date);
ps.setInt(5,adults);
ps.setInt(6,children);
ps.setString(7,payment_method);
ps.setString(8,card_type);
ps.setInt(9,total_amount);
ps.setString(10,payment_status);
ps.setInt(11,booking_id);

ps.executeUpdate();

response.sendRedirect("../admin/buy_display.jsp");

}catch(Exception e){
out.println(e);
}
%>