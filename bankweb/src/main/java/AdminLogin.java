

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
	// Regular Expressions for Validation
    private static final Pattern BRANCH_CODE_PATTERN = Pattern.compile("^[A-Z0-9]+$");
    private static final Pattern EMPLOYEE_ID_PATTERN = Pattern.compile("^[A-Z0-9]+$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");

	
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public class HashUtil {
        public static String hashPassword(String password) {
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
		
		response.setContentType("text/html");

        // Retrieve form parameters
        String branchCode = request.getParameter("branchCode");
        String employeeId = request.getParameter("employeeId");
        String adminEmail = request.getParameter("adminEmail");
        String adminPassword = request.getParameter("adminPassword");

        System.out.println("DEBUG: Received Inputs - BranchCode=" + branchCode + ", EmployeeId=" + employeeId + ", AdminEmail=" + adminEmail +",adminPassword=" + adminPassword);

        // Validate input fields
        if (branchCode == null || employeeId == null || adminEmail == null || adminPassword == null ||
            branchCode.trim().isEmpty() || employeeId.trim().isEmpty() || adminEmail.trim().isEmpty() || adminPassword.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("main.jsp").forward(request, response);
            return;
        }

        // Trim and format input values
        branchCode = branchCode.trim().toUpperCase();
        employeeId = employeeId.trim().toUpperCase();
        adminEmail = adminEmail.trim().toLowerCase();
        adminPassword = adminPassword.trim();

        // Validate input formats
        if (!BRANCH_CODE_PATTERN.matcher(branchCode).matches() || !EMPLOYEE_ID_PATTERN.matcher(employeeId).matches() || !EMAIL_PATTERN.matcher(adminEmail).matches()) {
            request.setAttribute("errorMessage", "Invalid input format! Check Branch Code, Employee ID, or Email.");
            request.getRequestDispatcher("main.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankadmin", "root", "Kumari26@");
                 PreparedStatement ps = con.prepareStatement("SELECT adminPassword FROM registeradmin WHERE branchCode = ? AND employeeId = ? AND adminEmail = ?")) {

                ps.setString(1, branchCode);
                ps.setString(2, employeeId);
                ps.setString(3, adminEmail);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String storedPassword = rs.getString("adminPassword");

                    if (storedPassword.equals(adminPassword)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("isAdmin", true);
                        session.setAttribute("adminEmail", adminEmail);
                        response.sendRedirect("admindashboard.jsp");
                        System.out.println("Login success from DB...");
                    } else {
                        request.setAttribute("errorMessage", "Invalid Password.");
                        request.getRequestDispatcher("main.jsp").forward(request, response);
                        System.out.println("invalid password");
                    }
                } else {
                    request.setAttribute("errorMessage", "Invalid Branch Code, Employee ID, or Email.");
                    request.getRequestDispatcher("main.jsp").forward(request, response);
                    System.out.println("invalid code....");
                }
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Database Error: " + e.getMessage());
            e.printStackTrace();
            request.getRequestDispatcher("main.jsp").forward(request, response);
        }
	}
}


