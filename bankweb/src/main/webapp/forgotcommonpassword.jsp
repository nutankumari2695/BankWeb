<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        body {
            background-color: #f4f4f4;
        }

        .change-password-container {
        
        height:520px;
            max-width: 400px;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
        }

        .change-password-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-custom {
            width: 100%;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>
<div class="container mt-5">
    <div class="change-password-container">
        <h2>Change Password</h2>
        <form action="forgotseniorpassword" method="post">
            <!-- Email -->
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>

            <!-- Aadhaar No -->
            <div class="mb-3">
                <label class="form-label">Aadhaar No.</label>
                <input type="text" class="form-control" name="aadhaarNo" pattern="[0-9]{12}" maxlength="12" required>
            </div>

            <!-- New Password -->
            <div class="mb-3">
                <label class="form-label">New Password</label>
                <input type="password" class="form-control" name="newPassword" required>
            </div>

            <!-- Confirm Password -->
            <div class="mb-3">
                <label class="form-label">Confirm New Password</label>
                <input type="password" class="form-control" name="confirmPassword" required>
            </div>

			 <!-- Submit Button -->
<div class="text-center">
    <button type="submit" class="btn btn-primary btn-custom w-50">Change Password</button>
</div>

            <!-- Back to Login -->
            <p class="mt-3 text-center">
                Remembered your password?
                <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#commonLoginModal"> Login here</a>
            </p>
        </form>
    </div>
</div>


<!-- Common Citizen Login Modal -->
<div class="modal fade" id="commonLoginModal" tabindex="-1" aria-labelledby="seniorLoginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content shadow">
            <div class="modal-header">
                <h5 class="modal-title text-center w-100 bold-text" id="seniorLoginModalLabel" style="font-weight: bold;">Common Citizen Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
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

                   
                     <div class="form-group">
                            <label class="form-label">Captcha</label>
                            <span class="captcha" id="capText"></span>
                            <button type="button" class="btn btn-sm btn-secondary ms-2" onclick="generateCap()">↻</button>
                        </div>
                    <div class="form-group">
                        <label for="captchaInput" class="form-label">Enter Captcha</label>
                        <input type="text" class="form-control" name="captchaInput" id="captchaInput" placeholder="Enter captcha" required>
                    </div>
                     

                    <button type="submit" class="btn btn-primary custom-btn w-20">Login</button>
                    <p class="mt-3 text-center">If not registered? <a href="#" data-bs-toggle="modal" data-bs-target="#signupModal" class="text-decoration-none">Sign Up here</a></p>
                </form>
            </div>
        </div>
    </div>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>