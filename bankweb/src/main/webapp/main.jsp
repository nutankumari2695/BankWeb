<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>

   
<%
    // Check if logout is successful and store it in session
    String logout = request.getParameter("logout");
    if ("success".equals(logout)) {
        session.setAttribute("logoutSuccess", "true");
        response.sendRedirect("main.jsp"); // change to current page if needed
        return;
    }

    // Show message if logoutSuccess is set, then remove it
    if ("true".equals(session.getAttribute("logoutSuccess"))) {
        session.removeAttribute("logoutSuccess");
%>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const msg = document.createElement("div");
            msg.textContent = "✅ Logout successful.";
            Object.assign(msg.style, {
                position: "fixed",
                top: "20px",
                left: "50%",
                transform: "translateX(-50%)",
                background: "#28a745",
                color: "#fff",
                padding: "10px 20px",
                borderRadius: "5px",
                boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                zIndex: 9999,
                fontWeight: "bold",
                fontSize: "16px"
            });
            document.body.appendChild(msg);
            setTimeout(() => msg.remove(), 4000); // remove after 4 seconds
        });
    </script>
<%
    }
%>

<%
    String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    StringBuilder captcha = new StringBuilder();
    Random rnd = new Random();
    while (captcha.length() < 5) {
        int index = (int) (rnd.nextFloat() * chars.length());
        captcha.append(chars.charAt(index));
    }
    String captchaCode = captcha.toString();
    session.setAttribute("captcha", captchaCode);
%>

<%
    String ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    StringBuilder cap = new StringBuilder();
    Random x = new Random();
    while (cap.length() < 5) {
        int index = (int) (x.nextFloat() * ch.length());
        cap.append(ch.charAt(index));
    }
    String cacha = cap.toString();
    session.setAttribute("cap", captchaCode);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
<link rel="stylesheet" href="css/signup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- ✅ Bootstrap CSS (Include First) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <style>
    html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow-y: hidden;
    overflow-x: hidden; /* Prevent horizontal scroll */
    scroll-behavior: smooth; /* Enables smooth scrolling */
}

body {
    /* ✅ Correct path syntax */
    background-size: cover;                  /* 📐 Make background image cover full screen */
    background-repeat: no-repeat;            /* 🔁 Prevent repeating */
    background-position: center;             /* 🎯 Center the image */
    min-height: 100vh;                       /* 📏 Full height of viewport */
    margin: 0;                               /* 🚫 Remove default margin */
    overflow-y: auto;                        /* 🔽 Allow vertical scroll if needed */
}

    
  footer {
    margin: 0;
    padding: 0;
    position: relative;
    bottom: 0;
    width: 100%;
    
}
  #accountDropdown {
 
  color: #fff;  
  font-size:20px;  
  background: linear-gradient(to right, #6a11cb, #2575fc);          /* White text */
 
  padding: 8px 16px;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s ease;
  text-decoration: none;
}

#accountDropdown:hover {
 background: #0b5ed7;  /* 🔶 Base orange background */
color: #fff;               /* 🧾 White text color */

  
}

#adminDropdown {
  color: #fff; 
  font-size:20px;             /* White text */
  background: linear-gradient(to right, #6a11cb, #2575fc);          /* White text */
 
  padding: 8px 16px;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s ease;
  text-decoration: none;
}

#adminDropdown:hover {
  background: #0b5ed7; /* Slightly darker on hover */
  color: #fff;
}


/* 🔲 Background with blur */
.blur-bg-container {
    position: relative;
    background-image: url('image/sb.jpeg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    min-height: 100vh;
}

/* 🔍 Blurred Overlay */
.blur-bg-container::before {
    content: "";
    position: absolute;
    top: 0; left: 0;
    width: 100%;
    height: 100%;
    backdrop-filter: blur(2px); /* Adjust the blur intensity */
    background-color: rgba(0, 0, 0, 0.4); /* Optional: dark tint overlay */
    z-index: 1;
}

/* 🧱 Content Layer */
.content-wrapper {
    position: relative;
    z-index: 2;
}

.custom-navbar {
  background-color: #D3D3D3; /* Light Grey */
  box-shadow: 0 4px 8px rgba(245, 245, 220, 0.6); /* Beige shadow */
}

  
    </style>
</head>
<body >


<!-- ✅ Navbar with Account and Admin Dropdowns -->

<nav class="navbar navbar-expand-lg navbar-dark  shadow fixed-top  custom-navbar">
    <div class="container-fluid">
    <img src="image/bilogo.jpg" style="width:120px; height:50px; border-radius:22px;padding:2px; margin-right:3px;">
        <a class="navbar-brand fs-3 fw-bold" href="main.jsp" style="color:black; font-size:bold">Atmanirbhar Bihar 🏦</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">

                <!-- ✅ Account Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle no-arrow" id="accountDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
                        👨‍💼 <strong>User Account</strong>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up</a></li>
                        <li class="dropdown-submenu">
                            <a class="dropdown-item submenu-toggle" href="#">Sign In ▸</a>
                            <ul class="dropdown-menu submenu">
                                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#seniorLoginModal">Senior Citizen</a></li>
                                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#commonLoginModal">Common Citizen</a></li>
                            </ul>
                        </li>
                      <!--    <li><a class="dropdown-item" href="Signout">Sign Out</a></li>-->
                    </ul>
                </li>

                <!-- ✅ Admin Dropdown -->
                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle no-arrow" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        🛡️ <strong>Admin Account</strong>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                      <!--   <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#registerAdminModal">Register Admin</a></li> -->
                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#adminLoginModal">Login Admin</a></li>
                       <!--  <li><a class="dropdown-item" href="logoutAdmin">Logout</a></li> -->
                    </ul>
                </li>
                
                <li class="nav-item"><a id="nav-contact" class="nav-link" href="#contact-section" style="color:black; font-size:bold ;font-size:20px;  " >Contact Us📞</a></li>  

            </ul>
        </div>
    </div>
</nav>

<!-- ✅ Blurred Background Wrapper -->
<div class="blur-bg-container">

    <!-- ✅ Content on top -->
    <div class="container content-wrapper d-flex justify-content-center align-items-center" style="min-height: 100vh; padding-top: 80px;">
    
        <div class="text-center">
       <h3 style="color:beige"> <%= new java.text.SimpleDateFormat("EEEE, dd MMMM yyyy | hh:mm a").format(new java.util.Date()) %></h3>
        
            <h1 class="mb-4 fw-bold text-light">Welcome to the Atmanirbhar Bihar Portal</h1>
           <!--  <h3 class="mb-4 fw-bold text-light">आत्मनिर्भर बिहार पोर्टल में आपका स्वागत है</h3> -->
            
            <h4 class="text-warning font-weight-bold">अब जमा, निकासी और दस्तावेज़ सत्यापन के लिए ऑनलाइन बैंक स्लॉट बुक करें — लंबी कतारों से बचें, समय बचाएं और डिजिटल बिहार के साथ एक स्मार्ट पहल करें।</h4>
            
            <h4 class="mb-4 text-light">Online Banking Slot Booking System </h4>

            <div class="d-grid gap-3 col-8 col-md-6 mx-auto main-buttons">
                <a href="services.jsp" class="btn btn-outline-primary btn-lg btn-hover-tooltip" data-tooltip="Please login first to continue">👨‍💼 Public  Panel</a>
              <!--   <a href="#" class="btn btn-outline-danger btn-lg btn-hover-tooltip" data-tooltip="Please login first to continue">🛡️ Admin Panel</a> -->
            </div>
        </div>
    </div>
</div>


  <%
    String logoutMessage = request.getParameter("logout");
    if ("success".equals(logoutMessage)) {
%>
    <div class="alert alert-success text-center">
        You have successfully logged out.
    </div>
<%
    }
%>  
     
<%@ include file="contactus.jsp" %>
<%@ include file="footer.jsp" %>


    
  <!-- ///////////////////////////////// -->
          
<!-- Register Admin Modal -->
<div class="modal fade" id="registerAdminModal" tabindex="-1" aria-labelledby="registerAdminLabel" aria-hidden="true">

<%
    String am = (String) request.getAttribute("error");
    if (am == null) {
        am = (String) request.getAttribute("success");
    }

    if (am != null) {
%>
    <script>
        alert("<%= am.replaceAll("\"", "\\\\\"") %>");
    </script>
<%
    }
%>

    <div class="modal-dialog modal-md">
        <div class="modal-content shadow rounded-4">
            <div class="modal-header border-0 pb-1">
                <h5 class="modal-title text-center w-100 fw-bold" id="registerAdminLabel">Register Admin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body px-3 pt-1 pb-2">
                <form action="RegisterAdmin" method="post">

                    <!-- Branch Code -->
                    <div class="row align-items-center mb-2">
                        <label for="branchCode" class="col-md-4 col-form-label fw-semibold">Branch Code</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="branchCode" id="branchCode"
                                pattern="^[A-Z0-9]+$" title="Must contain only uppercase letters and numbers" required>
                        </div>
                    </div>

                    <!-- Employee ID -->
                    <div class="row align-items-center mb-2">
                        <label for="employeeId" class="col-md-4 col-form-label fw-semibold">Employee ID</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="employeeId" id="employeeId"
                                pattern="^[A-Z0-9]+$" title="Must contain only uppercase letters and numbers" required>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="row align-items-center mb-2">
                        <label for="adminEmail" class="col-md-4 col-form-label fw-semibold">Email</label>
                        <div class="col-md-8">
                            <input type="email" class="form-control form-control-sm" name="adminEmail" id="adminEmail" required>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="row align-items-center mb-2">
                        <label for="adminPassword" class="col-md-4 col-form-label fw-semibold">Password</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control form-control-sm" name="adminPassword" id="adminPassword" required>
                        </div>
                    </div>

                    <!-- CAPTCHA -->
                    <div class="row align-items-center mb-3">
                        <label for="captcha" class="col-md-4 col-form-label fw-semibold">Captcha</label>
                        <div class="col-md-3">
                            <strong class="d-block text-center bg-light border rounded px-2 py-1"><%= captchaCode %></strong>
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control form-control-sm mt-2" name="captcha" id="captcha" placeholder="Enter captcha" required>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid mb-2">
                        <button type="submit" class="btn btn-primary rounded-3 shadow-sm py-2">Register</button>
                    </div>

                    <!-- Already registered -->
                    <p class="mt-2 mb-0 text-center small">
                        If already registered? 
                        <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#adminLoginModal">Login here</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>

          
          
       <!-- Admin Login Modal -->
<div class="modal fade" id="adminLoginModal" tabindex="-1" aria-labelledby="adminLoginLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content shadow rounded-4">
            <div class="modal-header border-0 pb-1">
                <h5 class="modal-title text-center w-100 fw-bold" id="adminLoginLabel">Admin Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body px-3 pt-1 pb-2">
                <form action="AdminLogin" method="post">

                    <!-- Branch Code -->
                    <div class="row align-items-center mb-2">
                        <label for="branchCode" class="col-md-4 col-form-label fw-semibold">Branch Code</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="branchCode" id="branchCode"
                                pattern="^[A-Z0-9]+$" title="Use only uppercase letters and numbers" required>
                        </div>
                    </div>

                    <!-- Employee ID -->
                    <div class="row align-items-center mb-2">
                        <label for="employeeId" class="col-md-4 col-form-label fw-semibold">Employee ID</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="employeeId" id="employeeId"
                                pattern="^[A-Z0-9]+$" title="Use only uppercase letters and numbers" required>
                        </div>
                    </div>

                    <!-- Admin Email -->
                    <div class="row align-items-center mb-2">
                        <label for="adminEmail" class="col-md-4 col-form-label fw-semibold">Email</label>
                        <div class="col-md-8">
                            <input type="email" class="form-control form-control-sm" name="adminEmail" id="adminEmail" required>
                        </div>
                    </div>

                    <!-- Admin Password -->
                    <div class="row align-items-center mb-2">
                        <label for="adminPassword" class="col-md-4 col-form-label fw-semibold">Password</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control form-control-sm" name="adminPassword" id="adminPassword" required>
                        </div>
                    </div>

                    <!-- CAPTCHA -->
                    <div class="row align-items-center mb-3">
                        <label for="captcha" class="col-md-4 col-form-label fw-semibold">Captcha</label>
                        <div class="col-md-3">
                            <strong class="d-block text-center bg-light border rounded px-2 py-1"><%= cacha %></strong>
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control form-control-sm" name="captcha" id="captcha" placeholder="Enter captcha" required>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid mb-2">
                        <button type="submit" class="btn btn-primary rounded-3 shadow-sm py-2">Login</button>
                    </div>

                    <!-- Links -->
                    <div class="d-flex justify-content-between">
                      <!--    <p class="mt-2 mb-0 small">
                            Not registered? 
                            <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#registerAdminModal">Sign Up here</a>
                        </p>-->
                        <p class="mt-2 mb-0 small">
                            <a href="forgotAdmin.jsp" class="text-decoration-none">Forgot Password?</a>
                        </p>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
          
 
      
<!-- Signup Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
<% 
    String message = (String) session.getAttribute("message");
    if (message != null) {
        session.removeAttribute("message");
%>
    <script type="text/javascript">
        // Show the alert message
        alert("<%= message %>");

        // Automatically close the alert after 3 seconds
        setTimeout(function() {
            // Close the alert by reloading the page or doing any other action you want
            location.reload(); // or simply: window.location.href = "main.jsp";
        }, 3000); // 3000ms = 3 seconds
    </script>
<%
    }
%>

    <div class="modal-dialog modal-lg">
        <div class="modal-content signup-modal shadow-lg rounded-4">
            <div class="modal-header border-0 pb-1">
                <h5 class="modal-title w-100 text-center fw-bold" id="signupModalLabel">Create an Account</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body px-3 py-2">
                <form action="SignupServlet" method="post" enctype="multipart/form-data">

                    <!-- Full Name -->
                    <div class="row mb-2 align-items-center">
                        <label for="name" class="col-md-4 col-form-label fw-semibold">Full Name</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control small-input" name="name" id="name" placeholder="Enter your full name" required>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="row mb-2 align-items-center">
                        <label for="email" class="col-md-4 col-form-label fw-semibold">Email</label>
                        <div class="col-md-8">
                            <input type="email" class="form-control small-input" name="email" id="email" placeholder="example@email.com" required>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="row mb-2 align-items-center">
                        <label for="password" class="col-md-4 col-form-label fw-semibold">Password</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control small-input" name="password" id="password" placeholder="Create a strong password" required>
                        </div>
                    </div>

                    <!-- Age -->
                    <div class="row mb-2 align-items-center">
                        <label for="age" class="col-md-4 col-form-label fw-semibold">Age</label>
                        <div class="col-md-8">
                            <input type="number" class="form-control small-input" name="age" id="age" placeholder="Enter your age" required>
                        </div>
                    </div>

                    <!-- Gender -->
                    <div class="row mb-2 align-items-center">
                        <label class="col-md-4 col-form-label fw-semibold">Gender</label>
                        <div class="col-md-8 d-flex gap-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" value="male" required>
                                <label class="form-check-label">Male</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" value="female" required>
                                <label class="form-check-label">Female</label>
                            </div>
                        </div>
                    </div>

                    <!-- User Type -->
                    <div class="row mb-2 align-items-center">
                        <label class="col-md-4 col-form-label fw-semibold">User Type</label>
                        <div class="col-md-8 d-flex gap-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" value="senior" required>
                                <label class="form-check-label">Senior Citizen</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" value="common" required>
                                <label class="form-check-label">Common Citizen</label>
                            </div>
                        </div>
                    </div>

                    <!-- Aadhaar Number -->
                    <div class="row mb-2 align-items-center">
                        <label for="aadhaarNo" class="col-md-4 col-form-label fw-semibold">Aadhaar Number</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control small-input" name="aadhaarNo" id="aadhaarNo" pattern="[0-9]{12}" maxlength="12" placeholder="12-digit Aadhaar No." required>
                        </div>
                    </div>

                    <!-- Aadhaar Upload -->
                    <div class="row mb-2 align-items-center">
                        <label for="aadhaar" class="col-md-4 col-form-label fw-semibold">Aadhaar Upload</label>
                        <div class="col-md-8">
                            <input type="file" class="form-control small-input" name="aadhaar" id="aadhaar" accept=".jpg,.jpeg,.png,.pdf" required>
                        </div>
                    </div>

                    <!-- Captcha -->
                    <div class="row mb-2 align-items-center">
                        <label class="col-md-4 col-form-label fw-semibold">Captcha</label>
                        <div class="col-md-4">
                            <strong class="captcha-code bg-light border rounded px-2 py-1 d-block text-center"><%= captchaCode %></strong>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control small-input" name="captcha" id="captcha" placeholder="Enter captcha" required>
                        </div>
                    </div>

                    <!-- Terms and Submit -->
                    <div class="form-check mb-2 ms-1">
                        <input type="checkbox" class="form-check-input" name="terms" id="terms" required>
                        <label class="form-check-label" for="terms">I accept the <a href="#">Terms and Conditions</a></label>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 py-2 rounded-3 shadow-sm">Sign Up</button>

                    <p class="mt-2 text-center">Already registered? <a href="main.jsp">Login here</a></p>
                </form>
            </div>
        </div>
    </div>
</div>

                        

<!-- Senior Citizen Login Modal -->
<!-- Senior Citizen Login Modal -->
<div class="modal fade" id="seniorLoginModal" tabindex="-1" aria-labelledby="seniorLoginModalLabel" aria-hidden="true">


   <%
    String loginSuccess = (String) session.getAttribute("loginSuccessMessage");
    if (loginSuccess != null) {
        session.removeAttribute("loginSuccessMessage"); // Remove after showing
%>
    <div id="alertBox" class="alert alert-success text-center fixed-top mx-auto w-50 shadow" style="z-index: 9999; display: none;">
        <%= loginSuccess.replaceAll("\"", "\\\\\"") %>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const alertBox = document.getElementById("alertBox");
            alertBox.style.display = "block";

            // Auto-hide after 4 seconds
            setTimeout(() => {
                alertBox.style.display = "none";
            }, 4000);
        });
    </script>
<%
    }
%>
   


    <div class="modal-dialog modal-md">
        <div class="modal-content shadow rounded-4">
            <div class="modal-header border-0 pb-1">
                <h5 class="modal-title text-center w-100 fw-bold" id="seniorLoginModalLabel">Senior Citizen Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body px-3 pt-1 pb-2">
                <form action="LoginSeniorCitizen" method="post">

                    <!-- User Type -->
                    <div class="row align-items-center mb-2">
                        <label class="col-md-4 col-form-label fw-semibold">User Type</label>
                        <div class="col-md-8 d-flex gap-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" value="senior" required>
                                <label class="form-check-label">Senior Citizen</label>
                            </div>
                           <!--  <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" value="common" required>
                                <label class="form-check-label">Common Citizen</label>
                            </div>--> 
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="row align-items-center mb-2">
                        <label for="email" class="col-md-4 col-form-label fw-semibold">Email</label>
                        <div class="col-md-8">
                            <input type="email" class="form-control form-control-sm" name="email" id="email" placeholder="Enter your email" required>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="row align-items-center mb-2">
                        <label for="password" class="col-md-4 col-form-label fw-semibold">Password</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control form-control-sm" name="password" id="password" placeholder="Enter your password" required>
                        </div>
                    </div>

                    <!-- Aadhaar No. -->
                    <div class="row align-items-center mb-2">
                        <label for="aadhaarNo" class="col-md-4 col-form-label fw-semibold">Aadhaar No.</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="aadhaarNo" id="aadhaarNo" pattern="[0-9]{12}" maxlength="12" placeholder="12-digit Aadhaar No." required>
                        </div>
                    </div>

                    <!-- Captcha Display -->
                    <div class="row align-items-center mb-2">
                        <label class="col-md-4 col-form-label fw-semibold">Captcha</label>
                        <div class="col-md-8 d-flex align-items-center gap-2">
                            <span class="captcha bg-light border rounded px-2 py-1" id="captchaText"></span>
                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="generateCaptcha()">↻</button>
                        </div>
                    </div>

                    <!-- Captcha Input -->
                    <div class="row align-items-center mb-3">
                        <label for="captchaInput" class="col-md-4 col-form-label fw-semibold">Enter Captcha</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="captchaInput" id="captchaInput" placeholder="Enter captcha" required>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid mb-2">
                        <button type="submit" class="btn btn-primary rounded-3 shadow-sm py-2">Login</button>
                    </div>

                    <!-- Links -->
                    <div class="d-flex justify-content-between">
                        <p class="mt-2 mb-0 small">
                            Not registered? <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up here</a>
                        </p>
                        <p class="mt-2 mb-0 small">
                            <a href="forgotpassword.jsp" class="text-decoration-none">Forgot Password?</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Common Citizen Login Modal -->
<div class="modal fade" id="commonLoginModal" tabindex="-1" aria-labelledby="commonLoginModalLabel" aria-hidden="true">

<%
    String m = (String) request.getAttribute("errorMessage");
    if (m == null) {
        m = (String) request.getAttribute("successMessage");
    }

    if (m != null) {
%>
    <script>
        alert("<%= m.replaceAll("\"", "\\\\\"") %>");
    </script>
<%
    }
%>

    <div class="modal-dialog modal-md">
        <div class="modal-content shadow rounded-4">
            <div class="modal-header border-0 pb-1">
                <h5 class="modal-title text-center w-100 fw-bold" id="commonLoginModalLabel">Common Citizen Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body px-3 pt-1 pb-2">
                <form action="Logincommon" method="post">
                    
                    <!-- User Type -->
                    <div class="row align-items-center mb-2">
                        <label class="col-md-4 col-form-label fw-semibold">User Type</label>
                        <div class="col-md-8 d-flex gap-3">
                          <!--    <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" value="senior" required>
                                <label class="form-check-label">Senior Citizen</label>
                            </div>-->
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" value="common" required>
                                <label class="form-check-label">Common Citizen</label>
                            </div>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="row align-items-center mb-2">
                        <label for="email" class="col-md-4 col-form-label fw-semibold">Email</label>
                        <div class="col-md-8">
                            <input type="email" class="form-control form-control-sm" name="email" id="email" placeholder="Enter your email" required>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="row align-items-center mb-2">
                        <label for="password" class="col-md-4 col-form-label fw-semibold">Password</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control form-control-sm" name="password" id="password" placeholder="Enter your password" required>
                        </div>
                    </div>

                    <!-- Aadhaar No. -->
                    <div class="row align-items-center mb-2">
                        <label for="aadhaarNo" class="col-md-4 col-form-label fw-semibold">Aadhaar No.</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="aadhaarNo" id="aadhaarNo" pattern="[0-9]{12}" maxlength="12" placeholder="12-digit Aadhaar No." required>
                        </div>
                    </div>

                    <!-- Captcha Display -->
                    <div class="row align-items-center mb-2">
                        <label class="col-md-4 col-form-label fw-semibold">Captcha</label>
                        <div class="col-md-8 d-flex align-items-center gap-2">
                            <span class="captcha bg-light border rounded px-2 py-1" id="capText"></span>
                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="generateCap()">↻</button>
                        </div>
                    </div>

                    <!-- Captcha Input -->
                    <div class="row align-items-center mb-3">
                        <label for="captchaInput" class="col-md-4 col-form-label fw-semibold">Enter Captcha</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm" name="captchaInput" id="captchaInput" placeholder="Enter captcha" required>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid mb-2">
                        <button type="submit" class="btn btn-primary rounded-3 shadow-sm py-2">Login</button>
                    </div>

                    <!-- Links -->
                    <div class="d-flex justify-content-between">
                        <p class="mt-2 mb-0 small">
                            Not registered? <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up here</a>
                        </p>
                        <p class="mt-2 mb-0 small">
                            <a href="forgotcommonpassword.jsp" class="text-decoration-none">Forgot Password?</a>
                        </p>
                    </div>

                  
                </form>
            </div>
        </div>
    </div>
</div>


 <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ Bootstrap JS (Required for modals) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


  <script>
    
    document.addEventListener("DOMContentLoaded", function () {
        // Enable Bootstrap dropdowns
        document.querySelectorAll(".dropdown-toggle").forEach((dropdown) => {
          new bootstrap.Dropdown(dropdown);
        });

        // Handle submenu toggle
        document.querySelectorAll(".submenu-toggle").forEach((toggle) => {
          toggle.addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation(); // Prevent closing parent dropdown

            const submenu = this.nextElementSibling;

            // Close other submenus
            document.querySelectorAll(".submenu").forEach((menu) => {
              if (menu !== submenu) menu.classList.remove("show");
            });

            // Toggle current submenu
            submenu.classList.toggle("show");
          });
        });

        // Close all submenus when clicking outside
        document.addEventListener("click", function (e) {
          if (!e.target.closest(".dropdown-submenu")) {
            document.querySelectorAll(".submenu").forEach((menu) =>
              menu.classList.remove("show")
            );
          }
        });
      });
    
   
    function generateCaptcha() {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        let captcha = '';
        for (let i = 0; i < 5; i++) {
            captcha += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        document.getElementById('captchaText').innerText = captcha;
    }
    // Generate captcha on page load
    window.onload = generateCaptcha;

    function generateCap() {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        let captcha = '';
        for (let i = 0; i < 5; i++) {
            captcha += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        document.getElementById('capText').innerText = captcha;
    }
    // Generate captcha on page load
    window.onload = generateCap;

   
 // Ensure Bootstrap dropdowns work properly
    document.addEventListener("DOMContentLoaded", function () {
        let dropdowns = document.querySelectorAll(".dropdown-toggle");
        dropdowns.forEach((dropdown) => {
            dropdown.addEventListener("click", function (event) {
                event.stopPropagation();
                let parentDropdown = this.closest(".dropdown");
                let subMenu = parentDropdown.querySelector(".dropdown-menu");
                subMenu.classList.toggle("show");
            });
        });
    });

    
</script>

</body>
</html>
