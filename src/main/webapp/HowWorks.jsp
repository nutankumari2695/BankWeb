<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>How It Works - Atmanirbhar Bihar Portal</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    
  }
  .containerwork{
  margin-top:5px;
  background-color: #fdf6ee;
  }
  .section-title {
  padding-top:30px;
    color: #2c3e50;
    font-weight: bold;
  }
  .lead {
    color: #555;
  }
  .btn-primary {
    background-color: #007bff;
    border: none;
    transition: 0.3s ease;
  }
  .btn-primary:hover {
    background-color: #0056b3;
  }
  .carousel-control-prev-icon,
  .carousel-control-next-icon {
    background-color: #007bff;
    border-radius: 50%;
    padding: 10px;
  }
  .carousel-indicators [data-bs-target] {
    background-color: #007bff;
  }
  .carousel-inner img {
    border-radius: 10px;
    max-height: 300px;
    object-fit: cover;
  }
</style>
</head>
<body>

<section class="py-2" id="howtoworks">
  <div class="containerwork ">
    <div class="text-center mb-5 ">
      <h2 class="section-title "  >How It Works on Atmanirbhar Bihar Portal</h2>
      <p class="lead">
        Empowering citizens through seamless digital services — experience faster, smarter, and safer banking features via the Atmanirbhar Bihar Portal.
      </p>
    </div>

    <div class="row justify-content-center">
      <div class="col-lg-10">
        <div id="howItWorksCarousel" class="carousel slide" data-bs-ride="carousel">
          
          <!-- Indicators -->
          <div class="carousel-indicators mb-0">
            <button type="button" data-bs-target="#howItWorksCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#howItWorksCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#howItWorksCarousel" data-bs-slide-to="2"></button>
            <button type="button" data-bs-target="#howItWorksCarousel" data-bs-slide-to="3"></button>
            <button type="button" data-bs-target="#howItWorksCarousel" data-bs-slide-to="4"></button>
          </div>

          <!-- Carousel Items -->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="row align-items-center">
                <div class="col-md-6">
                  <img src="image/sb.jpeg" class="d-block w-100 h-50" alt="Online Slot Booking">
                </div>
                <div class="col-md-6">
                  <h4>01. Online Slot Booking</h4>
                  <p>Book your bank visit at your convenience through the Atmanirbhar Bihar Portal to reduce queues and save time.</p>
                  <a href="#" class="btn btn-primary">Book Now</a>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="row align-items-center">
                <div class="col-md-6">
                  <img src="image/dwb.jpg" class="d-block w-100 h-50" alt="Deposit & Withdrawal">
                </div>
                <div class="col-md-6">
                  <h4>02. Secure Deposits & Withdrawals</h4>
                  <p>Enter your Aadhaar, IFSC, and account number to deposit or withdraw safely and securely via the portal.</p>
                  <a href="#" class="btn btn-primary">Start Transaction</a>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="row align-items-center">
                <div class="col-md-6">
                  <img src="image/db.jpeg" class="d-block w-100 h-50" alt="Document Updates">
                </div>
                <div class="col-md-6">
                  <h4>03. Document Update Booking</h4>
                  <p>Need to update Aadhaar, PAN, or documents? Book a slot online and visit only when required. Save effort and time!</p>
                  <a href="#" class="btn btn-primary">Update Documents</a>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="row align-items-center">
                <div class="col-md-6">
                  <img src="image/secu.jpg" class="d-block w-100 h-50" alt="Security">
                </div>
                <div class="col-md-6">
                  <h4>04. Enhanced Security</h4>
                  <p>All your information is safe through Aadhaar-based OTP verification and future-ready face recognition technology.</p>
                  <a href="#" class="btn btn-primary">Learn More</a>
                </div>
              </div>
            </div>

            <div class="carousel-item">
              <div class="row align-items-center">
                <div class="col-md-6">
                  <img src="image/bg6.jpg" class="d-block w-100 h-50" alt="Queue Time Reduction">
                </div>
                <div class="col-md-6">
                  <h4>05. Reduce Queue Time</h4>
                  <p>From booking to banking, everything is digitized. No more waiting hours in queues — everything at your fingertips.</p>
                  <a href="#" class="btn btn-primary">Explore Services</a>
                </div>
              </div>
            </div>
          </div>
<br><br>
          <!-- Controls -->
          <button class="carousel-control-prev" type="button" data-bs-target="#howItWorksCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#howItWorksCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
          </button>
        </div>
      </div>
    </div>
  </div>
</section>

<!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
</body>
</html>
