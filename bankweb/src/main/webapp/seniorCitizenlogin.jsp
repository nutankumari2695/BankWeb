<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String captcha = "";
    String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    java.util.Random random = new java.util.Random();
    for (int i = 0; i < 5; i++) {
        captcha += chars.charAt(random.nextInt(chars.length()));
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Senior Citizen Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* ✅ Light Navbar (From Left to Right) */
        .navbar {
            background-color: #f8f9fa; /* Light color */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Soft shadow */
            
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: #003366;
        }
        .nav-link {
            font-weight: bold;
            color: #003366;
        }
        .nav-link:hover {
            color: #0056b3;
        }

        /* Sidebar */
        .sidebar {
            background-color: #003366;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        /* Centered Form */
        .card {
            border: none;
            border-radius: 12px;
            width: 55%;
            padding: 5px;
            margin-top: 2%;
           
        }
        .form-label {
            font-weight: bold;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }
        .custom-btn {
            width: 30%;
            margin: 0 auto;
            display: block;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .custom-btn:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        
        
        
			
			 .card {
            border: none;
            border-radius: 12px;
            width: 55%;
           
            padding: 10px;
            margin-top: 5%;
        }
        .form-label {
            font-weight: bold;
            width: 30%;
            margin-bottom: 0.5rem;  /* Reduced gap */
        }
        .form-control {
            width: 60%;
            margin-left: 5px;
            padding: 6px 10px;
            margin-bottom: 0.5rem; /* Reduced gap */
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem; /* Reduced gap */
        }
        .card h2 {
            font-size: 20px;
            font-weight: bold;
            color: black;
            text-align: center;
        }
        .btn-primary {
            padding: 6px;
            font-size: 16px;
        }
        .sidebar {
            font-weight: bold;
            color: white;
           
        }
        button{
        align:center;
        }
        
          
        .custom-btn {
    width: 30%; /* Set the width */
    margin: 0 auto; /* Center the button horizontally */
    display: block; /* Make it a block element to apply margin auto */
    text-align: center; /* Center the text inside the button */
    font-weight: bold; /* Bold text */
    padding: 10px 20px; /* Add padding for a more attractive button */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s ease; /* Smooth transition on hover */
}

.custom-btn:hover {
    background-color: #0056b3; /* Darker color on hover */
    border-color: #0056b3; /* Change border color on hover */
}
        
        
        
        
        
        
    </style>
</head>
<body>

    <!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">TimeBanker</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
                <!-- ✅ Fixed Contact Us Link -->
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#contactModal">Contact Us</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- ✅ Contact Us Modal -->
<div class="modal fade" id="contactModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-sm"> <!-- Reduced modal size -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Contact Us</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="contactFormHandler" method="post">
                    <div class="d-flex align-items-center mb-2">
                        <label for="contactName" class="form-label me-2" style="width: 30%;">Name</label>
                        <input type="text" class="form-control" name="contactName" id="contactName" style="width: 70%;" required>
                    </div>
                    
                    <div class="d-flex align-items-center mb-2">
                        <label for="contactEmail" class="form-label me-2" style="width: 30%;">Email</label>
                        <input type="email" class="form-control" name="contactEmail" id="contactEmail" style="width: 70%;" required>
                    </div>

                    <div class="d-flex align-items-center mb-2">
                        <label for="contactMessage" class="form-label me-2" style="width: 30%;">Message</label>
                        <textarea class="form-control" name="contactMessage" id="contactMessage" rows="3" style="width: 70%;" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mt-2">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</div>

 

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">
                Central Bank of India
            </div>

            <!-- Form Section -->
           
           <div class="col-md-9 d-flex align-items-center justify-content-center vh-100 mt-0">
           
    <div class="card shadow p-3">
        <h2 class="mb-3">Senior Citizen Login</h2>
        <form action="LoginSeniorCitizen" method="post">
            
            <!-- User Type -->
            <div class="form-group">
                <label class="form-label">User Type</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" value="senior" required>
                        <label class="form-check-label">Senior Citizen</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" value="common" required>
                        <label class="form-check-label">Common Citizen</label>
                    </div>
                </div>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email" required>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>

            <!-- Aadhaar No. -->
            <div class="form-group">
                <label for="aadhaarNo" class="form-label">Aadhaar No.</label>
                <input type="text" class="form-control" name="aadhaarNo" id="aadhaarNo" pattern="[0-9]{12}" maxlength="12" placeholder="12-digit Aadhaar No." required>
            </div>

            <!-- Captcha -->
            
            
            <div class="form-group">
                            <label class="form-label">Captcha</label>
                            <div class="d-flex align-items-center gap-2">
                                <input type="text" readonly class="form-control bg-light text-center" value="<%= captcha %>">
                                <a href="" class="btn btn-sm btn-outline-secondary">↻</a>
                            </div>
                        </div>
            

            <div class="form-group">
                <label for="captchaInput" class="form-label">Enter Captcha</label>
                <input type="text" class="form-control" name="captchaInput" id="captchaInput" placeholder="Enter captcha" required>
            </div>

            <button type="submit" class="btn btn-primary custom-btn">Login</button>
            <p class="mt-3 text-center">If not registered? <a href="index.jsp" class="text-decoration-none">Sign Up here</a></p>

        </form>
    </div>
</div>
           
           
           
			
       <!-- ✅ Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
     
         
            
</body>
</html>



