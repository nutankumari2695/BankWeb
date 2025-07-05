<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <div class="alert alert-danger"><%= errorMessage %></div>
<% } %>

<% String successMessage = (String) request.getAttribute("successMessage"); %>
<% if (successMessage != null) { %>
    <div class="alert alert-success"><%= successMessage %></div>
<% } %>
