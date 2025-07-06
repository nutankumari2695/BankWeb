<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Common Public Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            background-color: #003366;
            color: white;
            padding: 20px;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            font-weight: bold;
        }
        .card {
            border: none;
            border-radius: 15px;
            width: 55%;
            max-width: 600px;
        }
        .form-label {
            font-weight: bold;
            margin-right: 10px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-control {
            flex: 1;
        }
        .captcha {
            font-weight: bold;
            font-size: 20px;
            background: #e9ecef;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
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
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">
                Central Bank of India
            </div>

            <!-- Main Form -->
            <div class="col-md-8 d-flex align-items-center justify-content-center min-vh-100">
                <div class="card shadow-lg p-4">
                    <h2 class="text-center mb-4 text-primary">Common Public Sign In</h2>
                    <form action="logincommon" method="post">

                        <input type="hidden" name="type" value="common">

                        <div class="form-group">
                            <label for="citizentype" class="form-label">Citizen Type</label>
                            <input type="text" class="form-control" name="type" id="citizentype" placeholder="e.g., Common" required>
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email" required>
                        </div>

                        <div class="form-group">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
                        </div>

                        <div class="form-group"> 
                            <label for="aadhaarNo" class="form-label">Aadhaar Number</label>
                            <input type="text" class="form-control" name="aadhaarNo" id="aadhaarNo" pattern="[0-9]{12}" maxlength="12" placeholder="Enter 12-digit Aadhaar Number" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Captcha</label>
                            <span class="captcha" id="captchaText"></span>
                            <button type="button" class="btn btn-sm btn-secondary ms-2" onclick="generateCaptcha()">↻</button>
                        </div>
                        <div class="form-group">
                            <label for="captcha" class="form-label">Enter Captcha</label>
                            <input type="text" class="form-control" name="captcha" id="captcha" placeholder="Enter the above captcha" required>
                        </div>

                        
                        <button type="submit" class="btn btn-primary custom-btn">Login</button>
                         <p class="mt-3 text-center">If NOT registered? <a href="index.jsp" class="text-decoration-none">Sign Up here</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
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
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
