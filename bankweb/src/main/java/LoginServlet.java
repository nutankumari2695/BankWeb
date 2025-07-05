import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
//import DBConnection.java;
//import com.utils.DBConnection; // if you use a package


public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("citizentype");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
//        	 DBConnection.getConnection();
        	 Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/centralbankdb", "root", "Kumari26@");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM register WHERE email = ? AND password = ? AND user_type = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, type);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", email);
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().println("Invalid credentials!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
