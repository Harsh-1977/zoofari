<%@ page contentType="text/html;charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="utf-8" />
    <title>Zoofari</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Quicksand:wght@600;700&display=swap"
      rel="stylesheet" />

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet" />
  </head>

  <body>
    <jsp:include page="forms/navbar.jsp" />
    <!-- Navbar Start -->
    <!-- <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-4 px-lg-5 wow fadeIn"
      data-wow-delay="0.1s">
      <a href="index.jsp" class="navbar-brand p-0">
        <img class="img-fluid me-3" src="img/icon/icon-10.png" alt="Icon" />
        <h1 class="m-0 text-primary">Zoofari</h1>
      </a>
      <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse py-4 py-lg-0" id="navbarCollapse">
        <div class="navbar-nav ms-auto">
          <a href="index.jsp" class="nav-item nav-link active">Home</a>
          <a href="about.jsp" class="nav-item nav-link">About</a>
          <a href="service.jsp" class="nav-item nav-link">Services</a>
          <a href="animal.jsp" class="nav-item nav-link">Our Animals</a>
          <a href="feedback.jsp" class="nav-item nav-link">Feedback</a>
          <a href="login.jsp" class="nav-item nav-link">Login</a>
          <a href="contact.jsp" class="nav-item nav-link">Contact</a>
        </div>
        <a href="buy.jsp" class="btn btn-primary">Buy Ticket<i class="fa fa-arrow-right ms-3"></i></a>
      </div>
    </nav> -->
    <!-- Navbar End -->

    <!-- Header Start -->
    <div class="container-fluid bg-dark p-0 mb-5">
      <div class="row g-0 flex-column-reverse flex-lg-row">
        <div class="col-lg-6 p-0 wow fadeIn" data-wow-delay="0.1s">
          <div class="header-bg h-100 d-flex flex-column justify-content-center p-5">
            <h1 class="display-4 text-light mb-5">
              Enjoy Wonderful Day With Your Family
            </h1>
          </div>
        </div>
        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
          <div class="owl-carousel header-carousel">
            <div class="owl-carousel-item">
              <img class="img-fluid" src="img/carousel-1.jpg" alt="" />
            </div>
            <div class="owl-carousel-item">
              <img class="img-fluid" src="img/carousel-2.jpg" alt="" />
            </div>
            <div class="owl-carousel-item">
              <img class="img-fluid" src="img/carousel-3.jpg" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Header End -->

    <!-- About Start -->
    <div class="container-xxl py-5">
      <div class="container">
        <div class="row g-5">
          <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
            <p><span class="text-primary me-2">#</span>Welcome To Zoofari</p>
            <h1 class="display-5 mb-4">
              Why You Should Visit
              <span class="text-primary">Zoofari</span> Park!
            </h1>
            <p class="mb-4">
              Discover the wonders of wildlife at Zoofari Park! Experience an unforgettable journey through diverse
              animal habitats, from majestic lions to exotic birds. Our park offers a perfect blend of education and
              entertainment for the whole family. Enjoy guided tours through natural environments, interact with
              friendly animals, and create memories that will last a lifetime.
            </p>
            <h5 class="mb-3">
              <i class="far fa-check-circle text-primary me-3"></i>Free Car
              Parking
            </h5>
            <h5 class="mb-3">
              <i class="far fa-check-circle text-primary me-3"></i>Natural
              Environment
            </h5>
            <h5 class="mb-3">
              <i class="far fa-check-circle text-primary me-3"></i>Professional
              Guide & Security
            </h5>
            <h5 class="mb-3">
              <i class="far fa-check-circle text-primary me-3"></i>World Best
              Animals
            </h5>
            <a class="btn btn-primary py-3 px-5 mt-3" href="about.jsp">Read More</a>
          </div>
          <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
            <div class="img-border">
              <img class="img-fluid" src="img/about.jpg" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- About End -->

    <!-- Facts Start -->
    <div class="container-xxl bg-primary facts my-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
      <div class="container py-5">
        <div class="row g-4">
          <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.1s">
            <i class="fa fa-paw fa-3x text-primary mb-3"></i>
            <h1 class="text-white mb-2" data-toggle="counter-up">500</h1>
            <p class="text-white mb-0">Total Animal</p>
          </div>
          <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.3s">
            <i class="fa fa-users fa-3x text-primary mb-3"></i>
            <h1 class="text-white mb-2" data-toggle="counter-up">1000</h1>
            <p class="text-white mb-0">Daily Vigitors</p>
          </div>
          <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.5s">
            <i class="fa fa-certificate fa-3x text-primary mb-3"></i>
            <h1 class="text-white mb-2" data-toggle="counter-up">800</h1>
            <p class="text-white mb-0">Total Membership</p>
          </div>
          <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.7s">
            <i class="fa fa-shield-alt fa-3x text-primary mb-3"></i>
            <h1 class="text-white mb-2" data-toggle="counter-up">1500</h1>
            <p class="text-white mb-0">Save Wild Life</p>
          </div>
        </div>
      </div>
    </div>
    <!-- Facts End -->

    <!-- Visiting Hours Start -->
    <div class="container-xxl bg-primary visiting-hours my-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
      <div class="container py-5">
        <div class="row g-5">
          <div class="col-md-6 wow fadeIn" data-wow-delay="0.3s">
            <h1 class="display-6 text-white mb-5">Visiting Hours</h1>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">
                <span>Monday</span>
                <span>9:00AM - 6:00PM</span>
              </li>
              <li class="list-group-item">
                <span>Tuesday</span>
                <span>9:00AM - 6:00PM</span>
              </li>
              <li class="list-group-item">
                <span>Wednesday</span>
                <span>9:00AM - 6:00PM</span>
              </li>
              <li class="list-group-item">
                <span>Thursday</span>
                <span>9:00AM - 6:00PM</span>
              </li>
              <li class="list-group-item">
                <span>Friday</span>
                <span>9:00AM - 6:00PM</span>
              </li>
              <li class="list-group-item">
                <span>Saturday</span>
                <span>9:00AM - 6:00PM</span>
              </li>
              <li class="list-group-item">
                <span>Sunday</span>
                <span>8:00AM - 7:00PM</span>
              </li>
            </ul>
          </div>
          <div class="col-md-6 text-light wow fadeIn" data-wow-delay="0.5s">
            <h1 class="display-6 text-white mb-5">Contact Info</h1>
            <table class="table">
              <tbody>
                <tr>
                  <td>Office</td>
                  <td>Zoofari, Sasan Gir, Gujarat</td>
                </tr>
                <tr>
                  <td>Zoo</td>
                  <td>Zoofari, Sasan Gir, Gujarat</td>
                </tr>
                <tr>
                  <td>Ticket</td>
                  <td>
                    <p class="mb-2">+91 99099 88066</p>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- Visiting Hours End -->

    <!-- Testimonial Start -->
    <div class="container-xxl py-5">
      <div class="container">
        <h1 class="display-5 text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">
          Our Clients Say!
        </h1>
        <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
          <div class="testimonial-item text-center">
            <img class="img-fluid rounded-circle border border-2 p-2 mx-auto mb-4" src="img/testimonial-1.jpg"
              style="width: 100px; height: 100px" />
            <div class="testimonial-text rounded text-center p-4">
              <p>
                Zoofari is an amazing wildlife experience! The park offers incredible views of diverse animals in their
                natural habitats. The staff are knowledgeable and helpful, making it educational and fun for the whole
                family. We had an unforgettable day exploring the beautiful grounds and learning about wildlife
                conservation. Highly recommended!
              </p>
              <h5 class="mb-1">Priyanka Joshi</h5>
              <span class="fst-italic">Wildlife Enthusiast</span>
            </div>
          </div>
          <div class="testimonial-item text-center">
            <img class="img-fluid rounded-circle border border-2 p-2 mx-auto mb-4" src="img/testimonial-2.jpg"
              style="width: 100px; height: 100px" />
            <div class="testimonial-text rounded text-center p-4">
              <p>
                Visiting Zoofari was an unforgettable experience! The diverse range of animals and well-maintained
                habitats showcase the park's commitment to wildlife conservation. The guided tours were informative and
                engaging, perfect for both adults and children. The beautiful landscapes and friendly staff made our
                visit truly special. We can't wait to return and explore more!
              </p>
              <h5 class="mb-1">Akash Gupta</h5>
              <span class="fst-italic">Nature Lover</span>
            </div>
          </div>
          <div class="testimonial-item text-center">
            <img class="img-fluid rounded-circle border border-2 p-2 mx-auto mb-4" src="img/testimonial-3.jpg"
              style="width: 100px; height: 100px" />
            <div class="testimonial-text rounded text-center p-4">
              <p>
                Zoofari exceeded all our expectations! The park beautifully showcases exotic animals from around the
                world in spacious, well-designed enclosures. Our children loved the interactive experiences and
                educational programs. The staff's passion for wildlife conservation was evident and inspiring. It's a
                must-visit destination for animal lovers of all ages!
              </p>
              <h5 class="mb-1">Priyank Jadav</h5>
              <span class="fst-italic">Wildlife Enthusiast</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Testimonial End -->

    <!-- Footer Start -->
    <div class="container-fluid footer bg-dark text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
      <div class="container py-5">
        <div class="row g-5">
          <div class="col-lg-3 col-md-6">
            <h5 class="text-light mb-4">Address</h5>
            <p class="mb-2">
              <i class="fa fa-map-marker-alt me-3"></i>Zoofari, Sasan Gir, Gujarat
            </p>
            <p class="mb-2">
              <i class="fa fa-phone-alt me-3"></i>+91 99099 88066
            </p>
            <p class="mb-2">
              <i class="fa fa-envelope me-3"></i>info@zoofari.com
            </p>
            <div class="d-flex pt-2">
              <a class="btn btn-outline-light btn-social"
                href="https://www.instagram.com/__harshparmar_?igsh=OTR1cXVoNnVmZ253"><i
                  class="fab fa-instagram"></i></a>
              <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
              <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
              <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <h5 class="text-light mb-4">Thank You</h5>
            <p class="thank-text">
              Thank you for visiting Zoofari! We appreciate your interest
              in our zoo and safari park. We hope to see you soon!
            </p>
          </div>

          <div class="col-lg-3 col-md-6">
            <h5 class="text-light mb-4">Quick Links</h5>
            <a class="btn btn-link" href="about.jsp">About Us</a>
            <a class="btn btn-link" href="contact.jsp">Contact Us</a>
            <a class="btn btn-link" href="service.jsp">Our Services</a>
            <a class="btn btn-link">Terms & Condition</a>
            <a class="btn btn-link">Support</a>
          </div>

        </div>
      </div>
      <div class="container">
        <div class="copyright">
          <div class="row">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
              &copy; <a class="border-bottom" href="#">Zoofari</a>, All
              Right Reserved. 
              <br/> Developed By: HARSH PARMAR & HARSH BHATT
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <script src="js/main.js"></script>
    <!-- <button id="chatbot-btn">💬</button>

<div id="chatbox" style="display:none; position:fixed; bottom:90px; right:20px; width:300px; background:#fff; border-radius:10px; box-shadow:0 0 10px rgba(0,0,0,0.3);">
  <div style="background:#28a745;color:#fff;padding:10px;">ZooSafari Assistant</div>
  <div id="chat-messages" style="height:220px; overflow-y:auto; padding:10px;"></div>
  <div style="display:flex;">
    <input type="text" id="chat-input" style="flex:1; padding:8px;">
    <button onclick="sendMessage()">Send</button>
  </div>
</div>

<script>
document.getElementById("chatbot-btn").onclick = function () {
  let box = document.getElementById("chatbox");
  box.style.display = box.style.display === "none" ? "block" : "none";
};

function addMessage(text, sender) {
  let div = document.createElement("div");
  div.innerHTML = "<b>" + sender + ":</b> " + text;
  document.getElementById("chat-messages").appendChild(div);
}

function sendMessage() {
  let input = document.getElementById("chat-input");
  let msg = input.value.trim();
  if (!msg) return;

  addMessage(msg, "You");
  input.value = "";

  fetch("chatbot.jsp", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: "message=" + encodeURIComponent(msg)
  })
  .then(r => r.text())
  .then(t => addMessage(t, "Bot"));
}
</script> -->
  </body>

  </html>