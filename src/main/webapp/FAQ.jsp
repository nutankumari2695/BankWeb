<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQs - Online Slot Booking</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
  body {
    font-family: 'Poppins', sans-serif;
   
    color: #333;
  }

.containerfaq{
 background-color: beige;
}

  .site-section {
    padding: 10px 0;
  }

  .section-title {
  
    font-weight: 600;
    font-size: 2.5rem;
    color: #2c3e50;
  }

  .faq-card {
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0, 0, 0, 0.05);
    padding: 25px;
    margin-bottom: 30px;
    transition: transform 0.3s ease;
  }

  .faq-card:hover {
    transform: translateY(-5px);
  }

  .faq-card h3 {
    font-size: 1.25rem;
    color: #0d6efd;
    font-weight: 600;
  }

  .faq-card p {
    color: #555;
  }
</style>
</head>
<body>

<section class="site-section" id="faq-section">
  <div class="containerfaq">
  
    <div class="row mb-4" >
      <div class="col-12 text-center mt-4">
        <h2 class="section-title" style="padding:5px;" >Frequently Asked Questions (FAQ)</h2>
        <p class="text-muted  "  >Everything you need to know about online slot booking.</p>
      </div>
    </div>

    <div class="row">
      <!-- Left Column -->
      <div class="col-lg-6">
        <div class="faq-card">
          <h3>What is Online Deposit Slot Booking?</h3>
          <p>Online Deposit Slot Booking allows users to reserve a time slot for depositing money at the bank to avoid long queues and ensure social distancing.</p>
        </div>

        <div class="faq-card">
          <h3>What are the available time slots?</h3>
          <p>The booking slots are available from <strong>9:20 AM to 3:45 PM</strong>. You can select an available slot that suits you.</p>
        </div>

        <div class="faq-card">
          <h3>How can I book a withdrawal slot?</h3>
          <p>To book a slot for cash withdrawal, log in to the portal, select "Withdrawal Slot Booking," choose your bank branch, date, and available time slot, and confirm your booking.</p>
        </div>

        <div class="faq-card">
          <h3>What if I miss my booked slot?</h3>
          <p>If you miss your slot, you must rebook a new slot through the portal. It is advisable to arrive on time to avoid cancellation.</p>
        </div>
      </div>

      <!-- Right Column -->
      <div class="col-lg-6">
        <div class="faq-card">
          <h3>How do I book a slot for document verification?</h3>
          <p>Go to the "Document Verification" section, select your bank branch, upload the necessary documents, and choose a time slot for verification.</p>
        </div>

        <div class="faq-card">
          <h3>Can I cancel or reschedule my booked slot?</h3>
          <p>Yes, you can cancel or reschedule your booking before your appointment time from the "My Bookings" section.</p>
        </div>

        <div class="faq-card">
          <h3>Is there any fee for booking a slot?</h3>
          <p>No, slot booking for deposit, withdrawal, and documentation is completely free under the Aatmanirbhar Bihar initiative.</p>
        </div>

        <div class="faq-card">
          <h3>How does this system help in maintaining social distancing?</h3>
          <p>The online booking system reduces overcrowding in bank premises by ensuring that customers arrive only at their scheduled time, preventing long queues and maintaining public safety.</p>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>
