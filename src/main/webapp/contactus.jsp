<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>

<!-- Optional: Add your Bootstrap CSS if not already included -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  #contact-section {
    padding-top: 10px;  /* Reduced from default */
    padding-bottom: 10px;
  }
  .section-title {
    margin-bottom: 3px; /* Reduce space below heading */
  }
  .text-muted {
    margin-bottom: 4px; /* Reduce space below paragraph */
  }
  
</style>
</head>

<body>

<section class="site-section bg-light"  id="contact-section" data-aos="fade">
  <div class="container">
    <div class="row mb-4">
      <div class="col-12 text-center">
        <h2 class="section-title" style="font-weight: bold; padding:6px ">Get in Touch</h2>
        <p class="text-muted">We're here to assist you. Reach out for any queries or support.</p>
      </div>
    </div>

    <div class="row mb-4 text-center">
      <div class="col-md-4">
        <p class="mb-3">
          <span class="icon-room d-block h3 text-primary"></span>
          <strong>Location:</strong> Bank Department, Patna, Bihar, India
        </p>
      </div>
      <div class="col-md-4">
        <p class="mb-3">
          <span class="icon-phone d-block h3 text-primary"></span>
          <strong>Phone:</strong> <a href="tel:+911234567890">+91 123 456 7890</a>
        </p>
      </div>
      <div class="col-md-4">
        <p class="mb-0">
          <span class="icon-mail_outline d-block h3 text-primary"></span>
          <strong>Email:</strong> <a href="mailto:support@bankbihar.com">support@bankbihar.com</a>
        </p>
      </div>
    </div>

    <div class="row">
      <div class="col-md-10 mx-auto">
        <form action="#" class="p-4 bg-white shadow rounded">
          <h3 class="h5 text-black mb-4 text-center">Send Us a Message</h3>

          <div class="row">
            <div class="col-md-6 mb-3">
              <input type="text" id="fname" class="form-control" placeholder="First Name">
            </div>
            <div class="col-md-6 mb-3">
              <input type="text" id="lname" class="form-control" placeholder="Last Name">
            </div>
          </div>

          <div class="mb-3">
            <input type="email" id="email" class="form-control" placeholder="Your Email">
          </div>

          <div class="mb-3">
            <input type="text" id="subject" class="form-control" placeholder="Subject">
          </div>

          <div class="mb-3">
            <textarea name="message" id="message" cols="30" rows="5" class="form-control" placeholder="Write your message here..."></textarea>
          </div>

          <div class="text-center">
            <button type="submit" class="btn btn-primary btn-md px-4">Send Message</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

</body>
</html>
