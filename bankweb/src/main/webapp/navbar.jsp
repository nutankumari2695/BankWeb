<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="css/style.css" rel="stylesheet">
 <!-- Bootstrap CSS (inside <head>) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS + Popper (before </body>) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- ✅ Bootstrap CSS (Required) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>

/* ✅ Sidebar (Fixed Below Navbar) */
.sidebar {
    width: 250px;
    height: calc(100vh - 56px); /* Full height minus navbar */
    background-color: #003366 !important;
    color: white;
    position: fixed;
    top: 56px; /* Below navbar */
    left: -250px; /* Hidden initially */
    transition: all 0.3s ease-in-out;
    padding: 15px;
    display: flex;
    flex-direction: column;
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

.sidebar h3,
.sidebar p {
    text-align: center;
    font-weight: bold;
    margin: 0;
    padding: 5px;
}

/* ✅ Navbar (Fixed on Top) */
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    background-color: #D3D3D3 !important; /* Light Grey */
    box-shadow: 0 5px 6px rgba(245, 245, 220, 0.5); /* Beige shadow */
}

/* ✅ Main Content (Adjusts for Sidebar & Navbar) */
.content {
    margin-top: 80px; /* Space for fixed navbar */
    margin-left: 260px; /* Adjusted for sidebar */
    padding: 20px;
    flex: 1;
    background-color: white;
    display: flex;
    flex-direction: column;
}
/* ✅ Navbar Links */
.navbar-nav .nav-link {
	 color: black !important;
    
    font-weight: bold;
}

.navbar-nav .nav-item:hover .nav-link {
    color: #8000ff !important;
}

.nav-item{
color:black;
}
.content .inner-content {
    padding: 30px;
}
.no-arrow::after {
    display: none !important;
}

</style>
<body>
    
       <!-- Navbar -->
            <!-- Navbar -->
           <nav class="navbar navbar-expand-lg navbar-dark " style="position:fixed">
    <div class="container-fluid">
    
    
   <a href="index.jsp"> <img src="image/banklogo.jpg" alt="Bank Logo" style="height: 50px; width:60px;   "class="logo"></a>
    
    
   <a class="navbar-brand fw-bold text-uppercase" href="index.jsp" 
   style="font-size: 2rem; letter-spacing: 2px; color: #fff;">
    <span style="color: orange; text-shadow: 3px 3px 6px #8000ff;">
        Atmanirbhar
    </span>
    <span style="color: #8000ff; text-shadow: 3px 3px 6px  blue;">
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
<li class="nav-item dropdown">
    <a id="nav-about" class="nav-link dropdown-toggle no-arrow" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        About Us
    </a>
    <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#services-section">Services</a></li>
        <li><a class="dropdown-item" href="#faq-section">FAQ</a></li>
        <li><a class="dropdown-item" href="#howtoworks">How It Works</a></li>
    </ul>
</li>
       

              
<li class="nav-item"><a id="nav-contact" class="nav-link" href="#contact-section">Contact Us</a></li>        





   <!-- <li class="nav-item dropdown">
    <a id="nav-account" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Account</a>
    <ul class="dropdown-menu">
        <li><a id="nav-signup" class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up</a></li>
        <li class="dropdown-submenu">
            <a id="nav-signin" class="dropdown-item dropdown-toggle" href="#">Sign In</a>
            <ul class="dropdown-menu">
                <li><a id="nav-senior" class="dropdown-item" href="seniorCitizenlogin.jsp">Senior Citizen</a></li>
                <li><a id="nav-common" class="dropdown-item" href="commonPubliclogin.jsp">Common Citizen</a></li>
            </ul>
        </li>
        <li><a id="nav-signout" class="dropdown-item" href="logout.jsp">Sign Out</a></li>
    </ul>
</li>

<li class="nav-item dropdown">
    <a id="nav-admin" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
    <ul class="dropdown-menu">
        <li><a id="nav-register-admin" class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#registerAdminModal">Register Admin</a></li>
        <li><a id="nav-login-admin" class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#adminLoginModal">Login Admin</a></li>
    </ul>
</li>     -->
      </ul>
        </div>
    </div>
</nav>


   <div class="sidebar text-white p-3" id="sidebar">
    <div class="sidebar-header text-center mb-3">
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
   
<script>

document.getElementById("sidebarToggle").addEventListener("click", function () {
    document.getElementById("sidebar").classList.toggle("show");
});


document.getElementById("sidebarToggle").addEventListener("click", function() {
    var sidebar = document.getElementById("sidebar");
    if (sidebar.style.left === "0px") {
        sidebar.style.left = "-250px"; // Hide sidebar
    } else {
        sidebar.style.left = "0px"; // Show sidebar
    }
});  

const translations = {
	    en: {
	        "sidebar-subheader": "Slot Booking Portal",
	        "sidebar-notifications": "Current Notifications",
	        "sidebar-withdraw": "Withdraw Cash",
	        "sidebar-deposit": "Deposit Cash",
	        "sidebar-banking": "Other Banking Services",
	        "sidebar-slot": "Book a Slot",
	        "sidebar-support": "Contact Support"
	    },
	    hi: {
	        "sidebar-subheader": "स्लॉट बुकिंग पोर्टल",
	        "sidebar-notifications": "वर्तमान सूचनाएं",
	        "sidebar-withdraw": "नकद निकालें",
	        "sidebar-deposit": "नकद जमा करें",
	        "sidebar-banking": "अन्य बैंकिंग सेवाएं",
	        "sidebar-slot": "स्लॉट बुक करें",
	        "sidebar-support": "संपर्क सहायता"
	    }
	};
	
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById('language-select').addEventListener('change', function () {
        const selectedLang = this.value;
        Object.keys(translations[selectedLang]).forEach(id => {
            const element = document.getElementById(id);
            if (element) element.innerText = translations[selectedLang][id];
        });
    });
});


</script>

    
</body>
</html>