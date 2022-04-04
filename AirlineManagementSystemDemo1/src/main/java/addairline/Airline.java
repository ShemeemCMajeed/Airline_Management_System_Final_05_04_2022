package addairline;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Airline
 */
@WebServlet("/Airline")
public class Airline extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Airline() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		int count = 0;
		String airlinecode = request.getParameter("airlinecode");
		String airlinename = request.getParameter("airlinename");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system",
					"root", "");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from airline where airlinename='" + airlinename + "' ");
			while (rs.next()) {
				count++;
			}
			if (count > 0) {

				pw.println("<script type=\"text/javascript\">");
				pw.print("alert('Airline is already added!!!');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/airline_add_airline.jsp");
				rd.include(request, response);

			} else {
				int i = st.executeUpdate(
						"insert into airline(airlinecode,airlinename) values('"
								+ airlinecode + "','" + airlinename + "')");

				pw.println("<script type=\"text/javascript\">");
				pw.print("alert('Airline Added Successfully');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/airline_add_airline.jsp");
				rd.include(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
