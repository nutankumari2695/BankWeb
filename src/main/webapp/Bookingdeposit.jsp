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
     #apply {
  background-color: #198754;
  color: white;
  border: none;
  transition: background-color 0.3s ease;
}

#apply:hover {
  background-color:#001f3f; /* blue on hover */
  color: white;
}

 #cancel{
  background-color: #dc3545;
  float: right;
  align:right;
  color: white;
  border: none;
  transition: background-color 0.3s ease;
}

#cancel:hover {
  background-color: #bb2d3b; /* dark red on hover */
  color: white;
}
        
 
        
    </style>
</head>
<body>


<%@ include file="navbar.jsp" %>

  

    <div class="container" >
    
    
    
        <div class="form-container">
            <div class="form-header">Apply Slot For Deposit </div>

            <div class="note-box">
                Note: Please fill all the details carefully. This will affect the slot allocation. <br>
                नोट: कृपया सभी विवरण ध्यान से भरें। यह स्लॉट आवंटन को प्रभावित करेगा।<br>
                Limited to cash Deposit/Withdrawal only.<br>
                केवल नकद जमा / निकासी के लिए सीमित।
            </div>

            <form action="Deposit" method="post">
            
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Name <span class="text-danger">*</span></label>
                            <input type="text" name="name" class="form-control" placeholder="Please Enter Name" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Father's/Mother's Name <span class="text-danger">*</span></label>
                            <input type="text" name="parentname" class="form-control" placeholder="Please Enter Father's or Mother's Name" required>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                  
  <div class="col-md-6">
        <div class="form-group">
            <label>Mobile <span class="text-danger">*</span></label>
            <input type="tel" name="mobile" id="mobile" class="form-control" placeholder="Please Enter Mobile" 
                   required maxlength="10">
            <div class="invalid-feedback">Mobile number must be exactly 10 digits.</div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label>Aadhaar Number <span class="text-danger">*</span></label>
            <input type="text" name="aadhaar" id="aadhaar" class="form-control" placeholder="Enter 12-digit Aadhaar Number" 
                   required maxlength="12">
            <div class="invalid-feedback">Aadhaar number must be exactly 12 digits.</div>
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
                            <label>Date <span class="text-danger">*</span></label>
                            <input type="date" name="date" class="form-control" required>
                            
                        </div>
                    </div>
                </div>

               <div class="row mt-3">
    <div class="col-md-6">
        <div class="form-group">
            <label>Available Slot <span class="text-danger">*</span></label>
            <select name="slot" class="form-select" required>
                <option value="">Choose One</option>
                 <option value="10:00 AM">10:00 AM</option>
			<option value="10:08 AM">10:08 AM</option>
			<option value="10:16 AM">10:16 AM</option>
			<option value="10:24 AM">10:24 AM</option>
			<option value="10:32 AM">10:32 AM</option>
			<option value="10:40 AM">10:40 AM</option>
			<option value="10:48 AM">10:48 AM</option>
			<option value="10:56 AM">10:56 AM</option>
			<option value="11:04 AM">11:04 AM</option>
			<option value="11:12 AM">11:12 AM</option>
			<option value="11:20 AM">11:20 AM</option>
			<option value="11:28 AM">11:28 AM</option>
			<option value="11:36 AM">11:36 AM</option>
			<option value="11:44 AM">11:44 AM</option>
			<option value="11:52 AM">11:52 AM</option>
			<option value="12:00 PM">12:00 PM</option>
			<option value="12:08 PM">12:08 PM</option>
			<option value="12:16 PM">12:16 PM</option>
			<option value="12:24 PM">12:24 PM</option>
			<option value="12:32 PM">12:32 PM</option>
			<option value="12:40 PM">12:40 PM</option>
			<option value="12:48 PM">12:48 PM</option>
			<option value="12:56 PM">12:56 PM</option>
			<!-- Lunch Break from 1:00 PM - 2:00 PM -->
			<option value="02:00 PM">02:00 PM</option>
			<option value="02:08 PM">02:08 PM</option>
			<option value="02:16 PM">02:16 PM</option>
			<option value="02:24 PM">02:24 PM</option>
			<option value="02:32 PM">02:32 PM</option>
			<option value="02:40 PM">02:40 PM</option>
			<option value="02:48 PM">02:48 PM</option>
			<option value="02:56 PM">02:56 PM</option>
			<option value="03:04 PM">03:04 PM</option>
			<option value="03:12 PM">03:12 PM</option>
			<option value="03:20 PM">03:20 PM</option>
			<option value="03:28 PM">03:28 PM</option>
			<option value="03:36 PM">03:36 PM</option>
			<option value="03:44 PM">03:44 PM</option>
			<option value="03:52 PM">03:52 PM</option>
            </select>
        </div>
    </div>
</div>
<tr>
  <th>
    <button type="submit" class="btn apply-btn"  id="apply">Apply</button>
  </th>
  <th class="text-end">
    <a href="cancelSlotdeposit.jsp" class="btn cancel-btn"  id="cancel">Cancel Slot</a>
  </th>
</tr>



<div style="background-color:#fff3cd; border-left: 6px solid #ffc107; padding: 16px; margin-bottom:20px; margin-top:10px; font-family: sans-serif;">
    <p style="margin: 0; font-weight: bold; color: #6c4f00;">
       Note: Cancel booked slot within 2 hours. 
        <br />
        <span style="font-weight: normal;"> नोट: बुक किए गए स्लॉट को केवल 2 घंटे के भीतर रद्द किया जा सकता है।</span>
    </p>
</div>

               
            </form>
        </div>
    </div>
    
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% String successMessage = (String) request.getAttribute("successMessage"); %>

<% if (errorMessage != null) { %>
    <div class="alert alert-danger"><%= errorMessage %></div>
<% } %>

<% if (successMessage != null) { %>
    <div class="alert alert-success"><%= successMessage %></div>
<% } %>
        
    
  
       <%@ include file="services.jsp" %>
    
     <%@ include file="HowWorks.jsp" %>
     <%@ include file="FAQ.jsp" %>
     <%@ include file="contactus.jsp" %>
    
    <%@ include file="footer.jsp" %>
    
    

 

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
