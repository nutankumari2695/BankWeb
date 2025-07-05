import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/SignupServlet")

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SignupServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	 String name = request.getParameter("name");
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         int age = Integer.parseInt(request.getParameter("age"));
         String gender = request.getParameter("gender");
         String type = request.getParameter("type");
         String aadhaarNo = request.getParameter("aadhaarNo");
         String captcha = request.getParameter("captcha");

         // Validate Captcha
         String generatedCaptcha = (String) request.getSession().getAttribute("captcha");
         if (!captcha.equalsIgnoreCase(generatedCaptcha)) {
             response.sendRedirect("main.jsp?captcha=fail");
             return;
         }

         Connection conn = null;
         PreparedStatement stmt = null;
         ResultSet rs = null;
         try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/centralbankdb", "root", "Kumari26@");

             // Check if Aadhaar or Email already exists
             String checkQuery = "SELECT * FROM register WHERE email = ? OR aadhaarNo = ?";
             stmt = conn.prepareStatement(checkQuery);
             stmt.setString(1, email);
             stmt.setString(2, aadhaarNo);
             rs = stmt.executeQuery();
             
             if (rs.next()) {
                 request.getSession().setAttribute("message", "Aadhaar or Email already exists");
                 response.sendRedirect("main.jsp");
                 return;
             }
             
             // Handle file upload
             Part aadhaarPart = request.getPart("aadhaar");
             String fileName = extractFileName(aadhaarPart);
             String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
             File uploadDir = new File(uploadPath);
             if (!uploadDir.exists()) uploadDir.mkdir();
             aadhaarPart.write(uploadPath + File.separator + fileName);
             
             // Insert into register table
             String sql = "INSERT INTO register (name, email, password, age, gender, type, aadhaarNo, fileName) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
             stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
             stmt.setString(1, name);
             stmt.setString(2, email);
             stmt.setString(3, password);
             stmt.setInt(4, age);
             stmt.setString(5, gender);
             stmt.setString(6, type);
             stmt.setString(7, aadhaarNo);
             stmt.setString(8, fileName);
             int rows = stmt.executeUpdate();

             if (rows > 0) {
                 ResultSet generatedKeys = stmt.getGeneratedKeys();
                 int userId = -1;
                 if (generatedKeys.next()) {
                     userId = generatedKeys.getInt(1);
                 }

                 // Insert into seniorregister or commonregister based on age and type
                 if ((age >= 60 && type.equalsIgnoreCase("senior"))) {
                     sql = "INSERT INTO seniorregister (name, email,password, age, gender,type, aadhaarNo,fileName) VALUES (?, ?, ?, ?, ?, ?,?,?)";
                 } else if (age < 60 && type.equalsIgnoreCase("common")) {
                     sql = "INSERT INTO commonregister (name, email,password, age, gender,type, aadhaarNo,fileName) VALUES (?, ?, ?, ?, ?,?,?, ?)";
                 } else {
                	 request.getSession().setAttribute("message", "Invalid type selection");
                     response.sendRedirect("main.jsp");
                     return;
                 }
                 
                 stmt = conn.prepareStatement(sql);
                 stmt.setString(1, name);
                 stmt.setString(2, email);
                 stmt.setString(3, password);
                 stmt.setInt(4, age);
                 stmt.setString(5, gender);
                 stmt.setString(6, type);
                 stmt.setString(7, aadhaarNo);
                 stmt.setString(8, fileName);
                 stmt.executeUpdate();
                 
                 request.getSession().setAttribute("message", "Registered Successfully");
                 response.sendRedirect("main.jsp");
                 return;
           } else {
        	   request.getSession().setAttribute("message", "Register fail");
               response.sendRedirect("main.jsp");
               return;

             }
         } catch (Exception e) {
        	 e.printStackTrace();
             request.getSession().setAttribute("message", "Register fail");
             response.sendRedirect("main.jsp");
             return;

         } finally {
             try {
                 if (rs != null) rs.close();
                 if (stmt != null) stmt.close();
                 if (conn != null) conn.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }
     }

     private String extractFileName(Part part) {
         String contentDisp = part.getHeader("content-disposition");
         for (String token : contentDisp.split(";")) {
             if (token.trim().startsWith("filename")) {
                 return token.substring(token.indexOf('=') + 2, token.length() - 1);
             }
         }
         return "";
    }
}
