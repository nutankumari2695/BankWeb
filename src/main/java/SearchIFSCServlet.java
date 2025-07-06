

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
 * Servlet implementation class SearchIFSCServlet
 */
@WebServlet("/searchIFSC")
public class SearchIFSCServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIFSCServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String ifscCode = request.getParameter("ifsc");  // Get the IFSC code from the request
        
        // Set the content type to HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankSlotDB", "root", "Kumari26@");

            // Updated sorting logic to prioritize today/future then past
            String query = "SELECT * FROM withdrawalbooking " +
                           "WHERE ifsc = ? " +
                           "ORDER BY " +
                           "  CASE WHEN date >= CURDATE() THEN 0 ELSE 1 END, " +
                           "  date ASC, " +
                           "  STR_TO_DATE(slot, '%h:%i %p') ASC, " +
                           "  created_at ASC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, ifscCode);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("parentname") + "</td>");
                out.println("<td>" + rs.getString("mobile") + "</td>");
                out.println("<td>" + rs.getString("aadhaar") + "</td>");
                out.println("<td>" + rs.getString("ifsc") + "</td>");
                out.println("<td>" + rs.getString("date") + "</td>");
                out.println("<td>" + rs.getString("slot") + "</td>");
                out.println("<td>" + rs.getTimestamp("created_at") + "</td>");
                out.println("</tr>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
        }


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
