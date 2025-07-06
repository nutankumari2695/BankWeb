<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Central Bank</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
    }
    .container {
        display: flex;
    }
    .sidebarlogin {
        width: 20%;
        color: white;
        background-color: #003366;
        height: 100vh;
        display: flex;
        flex-direction: column;
        padding: 20px;
    }
    .logo {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 40px;
    }
    li, a {
        color: white;
        text-decoration: none;
    }
    .login-options {
        width: 80%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 50px;
    }
    h2 {
        color: #003366;
        margin-bottom: 30px;
    }
    .login-buttons {
        display: flex;
        gap: 20px;
        margin-bottom: 20px;
    }
    .login-buttons a {
        padding: 15px 30px;
        background: linear-gradient(45deg, #0066cc, #003366);
        color: white;
        border: none;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s ease;
    }
    .login-buttons a:hover {
        background: linear-gradient(45deg, #004c99, #001f4d);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
    .signup-link {
        margin-top: 10px;
        font-size: 14px;
    }
    .signup-link a {
        color: #0066cc;
        text-decoration: underline;
        font-weight: bold;
    }
    .signup-link a:hover {
        color: #004c99;
    }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebarlogin">
            <div class="logo">Central Bank of India</div>
        </div>

        <!-- Main Login Options Outside Sidebar -->
        <div class="login-options">
            <h2>Login Options</h2>
            <div class="login-buttons">
                <a href="seniorCitizenlogin.jsp">Senior Citizen Login</a>
                <a href="commonPubliclogin.jsp">Common Public Login</a>
            </div>
            <div class="signup-link">
               If not registered yet? <a href="signup.jsp">Sign Up Here</a>
            </div>
        </div>
    </div>
</body>
</html>
