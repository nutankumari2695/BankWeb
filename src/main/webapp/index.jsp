<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Slot Booking</title>


   
    <style>
      
html {
    scroll-behavior: smooth;
}
      
      
 .sidebar {
            position: fixed;
            top: 56px; /* Adjusted to align below navbar */
            left: 0;
            width: 250px;
            height: calc(100vh - 56px); /* Extends to bottom of screen */
            background-color: #003366 !important ;
            color: white;
            padding: 15px;
        }

        .content {
            margin-top: 30px; /* To provide space below fixed navbar */
            margin-left: 260px; /* Adjusted for sidebar */
            padding: 20px;
        }

.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    background-color: #D3D3D3 !important; /* Light Grey */
    box-shadow: 0 5px 6px rgba(245, 245, 220, 0.5); /* Beige shadow */
}

/* ✅ Navbar Links */
.navbar-nav .nav-link {
	 color: black !important;
    
    font-weight: bold;
}

.navbar-nav .nav-item:hover .nav-link {
    color: #8000ff !important;
}


        h5{
        margin-top:10px;
        }
         img {
            width: 310px;
            height: 60px;
             border-radius: 5px;
        }
        
         body {
            overflow-x: hidden;
        }
       
        
        
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #343a40;
            color: white;
            position: fixed;
            top: 56px; /* Below navbar */
            left: -250px; /* Hidden initially */
            transition: all 0.3s ease-in-out;
        }
        .sidebar.show {
            left: 0;
        }
        .sidebar a {
            padding: 10px;
            display: block;
            color: white;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-top: 56px;
            padding: 20px;
            margin-left:170px
        }
       


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
</head>

<body>


<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("user") == null) {
        response.sendRedirect("main.jsp"); // block direct access if not logged in
    }
%>


<%
    String userlog = (String) session.getAttribute("user");
    if (userlog != null) {
%>
    <div class="alert alert-success" role="alert">
        Welcome, <%= userlog %>! Login Successful.
    </div>
<%
    }
%>

       <!-- Navbar -->
            <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark " style="position:fixed">
    <div class="container-fluid">
    
    <a href="index.jsp"><img src="image/banklogo.jpg" alt="Bank Logo" style="height: 50px; width:60px;   "class="logo"></a>
    <a class="navbar-brand fw-bold text-uppercase" href="index.jsp" 
   style="font-size: 2rem; letter-spacing: 2px; color: #fff;">
    <span style="color: orange; text-shadow: 3px 3px 6px #8000ff;" id="Atmanirbhar">
        Atmanirbhar
    </span>
    <span style="color: #8000ff; text-shadow: 3px 3px 6px  blue;" id="Bihar">
        Bihar
    </span>
</a>

<button class="btn btn-light me-3  fs-4" id="sidebarToggle">☰</button>

 <!-- Sidebar Toggle Button -->
       
    <img src="image/bihar.jpg" alt="Bank Logo" style="height: 50px; "> 
    
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
               <li class="nav-item"><a id="nav-home" class="nav-link active" href="index.jsp">Home</a></li>
              
           <!-- ✅ Working About Us Dropdown -->
<li class="nav-item dropdown">
  <a  id="nav-about"class="nav-link dropdown-toggle  no-arrow" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
    About Us
  </a>
  <ul class="dropdown-menu" aria-labelledby="nav-about">
    <li><a class="dropdown-item" href="#services-section">Services</a></li>
    <li><a class="dropdown-item" href="#faq-section">FAQ</a></li>
    <li><a class="dropdown-item" href="#howtoworks">How It Works</a></li>
  </ul>
</li>
           
               
               
<li class="nav-item"><a id="nav-slots" class="nav-link" href="#cardsbox">Slots</a></li>

<!-- Account Dropdown -->
<!-- ✅ Account Dropdown -->
<li class="nav-item dropdown">
    <a id="nav-account" class="nav-link dropdown-toggle  no-arrow" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Account👤
    </a>
    <ul class="dropdown-menu">
        
         <li><a id="nav-signout" class="dropdown-item" href="Signout">User Logout</a></li>
          <li><a id="nav-signout" class="dropdown-item" href="logoutAdmin">Admin Logout</a></li>

        <!-- ✅ Fixed Nested Dropdown for Sign In -->
        <!--   <li class="dropdown-submenu">
            <a id="nav-signin" class="dropdown-item submenu-toggle" href="#">Sign In ▸</a>
            <ul class="dropdown-menu submenu">
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#seniorLoginModal">Senior Citizen</a></li>
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#commonLoginModal">Common Citizen</a></li>
                
            </ul>
                    </li> -->

       <!--  <li><a id="nav-signout" class="dropdown-item" href="Signout">Sign Out</a></li> -->
    </ul>
</li>

<!-- ✅ Admin Dropdown -->
<!--  <li class="nav-item dropdown">
    <a id="nav-admin" class="nav-link dropdown-toggle no-arrow" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Admin
    </a>
    <ul class="dropdown-menu">
        <li><a id="nav-register-admin" class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#registerAdminModal">Register Admin</a></li>
        <li><a id="nav-login-admin" class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#adminLoginModal">Login Admin</a></li>
        <li class="nav-item"> <a class="nav-link" href="logoutAdmin">Logout</a></li>
        
    </ul>
</li> -->

<li class="nav-item"><a id="nav-contact" class="nav-link" href="#contact-section">Contact</a></li>        
  </ul>
        </div>
    </div>
</nav>

     
 
  <%@ include file="frontpagejsp.jsp" %>
                
        
       <div class="sidebar text-white p-3" id="sidebar">
    <div class="sidebar-header text-center mb-3">
     <!--    <h5 class="fw-bold" id="sidebar-header">Atmanirbhar Bihar Portal</h5>  --> 
        <p class="small" id="sidebar-subheader">Slot Booking Portal</p>
    </div>

    <ul class="nav flex-column">
        <li class="nav-item">
            <a href="#" class="nav-link text-white d-flex align-items-center">
                🔔 <span class="ms-2" id="sidebar-notifications">Current Notifications</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-white d-flex align-items-center">
                💳 <span class="ms-2" id="sidebar-withdraw">Withdraw Cash</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-white d-flex align-items-center">
                💰 <span class="ms-2" id="sidebar-deposit">Deposit Cash</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-white d-flex align-items-center">
                📝 <span class="ms-2" id="sidebar-banking">Other Banking Services</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-white d-flex align-items-center">
                📅 <span class="ms-2" id="sidebar-slot">Book a Slot</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-white d-flex align-items-center">
                📞 <span class="ms-2" id="sidebar-support">Contact Support</span>
            </a>
        </li>
    </ul>
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
     
   <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <h3 style="color:red;"><%= errorMessage %></h3>
<% } %> 
      
 
  
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

                    <button type="submit" class="btn btn-primary w-20 mt-2">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</div>


   
    <!-- Script to add blur when modal opens -->
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

    
    document.getElementById("sidebarToggle").addEventListener("click", function() {
        var sidebar = document.getElementById("sidebar");
        if (sidebar.style.left === "0px") {
            sidebar.style.left = "-250px"; // Hide sidebar
        } else {
            sidebar.style.left = "0px"; // Show sidebar
        }
    });  
    
    
 document.getElementById("sidebarToggle").addEventListener("click", function() {
     document.getElementById("sidebar").classList.toggle("show");
 });
    
        const signupModal = document.getElementById('signupModal');
        const mainContent = document.getElementById('main-content');

        signupModal.addEventListener('show.bs.modal', () => {
            mainContent.classList.add('blur-background');
        });

        signupModal.addEventListener('hidden.bs.modal', () => {
            mainContent.classList.remove('blur-background');
        });
        
       
    </script>
     <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ Bootstrap JS (Required for modals) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    
       <!-- ✅ Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
     <!-- ✅ Bootstrap JS + Popper Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
     
         
    <!-- Bootstrap Bundle with Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="translations.js"></script>
    
</body>

</html>
