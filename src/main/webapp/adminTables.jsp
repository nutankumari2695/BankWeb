<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="tab-content" id="myTabContent">
            <!-- Registered Users -->
            <div class="tab-pane fade show active" id="users">
                <h4 class="mt-3">Registered Users</h4>
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Name</th><th>Email</th><th>Age</th><th>Gender</th><th>Type</th><th>Aadhaar</th><th>File</th><th>Created At</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/centralbankdb", "root", "Kumari26@");
                            PreparedStatement ps = conn.prepareStatement("SELECT * FROM register");
                            ResultSet rs = ps.executeQuery();
                            while(rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getInt("age") %></td>
                            <td><%= rs.getString("gender") %></td>
                            <td><%= rs.getString("type") %></td>
                            <td><%= rs.getString("aadhaarNo") %></td>
                            <td><%= rs.getString("fileName") %></td>
                            <td><%= rs.getTimestamp("created_at") %></td>
                        </tr>
                    <%
                            }
                            conn.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- Deposit Booking -->
            <!-- Deposit Booking -->
<div class="tab-pane fade" id="deposit">
    <div class="d-flex justify-content-between align-items-center mt-3 mb-2">
        <h4 class="m-0">Deposit Slot Bookings</h4>
        <!-- IFSC Code Search Bar -->
        <form id="depositSearchForm" class="d-flex" onsubmit="event.preventDefault(); searchDepositIFSC();">
            <input id="depositIfscInput" class="form-control me-2" type="search" placeholder="Search IFSC Code" aria-label="Search">
            <button class="btn btn-outline-dark" type="submit">
                <i class="bi bi-search"></i>
            </button>
        </form>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Name</th><th>Parent</th><th>Mobile</th><th>Aadhaar</th><th>IFSC</th><th>Date</th><th>Slot</th><th>Created At</th>
            </tr>
        </thead>
        <tbody id="depositBookingTableBody">
            <!-- Fetched dynamically via AJAX -->
        </tbody>
    </table>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Attach event listener after DOM is fully loaded
        var depositInput = document.getElementById("depositIfscInput");
        
        if (depositInput) {
            depositInput.addEventListener("keypress", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    searchDepositIFSC();
                }
            });
        }
    });

    function searchDepositIFSC() {
        var ifscCode = document.getElementById("depositIfscInput").value.trim();

        if (ifscCode === "") {
            alert("Please enter a valid IFSC code.");
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "searchDepositIFSC?ifsc=" + ifscCode, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("depositBookingTableBody").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
</script>

            
           
   <!-- Withdrawal Booking -->
<div class="tab-pane fade" id="withdrawal">
    <div class="d-flex justify-content-between align-items-center mt-3 mb-2">
        <h4 class="m-0">Withdrawal Slot Bookings</h4>
        <!-- IFSC Code Search Bar -->
        <form id="searchForm" class="d-flex" onsubmit="event.preventDefault(); searchIFSC();">
            <input id="ifscInput" class="form-control me-2" type="search" name="ifsc" placeholder="Search IFSC Code" aria-label="Search">
            <button id="searchBtn" class="btn btn-outline-dark" type="submit">
                <i class="bi bi-search"></i> <!-- Search icon -->
            </button>
        </form>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Name</th><th>Parent</th><th>Mobile</th><th>Aadhaar</th><th>IFSC</th><th>Date</th><th>Slot</th><th>Created At</th>
            </tr>
        </thead>
        <tbody id="bookingTableBody">
        <!-- Dynamic content will be inserted here -->
        </tbody>
    </table>
</div>

<script>
    // Function to perform AJAX request
    function searchIFSC() {
        var ifscCode = document.getElementById("ifscInput").value.trim();

        if (ifscCode === "") {
            alert("Please enter a valid IFSC code.");
            return;
        }

        // Create XMLHttpRequest object
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "searchIFSC?ifsc=" + ifscCode, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Update the table body with the response
                document.getElementById("bookingTableBody").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }

    // Event listener for "Enter" key press to trigger search
    document.getElementById("ifscInput").addEventListener("keypress", function(event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Prevent form submission
            searchIFSC(); // Call the search function
        }
    });
</script>
   
     <!-- Document Verification Booking -->
<div class="tab-pane fade" id="document">
    <div class="d-flex justify-content-between align-items-center mt-3 mb-2">
        <h4 class="m-0">Document Verification Bookings</h4>
        <!-- IFSC Code Search Bar -->
        <form id="docSearchForm" class="d-flex" onsubmit="event.preventDefault(); searchDocumentIFSC();">
            <input id="docIfscInput" class="form-control me-2" type="search" name="ifsc" placeholder="Search IFSC Code" aria-label="Search">
             <button class="btn btn-outline-dark" type="submit">
                <i class="bi bi-search"></i>
            </button> 
        </form>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Name</th><th>Parent</th><th>Mobile</th><th>Aadhaar</th><th>Work Type</th><th>Date</th><th>Slot</th><th>IFSC</th><th>Created At</th>
            </tr>
        </thead>
        <tbody id="documentBookingTableBody">
            <!-- Fallback/default data (optional) or loaded via AJAX -->
        </tbody>
    </table>
</div>

<script>
    function searchDocumentIFSC() {
        var ifscCode = document.getElementById("docIfscInput").value.trim();

        if (ifscCode === "") {
            alert("Please enter a valid IFSC code.");
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "searchDocumentIFSC?ifsc=" + ifscCode, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("documentBookingTableBody").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }

    // Trigger search on Enter key
    document.getElementById("docIfscInput").addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            searchDocumentIFSC();
        }
    });
</script>
     
           
            
             <!-- Senior Registered Users Table -->
             <div class="tab-pane fade" id="senior">
<h4 class="mt-4">Senior Registered Users</h4>
<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>Name</th><th>Email</th><th>Age</th><th>Gender</th><th>Aadhaar</th><th>File</th><th>Created At</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/centralbankdb", "root", "Kumari26@");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM seniorregister");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getInt("age") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("aadhaarNo") %></td>
                <td><%= rs.getString("fileName") %></td>
                 <td><%= rs.getTimestamp("created_at") %></td>
            </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </tbody>
</table>
        
        </div>
        
        
             <!-- Common Registered Users Table -->
             <div class="tab-pane fade" id="common">
<h4 class="mt-4">Common Registered Users</h4>
<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>Name</th><th>Email</th><th>Age</th><th>Gender</th><th>Aadhaar</th><th>File</th><th>Created At</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/centralbankdb", "root", "Kumari26@");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM commonregister");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getInt("age") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("aadhaarNo") %></td>
                <td><%= rs.getString("fileName") %></td>
                 <td><%= rs.getTimestamp("created_at") %></td>
            </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </tbody>
</table>
        
        </div>
        
        </div>
        

</body>
</html>