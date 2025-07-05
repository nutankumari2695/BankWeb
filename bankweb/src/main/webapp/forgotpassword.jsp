<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }
 .container{
        margin-top:200px;
        
        }

        .change-password-container {
        
        height:420px;
            max-width: 300px;
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
    <div class="change-password-container p-4 shadow rounded bg-white" style="max-width: 600px; margin: auto;">
        <h2 class="text-center mb-4">Change Password</h2>
        <form action="forgotseniorpassword" method="post">
            <!-- Email -->
            <div class="row mb-3 align-items-center">
                <div class="col-4">
                    <label class="form-label mb-0">Email:</label>
                </div>
                <div class="col-8">
                    <input type="email" class="form-control w-75" name="email" required>
                </div>
            </div>

            <!-- Aadhaar No -->
            <div class="row mb-3 align-items-center">
                <div class="col-4">
                    <label class="form-label mb-0">Aadhaar No:</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control w-75" name="aadhaarNo" pattern="[0-9]{12}" maxlength="12" required>
                </div>
            </div>

            <!-- New Password -->
            <div class="row mb-3 align-items-center">
                <div class="col-4">
                    <label class="form-label mb-0">New Password:</label>
                </div>
                <div class="col-8">
                    <input type="password" class="form-control w-75" name="newPassword" required>
                </div>
            </div>

            <!-- Confirm Password -->
            <div class="row mb-3 align-items-center">
                <div class="col-4">
                    <label class="form-label mb-0">Confirm Password:</label>
                </div>
                <div class="col-8">
                    <input type="password" class="form-control w-75" name="confirmPassword" required>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary w-50">Change Password</button>
            </div>

            <!-- Back to Login -->
            <p class="mt-3 text-center">
                Remembered your password?
                <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#seniorLoginModal"> Login here</a>
            </p>
        </form>
    </div>
</div>

<!-- Senior Citizen Login Modal -->
<div class="modal fade" id="seniorLoginModal" tabindex="-1" aria-labelledby="seniorLoginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content shadow">
            <div class="modal-header">
                <h5 class="modal-title text-center w-100 bold-text" id="seniorLoginModalLabel" style="font-weight: bold;">Senior Citizen Login</h5>
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
                            <span class="captcha" id="captchaText"></span>
                            <button type="button" class="btn btn-sm btn-secondary ms-2" onclick="generateCaptcha()">↻</button>
                        </div>
                    <div class="form-group">
                        <label for="captchaInput" class="form-label">Enter Captcha</label>
                        <input type="text" class="form-control" name="captchaInput" id="captchaInput" placeholder="Enter captcha" required>
                    </div>

                    <button type="submit" class="btn btn-primary custom-btn w-20">Login</button>
                    
                    <tr>
    <td colspan="2">
        <div class="d-flex justify-content-between">
            <p class="mt-3">
                If not registered? 
                <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up here</a>
            </p>
            <p class="mt-3">
                <a href="forgotpassword.jsp" class="text-decoration-none">Forgot Password?</a>
            </p>
        </div>
    </td>
</tr>
                </form>
            </div>
        </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
