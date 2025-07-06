import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/Logincommon")
public class Logincommon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Logincommon() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optionally forward to login.jsp if someone tries GET
        response.sendRedirect("index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
         // Debugging: Print all request parameters
         System.out.println("DEBUG: Raw Parameters - " + request.getParameterMap());
         request.getParameterMap().forEach((key, value) -> 
             System.out.println("Key: " + key + ", Value: " + java.util.Arrays.toString(value))
         );

         // Retrieve parameters
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String type = request.getParameter("type");
         String aadhaarNo = request.getParameter("aadhaarNo");

         // Debugging: Print received values
         System.out.println("DEBUG: Email=" + email + ", Password=" + password + ", Aadhaar=" + aadhaarNo + ", Type=" + type);

         if (email == null || password == null || type == null || aadhaarNo == null) {
             request.setAttribute("errorMessage", "Missing required fields. Please fill all inputs.");
             RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
             rd.forward(request, response);
             return;
         }

         // Trim input values
         email = email.trim();
         password = password.trim();
         type = type.trim().toLowerCase();
         aadhaarNo = aadhaarNo.trim();

         try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/centralbankdb", "root", "Kumari26@");

             // Check if user exists
             PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE email=? AND password=? AND type =? AND aadhaarNo=?");
             ps.setString(1, email);
             ps.setString(2, password);
             ps.setString(3, type);
             ps.setString(4, aadhaarNo);

             ResultSet rs = ps.executeQuery();

             if (rs.next()) {
                 System.out.println("Login Successful for: " + email);
                 HttpSession session = request.getSession();
                 session.setAttribute("user", email);
                 response.sendRedirect("index.jsp");
//                 request.setAttribute("loginSuccessMessage", "Login Successful! Welcome");
//                 RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//                 rd.forward(request, response);
                 
//                 HttpSession session = request.getSession();
//                 session.setAttribute("loginSuccessMessage", "Login Successful! Welcome");
//                 response.sendRedirect("index.jsp");
                 System.out.println("Login Successful for: " + email);
                 return;

             } else {
                 System.out.println("Invalid login attempt for: " + email);
                 request.setAttribute("errorMessage", "Invalid Email, Password, Aadhaar, or Type");
                 RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
                 rd.forward(request, response);
             }
             } catch (Exception e) {
                 e.printStackTrace();
                 request.setAttribute("errorMessage", "Database Error: " + e.getMessage());
                 RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
                 rd.forward(request, response);
             }

    }
}
