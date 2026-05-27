<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>

<%
if (ServletFileUpload.isMultipartContent(request)) {

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    int id = 0;
    String animal_name = "";
    String animal_type = "";
    String newImage = null;
    String oldImage = null;

    Connection con = null;
    PreparedStatement ps = null;

    try {
        List<FileItem> items = upload.parseRequest(request);

        for (FileItem item : items) {

            if (item.isFormField()) {

                if ("id".equals(item.getFieldName())) {
                    id = Integer.parseInt(item.getString());
                }

                if ("animal_name".equals(item.getFieldName())) {
                    animal_name = item.getString("UTF-8");
                }

                if ("animal_type".equals(item.getFieldName())) {
                    animal_type = item.getString("UTF-8");
                }

                if ("oldImage".equals(item.getFieldName())) {
                    oldImage = item.getString("UTF-8");
                }

            } else if ("image".equals(item.getFieldName()) && item.getSize() > 0) {

                // 🔥 delete old image only if exists
                if (oldImage != null && !oldImage.trim().equals("")) {
                    File oldFile = new File(application.getRealPath("/") + oldImage);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // 🔥 save new image
                String fileName = System.currentTimeMillis() + "_" + item.getName();
                String uploadPath = application.getRealPath("/") + "img";

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                item.write(new File(uploadPath + "/" + fileName));
                newImage = "img/" + fileName;
            }
        }

        // ✅ MOST IMPORTANT — keep old image if no new upload
        if (newImage == null || newImage.trim().equals("")) {
            newImage = oldImage;
        }

        // 🔗 DB connection
        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/zoofari",
                "root",
                ""
        );

        // ✅ make sure column name is IMAGE (not icon)
        ps = con.prepareStatement(
                "UPDATE animals SET animal_name=?, animal_type=?, image=? WHERE id=?"
        );

        ps.setString(1, animal_name);
        ps.setString(2, animal_type);
        ps.setString(3, newImage);
        ps.setInt(4, id);

        ps.executeUpdate();

        response.sendRedirect("../admin/animal_display.jsp");
        return;

    } catch (Exception e) {
        out.println("<h3 style='color:red'>ERROR: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
}
%>