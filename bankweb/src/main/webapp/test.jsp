<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<style>



.dropdown-submenu .dropdown-menu.show {
  display: block;
}
        
   
 /* ✅ Fix main dropdown menu */
.dropdown-menu {
    min-width: 120px !important;
    z-index: 1050;
}

/* ✅ Ensure submenus appear properly */
.dropdown-submenu {
    position: relative;
}
.submenu{
width:150px;
}

/* ✅ Ensure nested dropdown is positioned correctly */
.dropdown-submenu .submenu {
    display: none;
    position: absolute;
    top: 0;
    right: 2%;
    min-width: 180px;
    background-color: white;
    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);
}


/* ✅ Ensure the dropdown arrow works properly */
.submenu-toggle::after {
    
    float: right;
}

.no-arrow::after {
    display: none !important;
}
/* ✅ Modal backdrop fix */
.modal-backdrop {
    background-color: rgba(0, 0, 0, 0.1) !important;
    backdrop-filter: blur(2px);
}

</style>
<body>


<!-- ✅ Account Dropdown -->
<li class="nav-item dropdown">
    <a id="nav-account" class="nav-link dropdown-toggle  no-arrow" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Account
    </a>
    <ul class="dropdown-menu">
        <li><a id="nav-signup" class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up</a></li>

        <!-- ✅ Fixed Nested Dropdown for Sign In -->
        <li class="dropdown-submenu">
            <a id="nav-signin" class="dropdown-item submenu-toggle" href="#">Sign In ▸</a>
            <ul class="dropdown-menu submenu">
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#seniorLoginModal">Senior Citizen</a></li>
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#commonLoginModal">Common Citizen</a></li>
                
            </ul>
        </li>

        <li><a id="nav-signout" class="dropdown-item" href="Signout">Sign Out</a></li>
    </ul>
</li>


    

    <!-- Signup Modal -->
    <div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
    
    <%
    String message = request.getParameter("message");
    if (message != null) {
%>
    <script>alert("<%= message %>");</script>
<%
    }
%>
    
    
        <div class="modal-dialog">
            <div class="modal-content shadow">
                <div class="modal-header">
                    <h5 class="modal-title text-center w-100 bold-text" id="signupModalLabel" style="font-weight: bold;">Create an Account</h5>
                    
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                            <label for="age" class="form-label">Age</label>
                            <input type="number" class="form-control" name="age" id="age" required>
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
                        
                        
                        <div class="form-group row">
    <label for="captcha" class="col-sm-2 col-form-label">Captcha</label>
    <div class="col-sm-4">
        <strong style="letter-spacing: 3px;"> <%= captchaCode %> </strong>
    </div>
    <div class="col-sm-6">
        <input type="text" class="form-control mt-2" name="captcha" id="captcha" placeholder="Enter captcha" required>
    </div>
</div>
  <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" name="terms" id="terms" required>
                            <label class="form-check-label" for="terms">I accept the <a href="#">Terms and Conditions</a></label>
                        </div>
                        
                        <button type="submit" class="btn btn-primary custom-btn">Sign Up</button>
        <p class="mt-3 text-center"> If already registered?
         <a href="index.jsp" >Login here</a></p>
                       
                    </form>
                </div>
            </div>
        </div>
    </div>               
                        
                        

<!-- Senior Citizen Login Modal -->
<div class="modal fade" id="seniorLoginModal" tabindex="-1" aria-labelledby="seniorLoginModalLabel" aria-hidden="true">


<%
    String mess = (String) request.getAttribute("errorMessage");
    if (mess == null) {
        mess = (String) request.getAttribute("successMessage");
    }

    if (mess != null) {
%>
    <script>
        alert("<%= mess.replaceAll("\"", "\\\\\"") %>");
    </script>
<%
    }
%>

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



<!-- Common Citizen Login Modal -->
<div class="modal fade" id="commonLoginModal" tabindex="-1" aria-labelledby="seniorLoginModalLabel" aria-hidden="true">

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
                    
                       <tr>
    <td colspan="2">
        <div class="d-flex justify-content-between">
            <p class="mt-3">
                If not registered? 
                <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up here</a>
            </p>
            <p class="mt-3">
                <a href="forgotcommonpassword.jsp" class="text-decoration-none">Forgot Password?</a>
            </p>
        </div>
    </td>
</tr>
                    
                    <p class="mt-3 text-center">If not registered? <a href="#" data-bs-toggle="modal" data-bs-target="#signupModal" class="text-decoration-none">Sign Up here</a></p>
                </form>
            </div>
        </div>
    </div>
</div>





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


</script>

</body>
</html>