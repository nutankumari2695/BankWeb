

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class forgotAdmin
 */
@WebServlet("/forgotAdmin")
public class forgotAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
        String branchCode = request.getParameter("branchCode");
        String employeeId = request.getParameter("employeeId");
        String adminEmail = request.getParameter("adminEmail");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (adminEmail == null || branchCode == null || employeeId == null || newPassword == null || confirmPassword == null ||
            adminEmail.trim().isEmpty() || branchCode.trim().isEmpty() || employeeId.trim().isEmpty() ||
            newPassword.trim().isEmpty() || confirmPassword.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("forgotAdmin.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("forgotAdmin.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankadmin", "root", "Kumari26@")) {
                String query = "SELECT * FROM registeradmin WHERE branchCode = ? AND employeeId = ? AND adminEmail = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, branchCode);
                ps.setString(2, employeeId);
                ps.setString(3, adminEmail);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String hashedPassword = hashPassword(newPassword);
                    String updateQuery = "UPDATE registeradmin SET adminPassword = ? WHERE branchCode = ? AND employeeId = ? AND adminEmail = ?";
                    PreparedStatement updatePs = con.prepareStatement(updateQuery);
                    updatePs.setString(1, hashedPassword);
                    updatePs.setString(2, branchCode);
                    updatePs.setString(3, employeeId);
                    updatePs.setString(4, adminEmail);

                    int result = updatePs.executeUpdate();
                    if (result > 0) {
                        request.setAttribute("successMessage", "Password reset successful. You can now login.");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Password reset failed. Try again.");
                        request.getRequestDispatcher("forgotAdmin.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage", "Invalid details! Please check your credentials.");
                    request.getRequestDispatcher("forgotAdmin.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("forgotAdmin.jsp").forward(request, response);
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
		
	}

}
