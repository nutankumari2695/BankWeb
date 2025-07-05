

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
 * Servlet implementation class Cashform
 */
@WebServlet("/Cashform")
public class Cashform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cashform() {
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
        String fatherName = request.getParameter("fatherName");
        String motherName = request.getParameter("motherName");
        String mobile = request.getParameter("mobile");
        String aadhaar = request.getParameter("aadhaar");
        String date = request.getParameter("date");
        String amount = request.getParameter("amount");
        String ifsc = request.getParameter("ifsc");
        

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Validation rules
            if (!mobile.matches("^[0-9]{10}$")) {
                request.setAttribute("errorMessage", "❌ Invalid Mobile Number! It must be exactly 10 digits.");
                request.getRequestDispatcher("CashBooking.jsp").forward(request, response);
                return;
            }

            if (!aadhaar.matches("^[0-9]{12}$")) {
                request.setAttribute("errorMessage", "❌ Invalid Aadhaar Number! It must be exactly 12 digits.");
                request.getRequestDispatcher("CashBooking.jsp").forward(request, response);
                return;
            }

            int amt = Integer.parseInt(amount);
            if (amt < 1000 || amt > 10000) {
                request.setAttribute("errorMessage", "❌ Amount must be between ₹1,000 and ₹10,000.");
                request.getRequestDispatcher("CashBooking.jsp").forward(request, response);
                return;
            }

            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankSlotDB", "root", "yourpassword");

            // Check if the slot on the given date is already booked
            String checkSlotQuery = "SELECT COUNT(*) FROM cash_booking WHERE date = ?";
            pstmt = con.prepareStatement(checkSlotQuery);
            pstmt.setString(1, date);
            rs = pstmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                request.setAttribute("errorMessage", "❌ Slot for this date is already booked! Choose another date.");
                request.getRequestDispatcher("CashBooking.jsp").forward(request, response);
                return;
            }

            // Close previous PreparedStatement and ResultSet
            rs.close();
            pstmt.close();

            // Insert new booking
            String insertQuery = "INSERT INTO cash_booking (name, fatherName, motherName, mobile, aadhaar, date, amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, fatherName);
            pstmt.setString(3, motherName);
            pstmt.setString(4, mobile);
            pstmt.setString(5, aadhaar);
            pstmt.setString(6, date);
            pstmt.setInt(7, amt);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                request.setAttribute("successMessage", "✅ Slot booked successfully!");
                request.getRequestDispatcher("CashBooking.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "❌ Error while booking. Please try again.");
                request.getRequestDispatcher("CashBooking.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "❌ Database error: " + e.getMessage());
            request.getRequestDispatcher("CashBooking.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
		
		doGet(request, response);
	}

}
