const translations = {
    en: {
        "nav-about": "About", "Atmanirbhar": "Atmanirbhar",
        "Bihar": "Bihar",
        "header-title": "Atmanirbhar Bihar Portal",
        "header-subtitle": "Financial and Banking Services of Bihar Government",
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
        "nav-contact": "Contact Us",
        "card1-title": "Apply for Bank Loan",
        "card1-text": "Under \"Bihar Interest Subvention Scheme\"",
        "card2-title": "Book Your Bank Slot Today",
        "card2-text": "Limited to Cash Deposit/Withdrawal only",
        "card3-title": "Cash Delivery at Home",
        "card3-text": "Only for Aadhaar linked accounts (Min Rs. 1000 & Max Rs. 10000)",
        "btn1": "Click Here",
        "btn2": "Click Here",
        "btn3": "Click Here",
        "footer-copyright": "© 2025 Government of Bihar",
        "footer-powered": "Powered by Department of Information Technology, Bihar",
        "footer-visitor": "Visitor Count:"
    },
    hi: {
        "nav-about": "के बारे में", "Atmanirbhar": "आत्मनिर्भर",
        "Bihar": "बिहार",
        "header-title": "आत्मनिर्भर बिहार पोर्टल",
        "header-subtitle": "बिहार सरकार की वित्तीय और बैंकिंग सेवाएं",
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
        "footer-copyright": "© 2025 बिहार सरकार",
        "footer-powered": "सूचना प्रौद्योगिकी विभाग, बिहार द्वारा संचालित",
        "footer-visitor": "आगंतुक संख्या:"
    }
};

// Function to switch language
function switchLanguage(selectedLang) {
    Object.keys(translations[selectedLang]).forEach(id => {
        const element = document.getElementById(id);
        if (element) element.innerText = translations[selectedLang][id];
    });
}

// Export the function and translations object
export { translations, switchLanguage };
