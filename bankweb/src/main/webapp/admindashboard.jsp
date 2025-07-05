<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // Prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Session validation
    String adminEmail = (String) session.getAttribute("adminEmail");
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

    if (adminEmail == null || isAdmin == null || !isAdmin) {
        response.sendRedirect("main.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/adminDashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Bank Admin</a>
    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="logoutAdmin">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Sidebar -->
<div class="sidebar">
    <h3 class="text-center"> Dashboard</h3>
    <button class="btn btn-outline-light w-100 mb-2" onclick="showTab('users')"> Registered Users</button>
    <button class="btn btn-outline-light w-100 mb-2" onclick="showTab('senior')"> Senior Citizens</button>
    <button class="btn btn-outline-light w-100 mb-2" onclick="showTab('common')"> Common Citizens</button>
    <button class="btn btn-outline-light w-100 mb-2" onclick="showTab('deposit')"> Deposit Slots</button>
    <button class="btn btn-outline-light w-100 mb-2" onclick="showTab('withdrawal')">Withdrawal Slots</button>
    <button class="btn btn-outline-light w-100 mb-2" onclick="showTab('document')">Document Verifications</button>
</div>

<!-- Main Content -->
<div class="content">
    <h2 class="dashboard-title">Welcome to the Admin Dashboard</h2>

    
        <!-- Include all existing tabs content here (same as your provided code) -->
        <%-- Your Registered Users, Deposit, Withdrawal, Document Verifi and Senior tabs go here --%>
        <%@ include file="adminTables.jsp" %>
    
</div>

<script>
    function showTab(tabId) {
        const tabs = document.querySelectorAll('.tab-pane');
        tabs.forEach(tab => tab.classList.remove('show', 'active'));
        document.getElementById(tabId).classList.add('show', 'active');
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
