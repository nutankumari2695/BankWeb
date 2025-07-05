<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Bank Slot</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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

        .container{
        margin-top:85px;
        }
        .form-container {
        
            max-width: 800px;
            margin: 40px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
           box-shadow: 0px 0px 6px rgba(0, 0, 0, 0.3);
           
        }
        .form-header {
            background: #198754;
            color: white;
            padding: 10px;
            border-radius: 8px 8px 0 0;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        .form-group label {
            font-weight: bold;
        }
        
         .note-box {
          background: #fff3cd;
            border-left: 5px solid #ffcc00;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            color: #856404;
         font-weight: bold;
     
        }
       
        
        /* Prevent footer from having extra space */
footer {
    position: relative;
    bottom: 0;
    width: 100%;
    margin-bottom:0;
    
}
        
        
        
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="form-container">
        <div class="form-header">Apply Slot For Cash Delivery</div>

        <div class="note-box">
            Note: Please fill all the details carefully. This will affect the postal bank service.<br>
            नोट: कृपया सभी विवरण ध्यान से भरें। इससे डाक बैंक सेवा प्रभावित होगी।<br>
            Only for Aadhaar linked accounts (Min ₹1,000 & Max ₹10,000).<br>
            केवल आधार से जुड़े खातों के लिए (न्यूनतम ₹1,000 और अधिकतम ₹10,000)।
        </div>
        <form action="CashForm" method="post">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" class="form-control" placeholder="Please Enter Name" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Mobile <span class="text-danger">*</span></label>
                        <input type="tel" name="mobile" class="form-control" placeholder="Please Enter Mobile" required>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Father's Name <span class="text-danger">*</span></label>
                        <input type="text" name="fatherName" class="form-control" placeholder="Enter Father's Name" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Mother's Name <span class="text-danger">*</span></label>
                        <input type="text" name="motherName" class="form-control" placeholder="Enter Mother's Name" required>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Aadhaar Number <span class="text-danger">*</span></label>
                        <input type="text" name="aadhaar" class="form-control" placeholder="Enter 12-digit Aadhaar Number" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Date <span class="text-danger">*</span></label>
                        <input type="date" name="date" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
            
            <div class="col-md-6">
    <div class="form-group">
        <label for="ifscInput">IFSC Code <span class="text-danger">*</span></label>
        
        <!-- Input Field with Search & Manual Entry Option -->
        <input type="text" id="ifscInput" name="ifsc" class="form-control" 
               list="ifscList" placeholder="Search or Enter IFSC Code" required>

        <!-- Predefined IFSC Codes for Reference -->
        <datalist id="ifscList">
            <option value="PUNB0732200"></option>
            <option value="IDIB000M560"></option>
            <option value="CBIN0281036"></option>
            <option value="SBIN0010352"></option>
            <option value="CNRB0004571"></option>
            <option value="BKID0004672"></option>
        </datalist>
    </div>

   
</div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Amount (Max ₹10,000) <span class="text-danger">*</span></label>
                        <input type="number" name="amount" class="form-control" placeholder="Enter Amount" min="1000" max="10000" required>
                    </div>
                </div>
                
                
            
            </div>

            <button type="submit" class="btn btn-primary mt-4 w-10" style="background-color:#198754">Apply</button>
        </form>
    </div>
</div>

    

 <footer class="bg-dark text-white text-center p-3 mt-4">
        <p>&copy; 2025 Government of Bihar</p>
        <p>Powered by Department of Information Technology, Bihar</p>
        <p>Visitor Count: <span class="fw-bold">352502</span></p>
    </footer>

<script>
    function searchIFSC() {
        let ifscCode = document.getElementById("ifscInput").value.trim();
        if (ifscCode === "") {
            alert("Please enter or select an IFSC code.");
        } else {
            alert("Searching for IFSC: " + ifscCode);
            // You can replace this alert with an API call to fetch IFSC details
        }
    }
</script>

</body>
</html>
