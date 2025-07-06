<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .custom-form {
            max-width: 470px;
            padding: 20px;
            border-radius: 10px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .form-label {
            width: 40%;
            margin-bottom: 0;
            font-weight: bold;
        }
        .form-control {
            width: 60%;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow custom-form">
            <div class="card-header text-center">
                <h5>Forgot Password</h5>
            </div>
            <div class="card-body">
                <form action="forgotAdmin" method="post">
                    
                    <div class="form-group">
                        <label for="branchCode" class="form-label">Branch Code</label>
                        <input type="text" class="form-control" name="branchCode" id="branchCode" pattern="^[A-Z0-9]+$" required>
                    </div>

                    <div class="form-group">
                        <label for="employeeId" class="form-label">Employee ID</label>
                        <input type="text" class="form-control" name="employeeId" id="employeeId" pattern="^[A-Z0-9]+$" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="adminEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" name="adminEmail" id="adminEmail" required>
                    </div>

                    <div class="form-group">
                        <label for="newPassword" class="form-label">New Password</label>
                        <input type="password" class="form-control" name="newPassword" id="newPassword" required>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mt-2">Reset Password</button>
                    <p class="mt-2 text-center"><a href="main.jsp">Back to Login</a></p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
