<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Footer</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .gov-footer {
      background-color: #2c3e50;
      color: #ecf0f1;
      padding: 50px 0 30px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .gov-footer h5, .gov-footer h2 {
      font-weight: bold;
      color: #ffffff;
      margin-bottom: 15px;
    }

    .gov-footer p, .gov-footer a {
      font-size: 15px;
      color: #bdc3c7;
    }

    .gov-footer a:hover {
      color: #ffffff;
      text-decoration: underline;
    }

    .gov-footer ul {
      padding-left: 0;
      list-style: none;
    }

    .gov-footer .footer-social a {
      font-size: 20px;
      margin-right: 10px;
      color: #bdc3c7;
    }

    .gov-footer .footer-social a:hover {
      color: #ffffff;
    }

    .gov-footer .copyright {
      border-top: 1px solid #7f8c8d;
      margin-top: 40px;
      padding-top: 20px;
      font-size: 14px;
    }
  </style>
</head>
<body>

<footer class="gov-footer">
  <div class="container">
    <div class="row">
      <!-- About Section -->
      <div class="col-md-4">
        <h2 class="footer-heading mb-4">About Us</h2>
        <p>The Atmanirbhar Bihar Portal is a citizen-first initiative aimed at empowering every resident through transparent, accessible, and efficient digital services.</p>
        <p>Together, we build a self-reliant, inclusive, and progressive Bihar.</p>
      </div>

      <!-- Quick Links -->
      <div class="col-md-3">
        <h2 class="footer-heading mb-4">Quick Links</h2>
        <ul class="list-unstyled">
          <li><a href="#">Terms & Conditions</a></li>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Our Mission</a></li>
          <li><a href="#">Government Services</a></li>
          <li><a href="#">Help & Support</a></li>
          <li><a href="#">Feedback</a></li>
        </ul>
      </div>

      <!-- Follow Us & Newsletter -->
      <div class="col-md-5">
        <div class="mb-4">
          <h2 class="footer-heading">Follow Us</h2>
          <div class="footer-social">
            <a href="#"><i class="icon-facebook"></i> Facebook</a><br>
            <a href="#"><i class="icon-twitter"></i> Twitter</a><br>
            <a href="#"><i class="icon-instagram"></i> Instagram</a><br>
            <a href="#"><i class="icon-linkedin"></i> LinkedIn</a>
          </div>
        </div>
        <div>
          <h2 class="footer-heading mb-4">Subscribe to our Newsletter</h2>
          <form class="form-inline">
            <div class="input-group w-100">
              <input type="email" class="form-control" placeholder="Enter your email">
              <div class="input-group-append">
                <button class="btn btn-warning text-dark" type="submit">Subscribe</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Bottom Footer -->
    <div class="row mt-5 text-center">
      <div class="col-md-12">
        <div class="copyright">
          <p>&copy; <script>document.write(new Date().getFullYear());</script> Government of Bihar. All Rights Reserved.</p>
          <p>Powered by the Department of Information Technology, Bihar</p>
          <p>Designed with care by the State Development Team | Serving the citizens with dignity and dedication.</p>
        </div>
      </div>
    </div>
  </div>
</footer>

</body>
</html>
