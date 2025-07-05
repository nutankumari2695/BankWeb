
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterAdmin
 */
@WebServlet("/RegisterAdmin")
public class RegisterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public class HashUtil {
        public static String hashPassword(String password) {
            try {
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                md.update(password.getBytes());
                byte[] byteData = md.digest();

                // Convert byte array into hex string
                StringBuilder hexString = new StringBuilder();
                for (byte b : byteData) {
                    hexString.append(String.format("%02x", b));
                }
                return hexString.toString();
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException("Error hashing password", e);
            }
        }
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
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        // Retrieve form data
	        String branchCode = request.getParameter("branchCode").trim();
	        String employeeId = request.getParameter("employeeId").trim();
	        String adminEmail = request.getParameter("adminEmail").trim();
	        String adminPassword = request.getParameter("adminPassword").trim();
	        String enteredCaptcha = request.getParameter("captcha");

	        // CAPTCHA Validation
	        HttpSession session = request.getSession();
	        String generatedCaptcha = (String) session.getAttribute("captcha");
	        if (generatedCaptcha == null || !enteredCaptcha.equals(generatedCaptcha)) {
	            request.setAttribute("errorMessage", "Invalid CAPTCHA! Please try again.");
	            request.getRequestDispatcher("main.jsp").forward(request, response);
	            return;
	        }

	        // Validate Branch Code & Employee ID (Only uppercase letters and numbers)
	        if (!branchCode.matches("^[A-Z0-9]+$") || !employeeId.matches("^[A-Z0-9]+$")) {
	            request.setAttribute("errorMessage", "Invalid Branch Code or Employee ID! Only uppercase letters and numbers allowed.");
	            request.getRequestDispatcher("main.jsp").forward(request, response);
	            return;
	        }

	        // Validate Email Format
	        if (!adminEmail.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
	            request.setAttribute("errorMessage", "Invalid email format. Please enter a valid email.");
	            request.getRequestDispatcher("main.jsp").forward(request, response);
	            return;
	        }

	        try {
	            // Load JDBC Driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankadmin", "root", "Kumari26@")) {

	                // Check if admin already exists
	                String checkQuery = "SELECT * FROM registeradmin WHERE branchCode = ? OR employeeId = ? OR adminEmail = ?";
	                try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
	                    checkStmt.setString(1, branchCode);
	                    checkStmt.setString(2, employeeId);
	                    checkStmt.setString(3, adminEmail);
	                    ResultSet rs = checkStmt.executeQuery();

	                    if (rs.next()) {
	                        request.setAttribute("errorMessage", "Admin with the same Branch Code, Employee ID, or Email already exists!");
	                        request.getRequestDispatcher("main.jsp").forward(request, response);
	                        return;
	                    }
	                }
	             // Insert new admin
	                String insertQuery = "INSERT INTO registeradmin (branchCode, employeeId, adminEmail, adminPassword) VALUES (?, ?, ?, ?)";

	                try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
	                    insertStmt.setString(1, branchCode);
	                    insertStmt.setString(2, employeeId);
	                    insertStmt.setString(3, adminEmail);
	                    insertStmt.setString(4, adminPassword); // You should hash passwords in production

	                    int rowsInserted = insertStmt.executeUpdate();

	                    if (rowsInserted > 0) {
	                        // Redirect to main.jsp with success message
	                        response.sendRedirect("main.jsp?message=Admin registered successfully!");
	                       return;
	                        
	                    } else {
	                        // Redirect with error message
	                        response.sendRedirect("main.jsp?error=Registration failed! Try again.");
	                        return;
	                    }
	                } catch (Exception e) {
	                    e.printStackTrace();
	                    // Redirect with exception error message (encoded to be URL safe)
	                    response.sendRedirect("main.jsp?error=" + java.net.URLEncoder.encode("Database error: " + e.getMessage(), "UTF-8"));
	                    return;
	                }

	            } // <--- Closes the try-with-resources block for Connection
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("main.jsp?error=" + java.net.URLEncoder.encode("Database error: " + e.getMessage(), "UTF-8"));
	            return;
	        }
	} // <--- ✅ Closes the doPost method
} // <--- ✅ Closes the RegisterAdmin servlet class
	                    
	                    
	                    
	          
	               
	               
	            
	        


