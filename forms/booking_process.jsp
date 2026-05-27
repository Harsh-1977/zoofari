<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<!-- QR LIBRARIES -->
<%@ page import="com.google.zxing.*" %>
<%@ page import="com.google.zxing.client.j2se.MatrixToImageWriter" %>
<%@ page import="com.google.zxing.common.BitMatrix" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter" %>

<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<%
/* ================= LOGIN CHECK ================= */

if (session.getAttribute("user") == null) {
    response.sendRedirect("../login.jsp?msg=login_required");
    return;
}

/* ================= DECLARE VARIABLES ================= */

String name = null;
String email = null;
String mobile = null;
String visit_date = null;
String payment_method = null;
String card_type = null;
String payment_proof = null;

int adults = 0;
int children = 0;
int totalAmount = 0;

/* ================= FILE UPLOAD ================= */

DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List<FileItem> items = upload.parseRequest(request);

for (FileItem item : items) {

    if (item.isFormField()) {

        String field = item.getFieldName();
        String value = item.getString();

        if ("name".equals(field)) name = value;
        else if ("email".equals(field)) email = value;
        else if ("mobile".equals(field)) mobile = value;
        else if ("visit_date".equals(field)) visit_date = value;
        else if ("payment_method".equals(field)) payment_method = value;
        else if ("card_type".equals(field)) card_type = value;
        else if ("adults".equals(field)) adults = Integer.parseInt(value);
        else if ("children".equals(field)) children = Integer.parseInt(value);

    } else {

        if ("payment_proof".equals(item.getFieldName()) && item.getSize() > 0) {

            payment_proof = new File(item.getName()).getName();

            String path = application.getRealPath("/") + "uploads";
            new File(path).mkdirs();

            item.write(new File(path + File.separator + payment_proof));
        }
    }
}

/* ================= CALCULATION ================= */

totalAmount = (adults * 200) + (children * 120);

String paymentStatus = "PENDING";
if ("CARD".equals(payment_method) || "UPI".equals(payment_method)) {
    paymentStatus = "PAID";
}

/* ================= DATABASE ================= */

int bookingId = 0;

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/zoofari",
            "root",
            ""
    );

    /* ================= INSERT BOOKING ================= */

    ps = con.prepareStatement(
        "INSERT INTO booking " +
        "(name, email, mobile, visit_date, adults, children, " +
        "payment_method, card_type, payment_proof, total_amount, payment_status, " +
        "entry_status, qr_code) " +
        "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)",
        Statement.RETURN_GENERATED_KEYS
    );

    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, mobile);
    ps.setString(4, visit_date);
    ps.setInt(5, adults);
    ps.setInt(6, children);
    ps.setString(7, payment_method);

    if ("CARD".equals(payment_method) && card_type != null && !card_type.isEmpty())
        ps.setString(8, card_type);
    else
        ps.setNull(8, java.sql.Types.VARCHAR);

    if (payment_proof != null)
        ps.setString(9, payment_proof);
    else
        ps.setNull(9, java.sql.Types.VARCHAR);

    ps.setInt(10, totalAmount);
    ps.setString(11, paymentStatus);
    ps.setString(12, "NOT_USED");
    ps.setNull(13, java.sql.Types.VARCHAR);

    ps.executeUpdate();

    rs = ps.getGeneratedKeys();
    if (rs.next()) {
        bookingId = rs.getInt(1);
    }

    /* ================= QR CODE GENERATION ================= */

    String qrFileName = "ZOO" + bookingId + ".png";

    String qrText =
            "Booking ID: ZOO" + bookingId +
            "\nName: " + name +
            "\nVisit Date: " + visit_date +
            "\nAdults: " + adults +
            "\nChildren: " + children +
            "\nAmount: Rs." + totalAmount;

    String qrFolder = application.getRealPath("/") + "qr_codes";
    new File(qrFolder).mkdirs();

    String qrPath = qrFolder + File.separator + qrFileName;

    QRCodeWriter writer = new QRCodeWriter();
    BitMatrix matrix = writer.encode(qrText, BarcodeFormat.QR_CODE, 250, 250);
    MatrixToImageWriter.writeToPath(matrix, "PNG", new File(qrPath).toPath());

    /* ================= SAVE QR NAME IN DB ================= */

    PreparedStatement ps2 = con.prepareStatement(
        "UPDATE booking SET qr_code=? WHERE booking_id=?"
    );
    ps2.setString(1, qrFileName);
    ps2.setInt(2, bookingId);
    ps2.executeUpdate();
    ps2.close();

    /* ================= PREMIUM EMAIL ================= */

    String subject = "🎟️ Zoofari Ticket Confirmation - ZOO" + bookingId;

    String message =
    "<html><body style='font-family:Arial;background:#f4f6f9;padding:20px'>" +
    "<div style='max-width:650px;margin:auto;background:#fff;border-radius:10px;padding:25px'>" +
    "<h2 style='color:#28a745'>🦁 Zoofari Booking Confirmed</h2>" +
    "<p>Dear <b>" + name + "</b>,</p>" +
    "<p>Your booking is confirmed. Details below:</p>" +
    "<table style='width:100%;border-collapse:collapse'>" +
    "<tr><td><b>Booking ID</b></td><td>ZOO" + bookingId + "</td></tr>" +
    "<tr><td><b>Visit Date</b></td><td>" + visit_date + "</td></tr>" +
    "<tr><td><b>Adults</b></td><td>" + adults + "</td></tr>" +
    "<tr><td><b>Children</b></td><td>" + children + "</td></tr>" +
    "<tr><td><b>Total Amount</b></td><td style='color:#28a745'><b>Rs. " + totalAmount + "</b></td></tr>" +
    "</table>" +
    "<p style='margin-top:20px'>📎 QR ticket attached. Show at entry gate.</p>" +
    "<p>Enjoy your visit! 🐾</p>" +
    "<p><b>Zoofari Team</b></p>" +
    "</div></body></html>";

    /* ================= SEND EMAIL ================= */

    final String fromEmail = "parmarharsh1809@gmail.com";
    final String password = "vevgeatbkqawxxfs";

    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");

    Session mailSession = Session.getInstance(
        props,
        new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

    MimeMessage msg = new MimeMessage(mailSession);
    msg.setFrom(new InternetAddress(fromEmail));
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
    msg.setSubject(subject);

    Multipart multipart = new MimeMultipart();

    MimeBodyPart textPart = new MimeBodyPart();
    textPart.setContent(message, "text/html; charset=UTF-8");
    multipart.addBodyPart(textPart);

    MimeBodyPart qrPart = new MimeBodyPart();
    qrPart.attachFile(qrPath);
    qrPart.setFileName("ZoofariTicketQR.png");
    multipart.addBodyPart(qrPart);

    msg.setContent(multipart);

    Transport.send(msg);
%>

<script>
alert(
"✓ BOOKING SUCCESSFUL!\n\n" +
"Booking ID: ZOO<%= bookingId %>\n" +
"Total Amount: Rs. <%= totalAmount %>\n\n" +
"QR sent to email."
);
window.location.href="../index.jsp";
</script>

<%
} catch (Exception e) {
    out.println("Error: " + e);
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>