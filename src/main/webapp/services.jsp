<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Bank Slot Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="styles.css"> <!-- External CSS for custom styling -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .services-section {
        margin-top:10px;
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient background */
            padding: 50px 0;
            color: white;
        }
        .service-card {
            background: white;
            color: #333;
            border-radius: 10px;
            transition: 0.3s ease-in-out;
            padding: 25px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
        }
        .service-icon img {
            width: 80px;
            margin-bottom: 15px;
        }
        .service-card h4 {
            font-weight: bold;
        }
        .service-card p {
            font-size: 14px;
            color: #555;
        }
      
    </style>
</head>
<body>

<section class="services-section" id="services-section">
    <div class="container">
        <div class="row mb-1">
            <div class="col-12 text-center ">
                <h2 class="section-title" style="font-weight: bold; padding:3px;">Banking Services</h2>
                <p class="lead">We offer seamless, fast, and secure banking services to enhance your experience.</p>
            </div>
        </div>
        <div class="row g-4">
            <!-- Slot Booking -->
            <div class="col-md-6 col-lg-4">
                <div class="service-card">
                   
                    <h4>🖲️Hassle-Free Slot Booking</h4>
                    <p>Book your bank visit slot online and avoid long waiting times.</p>
                </div>
            </div>

            <!-- Secure Deposits & Withdrawals -->
            <div class="col-md-6 col-lg-4">
                <div class="service-card">
                    
                    <h4>💰Secure Deposits & Withdrawals</h4>
                    <p>Effortlessly deposit or withdraw money with enhanced security.</p>
                </div>
            </div>

            <!-- Document Update Booking -->
            <div class="col-md-6 col-lg-4">
                <div class="service-card">
                   
                    <h4>💴Online Document Updation</h4>
                    <p>Update KYC, PAN, or Aadhaar details without visiting the branch.</p>
                </div>
            </div>

            <!-- Better Security Features -->
            <div class="col-md-6 col-lg-4">
                <div class="service-card">
                   
                    <h4>🛅Advanced Security Features</h4>
                    <p>Bank safely with multi-layer authentication and fraud detection.</p>
                </div>
            </div>

            <!-- Reduced Queue System -->
            <div class="col-md-6 col-lg-4">
                <div class="service-card">
                    
                    <h4>🛅Smart Queue Management</h4>
                    <p>Minimize waiting time with a structured appointment system.</p>
                </div>
            </div>

            <!-- Social Distancing Measures -->
            <div class="col-md-6 col-lg-4">
                <div class="service-card">
                   
                    <h4>🏦Ensuring Social Distancing</h4>
                    <p>Maintain safety by booking slots and reducing crowd gatherings.</p>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
