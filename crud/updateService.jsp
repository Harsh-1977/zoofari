<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>

<%
if(ServletFileUpload.isMultipartContent(request)){

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    int id = 0;
    String title = "", description = "";
    String newIcon = "", oldIcon = "";

    Connection con = null;
    PreparedStatement ps = null;

    try{
        List<FileItem> items = upload.parseRequest(request);

        for(FileItem item : items){

            if(item.isFormField()){
                if("id".equals(item.getFieldName()))
                    id = Integer.parseInt(item.getString());

                if("title".equals(item.getFieldName()))
                    title = item.getString("UTF-8");

                if("description".equals(item.getFieldName()))
                    description = item.getString("UTF-8");

                if("oldIcon".equals(item.getFieldName()))
                    oldIcon = item.getString("UTF-8");
            }
            else if("icon".equals(item.getFieldName()) && item.getSize() > 0){

                // delete old image
                File oldFile = new File(application.getRealPath("/") + oldIcon);
                if(oldFile.exists()) oldFile.delete();

                // save new image
                String fileName = System.currentTimeMillis() + "_" + item.getName();
                String uploadPath = application.getRealPath("/") + "img";

                new File(uploadPath).mkdirs();
                item.write(new File(uploadPath + "/" + fileName));

                newIcon = "img/" + fileName;
            }
        }

        if(newIcon.equals("")) newIcon = oldIcon;

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/zoofari","root",""
        );

        ps = con.prepareStatement(
            "UPDATE services SET title=?, description=?, icon=? WHERE id=?"
        );
        ps.setString(1, title);
        ps.setString(2, description);
        ps.setString(3, newIcon);
        ps.setInt(4, id);

        ps.executeUpdate();

        response.sendRedirect("../admin/service_display.jsp");
        return;

    }catch(Exception e){
        out.println("ERROR: " + e);
    }
    finally{
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
}
%>
