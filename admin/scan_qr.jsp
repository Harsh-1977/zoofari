<%@ page contentType="text/html;charset=UTF-8" %>
<%
if(session.getAttribute("admin")==null){
response.sendRedirect("admin_login.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Zoofari QR Scanner</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <link href="img/favicon.ico" rel="icon" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Quicksand:wght@600;700&display=swap"
      rel="stylesheet" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <link href="css/style.css" rel="stylesheet" />

<script src="https://unpkg.com/html5-qrcode"></script>

<style>
body{
    font-family:Arial;
    text-align:center;
    background:#f4f6f9;
}
h2{
    margin-top:30px;
}
#reader{
    width:320px;
    margin:30px auto;
}
</style>
</head>

<body>
<jsp:include page="navbar.jsp"/>
<h2>🦁 Zoofari Ticket Scanner</h2>
<div id="reader"></div>

<script>

let scanner = new Html5QrcodeScanner(
    "reader",
    {
        fps: 10,
        qrbox: 260
    },
    false
);

function onScanSuccess(text){

    // ✅ CLEAN TEXT
    text = text.trim().toUpperCase();

    // ✅ MATCH ZOO FORMAT
    let match = text.match(/ZOO(\d+)/i);

    if(match){

        scanner.clear();

        window.location = "verify_entry.jsp?booking_id=" + match[0];

    } else {

        console.log("Invalid QR:", text);
    }
}

scanner.render(onScanSuccess);

</script>

</body>
</html>