package registration;

import java.io.IOException;
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
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String userpassword=request.getParameter("password");
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		 if (username.equals("admin") && userpassword.equals("Admin@123")) {
			 session.setAttribute("username", username);
	            response.sendRedirect("admin.jsp");
	        }
		if (username != "admin") {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system", "root", "");
		    PreparedStatement pst=con.prepareStatement("select * from user_reg where username=? and userpassword=?");
		    pst.setString(1, username);
		    pst.setString(2, userpassword);
		    ResultSet rs=pst.executeQuery();
		    if(rs.next()) {
		    	session.setAttribute("username", rs.getString("username"));
		    	dispatcher=request.getRequestDispatcher("homeafterlogin.jsp");
		    }else {
		    	request.setAttribute("status", "failed");
		    	dispatcher=request.getRequestDispatcher("login.jsp");
		    }
		    dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}

}
