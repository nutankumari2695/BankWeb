<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container text-center">
        <h2>❌ Booking Failed</h2>
        <p><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "Something went wrong, please try again." %></p>
        <a href="index.jsp" class="btn btn-danger">Go Back</a>
    </div>
</body>
</html>
