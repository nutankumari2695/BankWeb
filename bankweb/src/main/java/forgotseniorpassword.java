

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class forgotseniorpassword
 */
@WebServlet("/forgotseniorpassword")
public class forgotseniorpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotseniorpassword() {
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
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        // Retrieve user input
	        String email = request.getParameter("email");
	        String aadhaarNo = request.getParameter("aadhaarNo");
	        String newPassword = request.getParameter("newPassword");
	        String confirmPassword = request.getParameter("confirmPassword");

	        // Debugging logs
	        System.out.println("DEBUG: Email=" + email + ", Aadhaar=" + aadhaarNo);

	        if (email == null || aadhaarNo == null || newPassword == null || confirmPassword == null) {
	            out.print("<h3 style='color:red;'>Missing required fields. Please fill all inputs.</h3>");
	            request.getRequestDispatcher("/forgot-password.jsp").include(request, response);
	            return;
	        }

	        // Trim input values
	        email = email.trim();
	        aadhaarNo = aadhaarNo.trim();
	        newPassword = newPassword.trim();
	        confirmPassword = confirmPassword.trim();

	        // Check if passwords match
	        if (!newPassword.equals(confirmPassword)) {
	            out.print("<h3 style='color:red;'>Passwords do not match. Please try again.</h3>");
	            request.getRequestDispatcher("/forgot-password.jsp").include(request, response);
	            return;
	        }

	        try {
	            // Database connection
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/centralbankdb", "root", "Kumari26@");

	            // Check if the user exists
	            PreparedStatement checkUser = con.prepareStatement("SELECT * FROM register WHERE email=? AND aadhaarNo=?");
	            checkUser.setString(1, email);
	            checkUser.setString(2, aadhaarNo);
	            ResultSet rs = checkUser.executeQuery();

	            if (rs.next()) {
	                // Update the password
	                PreparedStatement updatePassword = con.prepareStatement("UPDATE register SET password=? WHERE email=? AND aadhaarNo=?");
	                updatePassword.setString(1, newPassword);
	                updatePassword.setString(2, email);
	                updatePassword.setString(3, aadhaarNo);

	                int updated = updatePassword.executeUpdate();
	                if (updated > 0) {
	                    out.print("<h3 style='color:green;'>Password updated successfully!</h3>");
	                    request.getRequestDispatcher("/login.jsp").include(request, response);
	                } else {
	                    out.print("<h3 style='color:red;'>Error updating password. Please try again.</h3>");
	                    request.getRequestDispatcher("/forgotpassword.jsp").include(request, response);
	                }
	            } else {
	                out.print("<h3 style='color:red;'>Invalid Email or Aadhaar Number.</h3>");
	                request.getRequestDispatcher("/forgotpassword.jsp").include(request, response);
	            }

	            con.close();
	        } catch (Exception e) {
	            out.print("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
	            e.printStackTrace();
	        }
		
		
		
		doGet(request, response);
	}

}
