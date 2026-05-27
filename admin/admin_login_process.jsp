<%@ page session="true" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("admin".equals(username) && "harsh_123".equals(password)) 
    {
        session.setAttribute("admin", "true");
        response.sendRedirect("index.jsp");
    } 
    else 
    {
        out.println("<h3 style='color:red; text-align:center;'>Invalid username or password</h3>");
    }
%>