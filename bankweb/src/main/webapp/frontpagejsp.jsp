<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atmanirbhar Bihar</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<style>


html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow-y: hidden;
    overflow-x: hidden; /* Prevent horizontal scroll */
    scroll-behavior: smooth; /* Enables smooth scrolling */
}

body {

    min-height: 100vh;
    overflow-y: auto; /* Allow vertical scrolling but restrict extra space */
}


.btn-dark {
  border-radius: 25px;
  font-weight: bold;
  padding-left: 20px;
  padding-right: 20px;
}
h5.fw-bold {
  font-size: 1.1rem;
}
p.small {
  margin-bottom: 5px;
  font-size: 0.9rem;
}

.card {
    border: 5px solid rgba(0, 0, 0, 0.3); /* Light border shadow effect */
    box-shadow: 0px 0px 12px 4px rgba(0, 0, 0, 0.3);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
    padding: 20px;
    background: white;
    position: relative; /* Helps shadow visibility */
}

.card:hover {
    box-shadow: 0px 0px 12px 6px rgba(0, 0, 0, 0.5); /* Stronger shadow on hover */
    transform: translateY(-5px); /* Slight lift effect */
}

.col-md-4 {
    transition: all 0.3s ease-in-out;
    border-radius: 10px; /* Rounded corners */
    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow on all sides */
}

.col-md-4:hover {
    box-shadow: 0px 0px 12px 6px rgba(128, 128, 128, 0.6); /* Strong 6px shadow on all sides */
    transform: translateY(-5px); /* Floating effect */
}

/* Prevent footer from having extra space */
footer {
    position: relative;
    bottom: 0;
    width: 100%;
    margin-bottom:0;
}

.img-fluid{

max-height: 100px; 
width:100px; 

}

.bg-container {
margin-top:5px;
    position: relative;
    height: 280px;
    width: 100%;
    overflow: hidden;
}

.bg-container::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-size: cover;
    background-position: center;
    opacity: 0;
    animation: backgroundAnimation 10s infinite ease-in-out;
}

@keyframes backgroundAnimation {
    0%, 20% {
        background-image: url("image/bg2.jpg");
        opacity: 1;
    }
    25%, 45% {
        background-image: url("image/bg5.jpeg");
        opacity: 1;
    }
    50%, 70% {
        background-image: url("image/bg6.jpg");
        opacity: 1;
    }
    75%, 95% {
        background-image: url("image/bg13.jpg");
        opacity: 1;
    }
    100% {
        background-image: url("image/bg4.jpeg");
        opacity: 1;
    }
}


.slotbox{
height:400px;
background-color: aliceBlue;


}

</style>

<body >

     
    <header class="bg-primary text-white p-3" >
    <div class="container">
        <div class="row ">
            <!-- Left Logo -->
            <div class="col-md-2 d-flex">
                <img src="image/bilogo.jpg" alt="Bihar Logo" class="img-fluid" >
            </div>

            <!-- Center Text -->
            <div class="col-md-8 text-center">
                <h3 id="header-title" class="mb-1 fw-bold">Atmanirbhar Bihar Portal</h3>
                <h4 id="header-subtitle" class="mb-1">Banking Services of Bihar Government</h4>
                <h5 id="header-subline" class="mb-0">Government of Bihar, India Post Payments Bank, Department of Posts</h5>
            </div>

            <!-- Right Language Selector -->

            
             <div class="col-md-2 text-end p-0 m-0  align-items-center" style="width:100px;height:20px; ">
             
                    <select class="form-select" id="language-select" style="font-size:15px; padding:1px 2px;align:right; margin-left:130px">
                        <option value="en" selected>English</option>
                        <option value="hi">हिन्दी</option>
                    </select>
                     <div><img src="image/ajadi.png" style="mix-blend-mode: multiply;width:200px; height:60px;margin-top:2px"></div>
                     
            
                </div>
               
        </div>
    </div>
</header>
    
    
  <div class="bg-container">
    <img src="image/bg9.jpg" style="height: 280px; width: 100%;">
</div>
    <%@ include file="HowWorks.jsp" %>
    <%@ include file="services.jsp" %>
    
  <div class="slotbox">
  <div class="container mt-2" id="cardsbox">
    <div class="row text-center">
      <h2 class="mb-1 pb-1" style="font-weight: bold; padding-top: 30px;">Book Bank Slots | 
        <span style="font-family: 'Noto Sans Devanagari', sans-serif;">बैंक स्लॉट बुक करें</span>
      </h2>
      <p class="text-muted mb-4" style="font-size: 1.1rem;">
        Reserve your visit easily and avoid waiting in queues. |
        <span style="font-family: 'Noto Sans Devanagari', sans-serif;">अपना स्लॉट बुक करें और लंबी लाइनों से बचें।</span>
      </p>

      <!-- Deposit Card -->
      <div class="col-md-4 mb-4">
        <div class="card p-4 shadow rounded text-white" style="background-color: #28a745; box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);">
          <img src="image/deposit.jpg" alt="Deposit Slot" class="img-fluid mx-auto mb-3" style="max-width: 70px;">
          <h5 class="fw-bold">Cash Deposit Slot Booking</h5>
          <p class="fw-semibold small">Only for depositing cash at the branch</p>
          <p class="fw-semibold small" style="font-family: 'Noto Sans Devanagari', sans-serif;">केवल नकद जमा के लिए स्लॉट</p>
          <a href="Bookingdeposit.jsp" class="btn btn-dark mt-2">Click Here</a>
        </div>
      </div>

      <!-- Withdrawal Card -->
      <div class="col-md-4 mb-4">
        <div class="card p-4 shadow rounded text-dark" style="background-color: #ffc107; box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);">
          <img src="image/withd.jpg" alt="Withdrawal Slot" class="img-fluid mx-auto mb-3" style="max-width: 80px;">
          <h5 class="fw-bold">Cash Withdrawal Slot Booking</h5>
          <p class="fw-semibold small">Only for withdrawing cash from the bank</p>
          <p class="fw-semibold small" style="font-family: 'Noto Sans Devanagari', sans-serif;">केवल नकद निकासी के लिए स्लॉट</p>
          <a href="Withdrawal.jsp" class="btn btn-dark mt-2">Click Here</a>
        </div>
      </div>

      <!-- Document Verification Card -->
      <div class="col-md-4 mb-4">
        <div class="card p-4 shadow rounded text-white" style="background-color: #8000ff; box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);">
          <img src="image/docu.jpg" alt="Document Verification Slot" class="img-fluid mx-auto mb-3" style="max-width: 80px;">
          <h5 class="fw-bold">Document Verification Slot Booking</h5>
          <p class="fw-semibold small">For KYC and document-related verifications</p>
          <p class="fw-semibold small" style="font-family: 'Noto Sans Devanagari', sans-serif;">दस्तावेज़ सत्यापन के लिए स्लॉट</p>
          <a href="DocuVerifi.jsp" class="btn btn-dark mt-2">Click Here</a>
        </div>
      </div>

    </div>
  </div>
</div>
  
    
    
     <%@ include file="FAQ.jsp" %>
     <%@ include file="contactus.jsp" %>
    <%@ include file="footer.jsp" %>
   
  <!--    <div class="container mt-4">
        <div class="row text-center">
           
           
          
            
            <div class="col-md-4">
                <div class="card p-3 shadow-lg bg-info">
                    <img src="cash_delivery.png" alt="Cash Delivery" class="img-fluid mx-auto" style="max-width: 80px;">
                    <h5 id="card3-title" class="mt-2">Cash Delivery at Home</h5>
                    <p id="card3-text">Only for Aadhaar linked accounts (Min Rs. 1000 & Max Rs. 10000)</p>
                    <a href="cashform.jsp" class="btn btn-dark">Click Here</a>
                </div>
            </div>
        </div>
        
    </div>  -->
    
   
   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <script>
    const translations = {
        en: {
        	 "nav-about": "About", "Atmanirbhar": "Atmanirbhar",
             "Bihar": "Bihar",
            "header-title": "Atmanirbhar Bihar Portal",
            "header-subtitle": "Banking Services of Bihar Government",
            "nav-home": "Home",
            "nav-loan": "Bank Loan",
            "nav-slot": "Book Bank Slot",
            "nav-postal": "Postal Bank Service",
            "nav-login": "Bank Slot Login",
            "nav-services": "Services",
            "nav-account": "Account",
            "nav-signup": "Sign Up",
            "nav-signin": "Sign In",
            "nav-senior": "Senior Citizen",
            "nav-common": "Common Citizen",
            "nav-signout": "Sign Out",
            "nav-admin": "Admin",
            "nav-register-admin": "Register Admin",
            "nav-login-admin": "Login Admin",
            "nav-contact": "ContactUs",
            "card1-title": "Apply for Bank Loan",
            "card1-text": "Under \"Bihar Interest Subvention Scheme\"",
            "card2-title": "Book Your Bank Slot Today",
            "card2-text": "Limited to Cash Deposit/Withdrawal only",
            "card3-title": "Cash Delivery at Home",
            "card3-text": "Only for Aadhaar linked accounts (Min Rs. 1000 & Max Rs. 10000)",
            "btn1": "Click Here",
            "btn2": "Click Here",
            "btn3": "Click Here",
            "header-subline":"Government of Bihar,Post Payments Bank,Department of Posts",
            "gov-bihar": "Government of Bihar",
            "ippb": "India Post Payments Bank",
            "dept-posts": "Department of Posts",
            "sidebar-subheader": "Slot Booking Portal",
	        "sidebar-notifications": "Current Notifications",
	        "sidebar-withdraw": "Withdraw Cash",
	        "sidebar-deposit": "Deposit Cash",
	        "sidebar-banking": "Other Banking Services",
	        "sidebar-slot": "Book a Slot",
	        "sidebar-support": "Contact Support",
	        "nav-admin": "Admin",
	        "nav-register-admin": "Register Admin",
	        "nav-login-admin": "Login Admin",
	        "nav-contact": "ContactUs",
	        "sidebar-header": "Central Bank of India",
	        "sidebar-subheader": "Slot Booking Portal",
	        "sidebar-notifications": "Current Notifications",
	        "sidebar-withdraw": "Withdraw Cash",
	        "sidebar-deposit": "Deposit Cash",
	        "sidebar-banking": "Other Banking Services",
	        "sidebar-slot": "Book a Slot",
	        "sidebar-support": "Contact Support",
	        "registerAdminTitle": "Register Admin",
	        "label-branchCode": "Bank Branch Code",
	        "label-employeeId": "Employee ID",
	        "label-adminEmail": "Email",
	        "label-adminPassword": "Password",
	        "label-captcha": "Captcha",
	        "registerAdminButton": "Register",
	        "adminLoginTitle": "Admin Login",
	        "adminLoginButton": "Login",
	        "signupTitle": "Create an Account",
	        "loginText": "If already registered? Login here",
	        "seniorLoginTitle": "Senior Citizen Login",
	        "commonLoginTitle": "Common Citizen Login",
	       
	        "label-contactName": "Name",
	        "label-contactEmail": "Email",
	        "label-contactMessage": "Message",
	        "contactButton": "Send Message",
	        "sidebar-banking": "Other Banking Services",
	        "sidebar-slot": "Book a Slot",
	        "sidebar-support": "Contact Support",
	        "footer-copyright": "© 2025 Government of Bihar",
	        "footer-powered": "Powered by Department of Information Technology, Bihar",
	        "footer-visitor": "Visitor Count:",
	        "card1-title": "Book Your Bank Slot Today",
	        "card1-text": "Limited to Cash Deposit only",
	        "card1-button": "Click Here",

	        "card2-title": "Book Your Bank Slot Today",
	        "card2-text": "Limited to Cash Withdrawal only",
	        "card2-button": "Click Here",

	        "card3-title": "Book Your Bank Slot Today",
	        "card3-text": "Documents Verification only",
	        "card3-button": "Click Here",
	        "nav-slots":"Slots",
	    
        },
        hi: {
        	 "Atmanirbhar": "आत्मनिर्भर",
             "Bihar": "बिहार",
             "nav-about": "के बारे में",
            "header-title": "आत्मनिर्भर बिहार पोर्टल",
            "header-subtitle": "बिहार सरकार की बैंकिंग सेवाएं",
           
            "nav-home": "होम",
            "nav-loan": "बैंक ऋण",
            "nav-slot": "बुक बैंक स्लॉट",
            "nav-postal": "पोस्टल बैंक सेवा",
            "nav-login": "बैंक स्लॉट लॉग इन",
            "nav-services": "सेवाएं",
            "nav-account": "खाता",
            "nav-signup": "साइन अप",
            "nav-signin": "साइन इन",
            "nav-senior": "वरिष्ठ नागरिक",
            "nav-common": "सामान्य नागरिक",
            "nav-signout": "साइन आउट",
            "nav-admin": "प्रशासन",
            "nav-register-admin": "प्रशासन पंजीकरण",
            "nav-login-admin": "प्रशासन लॉगिन",
            "nav-contact": "संपर्क करें",
            "card1-title": "बैंक ऋण के लिए आवेदन करें",
            "card1-text": "बिहार ब्याज अनुदान योजना के अंतर्गत",
            "card2-title": "आज ही अपना बैंक स्लॉट बुक करें",
            "card2-text": "केवल नकद जमा/निकासी के लिए सीमित",
            "card3-title": "घर पर नकद वितरण",
            "card3-text": "केवल आधार लिंक्ड खातों के लिए (न्यूनतम ₹1000 और अधिकतम ₹10000)",
            "btn1": "यहां क्लिक करें",
            "btn2": "यहां क्लिक करें",
            "btn3": "यहां क्लिक करें",
            "header-subline":"बिहार सरकार,इंडिया पोस्ट पेमेंट्स बैंक,डाक विभाग",
            "gov-bihar": "बिहार सरकार",
            "ippb": "इंडिया पोस्ट पेमेंट्स बैंक",
            "dept-posts": "डाक विभाग",

	        "sidebar-subheader": "स्लॉट बुकिंग पोर्टल",
	        "sidebar-notifications": "वर्तमान सूचनाएं",
	        "sidebar-withdraw": "नकद निकालें",
	        "sidebar-deposit": "नकद जमा करें",
	        "sidebar-banking": "अन्य बैंकिंग सेवाएं",
	        "sidebar-slot": "स्लॉट बुक करें",
	        "sidebar-support": "संपर्क सहायता",
	        
	        "nav-admin": "प्रशासक",
	        "nav-register-admin": "प्रशासक पंजीकरण",
	        "nav-login-admin": "प्रशासक लॉगिन",
	        "nav-contact": "संपर्क करें",
	        "sidebar-header": "सेंट्रल बैंक ऑफ इंडिया",
	        "sidebar-subheader": "स्लॉट बुकिंग पोर्टल",
	        "sidebar-notifications": "वर्तमान सूचनाएं",
	        "sidebar-withdraw": "नकद निकालें",
	        "sidebar-deposit": "नकद जमा करें",
	        "sidebar-banking": "अन्य बैंकिंग सेवाएं",
	        "sidebar-slot": "स्लॉट बुक करें",
	        "sidebar-support": "संपर्क सहायता",
	        "registerAdminTitle": "प्रशासक पंजीकरण",
	        "label-branchCode": "बैंक शाखा कोड",
	        "label-employeeId": "कर्मचारी आईडी",
	        "label-adminEmail": "ईमेल",
	        "label-adminPassword": "पासवर्ड",
	        "label-captcha": "कैप्चा",
	        "registerAdminButton": "पंजीकरण करें",
	        "adminLoginTitle": "प्रशासक लॉगिन",
	        "adminLoginButton": "लॉगिन करें",
	        "signupTitle": "खाता बनाएँ",
	        "loginText": "यदि पहले से पंजीकृत हैं? यहां लॉगिन करें",
	        "seniorLoginTitle": "वरिष्ठ नागरिक लॉगिन",
	        "commonLoginTitle": "सामान्य नागरिक लॉगिन",
	        "contactTitle": "संपर्क करें",
	        "label-contactName": "नाम",
	        "label-contactEmail": "ईमेल",
	        "label-contactMessage": "संदेश",
	        "contactButton": "संदेश भेजें",
	        
	        "sidebar-banking": "अन्य बैंकिंग सेवाएं",
	        "sidebar-slot": "स्लॉट बुक करें",
	        "sidebar-support": "संपर्क सहायता",
	        "footer-copyright": "© 2025 बिहार सरकार",
	        "footer-powered": "सूचना प्रौद्योगिकी विभाग, बिहार द्वारा संचालित",
	        "footer-visitor": "आगंतुक संख्या:",
	        "card1-title": "आज ही अपना बैंक स्लॉट बुक करें",
	        "card1-text": "केवल नकद जमा के लिए सीमित",
	        "card1-button": "यहाँ क्लिक करें",

	        "card2-title": "आज ही अपना बैंक स्लॉट बुक करें",
	        "card2-text": "केवल नकद निकासी के लिए सीमित",
	        "card2-button": "यहाँ क्लिक करें",

	        "card3-title": "आज ही अपना बैंक स्लॉट बुक करें",
	        "card3-text": "केवल दस्तावेज़ सत्यापन के लिए",
	        "card3-button": "यहाँ क्लिक करें",
	        "nav-slots": "स्लॉट्स",
        }
    };

    document.getElementById('language-select').addEventListener('change', function () {
        const selectedLang = this.value;
        Object.keys(translations[selectedLang]).forEach(id => {
            const element = document.getElementById(id);
            if (element) element.innerText = translations[selectedLang][id];
        });
    });
</script>
    
    

    <script src="translations.js"></script>

</body>
</html>
