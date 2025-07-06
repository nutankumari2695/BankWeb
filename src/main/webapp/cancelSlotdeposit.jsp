<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Booked Slot</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { background-color: #e3f2fd; }
        .container{
        margin-top:100px;
        
        }
        .form-container {
            max-width: 380px;
            margin: 20px auto;
            padding: 15px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-header {
            font-size: 20px;
            font-weight: bold;
            color: #007bff;
            text-align: center;
            margin-bottom: 10px;
        }
        .note-box {
            background: #fff3cd;
            padding: 8px;
            border-radius: 5px;
            font-size: 13px;
            margin-bottom: 10px;
        }
        .btn-container {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>
<div class="container">
    <div class="form-container">
        <div class="form-header">Cancel Booked Slot</div>
        <div class="note-box">
            <strong>Note:</strong> Enter details carefully to cancel your slot. Only valid bookings can be canceled.<br>
            <strong>नोट:</strong> कृपया अपनी जानकारी सावधानीपूर्वक दर्ज करें। केवल वैध बुकिंग रद्द की जा सकती है।
        </div>
        <form action="CancelSlotdeposit" method="post" onsubmit="return validateForm()">
            <div class="row mb-2">
                <div class="col-6">
                    <label class="form-label">Mobile Number:</label>
                </div>
                <div class="col-6 ">
                    <input type="tel" name="mobile" id="mobile" class="form-control" placeholder="Enter mobile number" required maxlength="10">
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-6">
                    <label class="form-label">Aadhaar Number:</label>
                </div>
                <div class="col-6">
                    <input type="text" name="aadhaar" id="aadhaar" class="form-control" placeholder="Enter aadhar number" required maxlength="12">
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-6">
                    <label class="form-label">Date:</label>
                </div>
                <div class="col-6">
                    <input type="date" name="date" class="form-control" required>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-6">
                    <label class="form-label">Slot:</label>
                </div>
                <div class="col-6">
                    <select name="slot" class="form-select" required>
                        <option value="">Choose</option>
                        <option value="10:00 AM">10:00 AM</option>
                        <option value="10:15 AM">10:15 AM</option>
                        <option value="10:30 AM">10:30 AM</option>
                        <option value="10:45 AM">10:45 AM</option>
                        <option value="11:00 AM">11:00 AM</option>
                        <option value="11:15 AM">11:15 AM</option>
                        <option value="11:30 AM">11:30 AM</option>
                        <option value="11:45 AM">11:45 AM</option>
                        <option value="12:00 PM">12:00 PM</option>
                        <option value="12:15 PM">12:15 PM</option>
                        <option value="12:30 PM">12:30 PM</option>
                        <option value="12:45 PM">12:45 PM</option>
                        <option value="02:00 PM">02:00 PM</option>
                        <option value="02:15 PM">02:15 PM</option>
                        <option value="02:30 PM">02:30 PM</option>
                        <option value="02:45 PM">02:45 PM</option>
                        <option value="03:00 PM">03:00 PM</option>
                        <option value="03:15 PM">03:15 PM</option>
                        <option value="03:30 PM">03:30 PM</option>
                        <option value="03:45 PM">03:45 PM</option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <label class="form-label">IFSC Code:</label>
                </div>
                <div class="col-6">
                    <input type="text" id="ifscInput" name="ifsc" class="form-control" list="ifscList" placeholder="Search IFSC" required>
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
            <div class="btn-container">
                <button type="submit" class="btn btn-primary">Cancel Slot</button>
            </div>
        </form>
    </div>
</div>
<script>
    function validateForm() {
        let mobile = document.getElementById('mobile').value;
        let aadhaar = document.getElementById('aadhaar').value;
        if (mobile.length !== 10 || isNaN(mobile)) {
            alert("Mobile number must be exactly 10 digits.");
            return false;
        }
        if (aadhaar.length !== 12 || isNaN(aadhaar)) {
            alert("Aadhaar number must be exactly 12 digits.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
