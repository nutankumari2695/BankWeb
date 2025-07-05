

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CancleSlotdocument
 */
@WebServlet("/CancleSlotdocument")
public class CancelSlotdocument extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelSlotdocument() {
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
		

		  String mobile = request.getParameter("mobile");
	        String aadhaar = request.getParameter("aadhaar");
	        String date = request.getParameter("date");
	        String slot = request.getParameter("slot");
	        String ifsc = request.getParameter("ifsc");
	        

	        Connection conn = null;
	        PreparedStatement stmt = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankSlotDB", "root", "Kumari26@");

	            // Check if slot exists
	            String checkQuery = "SELECT * FROM documentverifi WHERE mobile = ? AND aadhaar = ? AND date = ? AND slot = ? AND ifsc = ?";
	            stmt = conn.prepareStatement(checkQuery);
	            stmt.setString(1, mobile);
	            stmt.setString(2, aadhaar);
	            stmt.setString(3, date);
	            stmt.setString(4, slot);
	            stmt.setString(5, ifsc);
	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	                // Cancel the slot
	                String deleteQuery = "DELETE FROM documentverifi WHERE mobile = ? AND aadhaar = ? AND date = ? AND slot = ? AND ifsc = ?";
	                stmt = conn.prepareStatement(deleteQuery);
	                stmt.setString(1, mobile);
	                stmt.setString(2, aadhaar);
	                stmt.setString(3, date);
	                stmt.setString(4, slot);
	                stmt.setString(5, ifsc);
	                int rows = stmt.executeUpdate();

	                if (rows > 0) {
	                    response.sendRedirect("cancelSlotdocument.jsp?message=Slot Canceled Successfully");
	                } else {
	                    response.sendRedirect("cancelSlotdocument.jsp?message=Cancellation Failed");
	                }
	            } else {
	                response.sendRedirect("cancelSlotdocument.jsp?message=No Booking Found");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("cancelSlotdocument.jsp?message=Error Occurred");
	        } finally {
	            try {
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
		
		doGet(request, response);
		
	}

}
