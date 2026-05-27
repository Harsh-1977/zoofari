<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<%
/* ================= INSERT WITH FILE UPLOAD ================= */

if(session.getAttribute("admin") == null){
    response.sendRedirect("admin_login.jsp");
    return;
}

if(ServletFileUpload.isMultipartContent(request)){

    String animal_name = "";
    String animal_type = "";
    String imgPath = "";

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    try{   
        List<FileItem> items = upload.parseRequest(request);

        for(FileItem item : items){

            if(item.isFormField()){
                if(item.getFieldName().equals("animal_name"))
                    animal_name = item.getString("UTF-8");

                if(item.getFieldName().equals("animal_type"))
                    animal_type = item.getString("UTF-8");

            }else{
                if(item.getSize() > 0){
                    String fileName = System.currentTimeMillis()+"_"+item.getName();
                    String uploadPath = application.getRealPath("/")+"img/animals_uploades";
                    File dir = new File(uploadPath);
                    if(!dir.exists())
                    {
                        dir.mkdirs();
                    }

                    item.write(new File(uploadPath + "/" + fileName));
                    imgPath = "img/animals_uploades/" + fileName;
                }
            }
        }

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zoofari","root","");

        PreparedStatement ps = con.prepareStatement("INSERT INTO animals(animal_name,animal_type,image) VALUES(?,?,?)");
        ps.setString(1,animal_name);
        ps.setString(2,animal_type);
        ps.setString(3,imgPath);
        ps.executeUpdate();

        con.close();
        response.sendRedirect("animal_display.jsp");

    }catch(Exception e){
        out.println(e);
    }
}
%>