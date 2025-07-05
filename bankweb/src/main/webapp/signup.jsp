<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
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
<!DOCTYPE html>
<html>
<head>
    <title>Central Bank Slot Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .form-label {
            font-weight: bold;
        }
        .form-group {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .form-group input, .form-group select, .form-group textarea {
            flex: 1;
            margin-left: 15px;
        }
    </style>
</head>
<body>

    <!-- Automatically open signup modal on page load -->
    <div class="modal fade show" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" style="display: block;" aria-modal="true" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content shadow">
                <div class="modal-header">
                    <h5 class="modal-title" id="signupModalLabel">Create an Account</h5>
                </div>
                <div class="modal-body">
                    <form action="SignupServlet" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="name" id="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>
                        <div class="form-group">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Gender</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" value="male" required>
                                    <label class="form-check-label">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" value="female" required>
                                    <label class="form-check-label">Female</label>
                                </div>
                            </div>
                        </div>
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
                        <div class="form-group">
                            <label for="aadhaarNo" class="form-label">Aadhaar Number</label>
                            <input type="text" class="form-control" name="aadhaarNo" id="aadhaarNo" pattern="[0-9]{12}" maxlength="12" placeholder="12-digit Aadhaar No." required>
                        </div>
                        <div class="form-group">
                            <label for="aadhaar" class="form-label">Aadhaar Upload</label>
                            <input type="file" class="form-control" name="aadhaar" id="aadhaar" accept=".jpg,.jpeg,.png,.pdf" required>
                        </div>
                        <div class="form-group">
                            <label for="captcha" class="form-label">Captcha</label>
                            <div>
                                <strong style="letter-spacing: 3px;"> <%= captchaCode %> </strong>
                                <input type="text" class="form-control mt-2" name="captcha" id="captcha" placeholder="Enter captcha" required>
                            </div>
                        </div>
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" name="terms" id="terms" required>
                            <label class="form-check-label" for="terms">I accept the <a href="#">Terms and Conditions</a></label>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Sign Up</button>
                        <p class="mt-3 text-center">Already registered? <a href="login.jsp" class="text-decoration-none">Login here</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
