

import java.io.IOException;
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
 * Servlet implementation class Documentverifi 
 */
@WebServlet("/Documentverifi")
public class Documentverifi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Documentverifi() {
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
		
		
		   // Fetch form parameters
	    String name = request.getParameter("name");
	    String parentName = request.getParameter("parentname");
	    String mobile = request.getParameter("mobile");
	    String aadhaar = request.getParameter("aadhaar");
	    String worktype = request.getParameter("worktype");
	    String date = request.getParameter("date");
	    String slot = request.getParameter("slot");
	    String ifsc = request.getParameter("ifsc");

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        // Validation rules
	        if (!mobile.matches("^[0-9]{10}$")) {
	            request.setAttribute("errorMessage", "❌ Invalid Mobile Number! It must be exactly 10 digits.");
	            request.getRequestDispatcher("DocuVerifi.jsp").forward(request, response);
	            return;
	        }

	        if (!aadhaar.matches("^[0-9]{12}$")) {
	            request.setAttribute("errorMessage", "❌ Invalid Aadhaar Number! It must be exactly 12 digits.");
	            request.getRequestDispatcher("DocuVerifi.jsp").forward(request, response);
	            return;
	        }

	       

	        // Database connection
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankSlotDB", "root", "Kumari26@");

	        // Check if the slot on the given date is already booked
	        String checkSlotQuery = "SELECT COUNT(*) FROM documentverifi  WHERE date = ? AND slot = ?  AND ifsc = ?";
	        pstmt = con.prepareStatement(checkSlotQuery);
	        pstmt.setString(1, date);
	        pstmt.setString(2, slot);
	        pstmt.setString(3,ifsc);
	       
	        rs = pstmt.executeQuery();

	        if (rs.next() && rs.getInt(1) > 0) {
	            request.setAttribute("errorMessage", "❌ This slot has already been booked! Please choose a different time slot.");
	            request.getRequestDispatcher("DocuVerifi.jsp").forward(request, response);
	            return;
	        }

	        // Close the previous PreparedStatement and ResultSet before reuse
	        rs.close();
	        pstmt.close();

	        // Insert new slot booking
	        String insertQuery = "INSERT INTO documentverifi  (name, parentname, mobile, aadhaar, worktype, date, slot,ifsc) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
	        pstmt = con.prepareStatement(insertQuery);
	        pstmt.setString(1, name);
	        pstmt.setString(2, parentName);
	        pstmt.setString(3, mobile);
	        pstmt.setString(4, aadhaar);
	        pstmt.setString(5, worktype);
	        pstmt.setString(6, date);
	        pstmt.setString(7, slot);
	        pstmt.setString(8, ifsc);
	        
	        int rows = pstmt.executeUpdate();
            if (rows > 0) {
                request.setAttribute("successMessage", "✅ Slot booked successfully!");
                request.getRequestDispatcher("DocuVerifi.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "❌ An error occurred while booking your slot. Please try again.");
                request.getRequestDispatcher("DocuVerifi.jsp").forward(request, response);
            }

	     

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "❌ Database error: " + e.getMessage());
	        request.getRequestDispatcher("DocuVerifi.jsp").forward(request, response);
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	}

}
