package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String userpassword=request.getParameter("password");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String birthday=request.getParameter("birthday");
		String phone=request.getParameter("phone");
		RequestDispatcher dispatcher=null;
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system", "root", "");
			PreparedStatement pst=con.prepareStatement("insert into user_reg(username,userpassword,firstname,lastname,email,gender,birthday,phone) values(?,?,?,?,?,?,?,?)");
			pst.setString(1, username);
			pst.setString(2, userpassword);
			pst.setString(3, firstname);
			pst.setString(4, lastname);
			pst.setString(5, email);
			pst.setString(6, gender);
			pst.setString(7, birthday);
			pst.setString(8, phone);
			int rowCount=pst.executeUpdate();
			 
			 if(rowCount>0) { 
				 request.setAttribute("status", "success");
				 dispatcher=request.getRequestDispatcher("login.jsp");
			 }else {
			 request.setAttribute("status", "failed");
			 dispatcher=request.getRequestDispatcher("userregister.jsp");
			 }
			dispatcher.forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
