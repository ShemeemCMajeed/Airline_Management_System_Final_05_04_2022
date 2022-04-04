package contactus;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;

import addflight.Flight;
import contactus.ContactUs;
public class ContactusDao {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system","root","");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}  
	public static int save(ContactUs u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into feedback(firstname,lastname,email,message) values(?,?,?,?)");  
	        ps.setString(1,u.getFirstname());  
	        ps.setString(2,u.getLastname());  
	        ps.setString(3,u.getEmail());  
	        ps.setString(4,u.getMessage());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	} 
	public static List<ContactUs> getAllRecords(){  
	    List<ContactUs> list=new ArrayList<ContactUs>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from feedback");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            ContactUs u=new ContactUs();  
	            u.setId(rs.getInt("id"));  
	            u.setFirstname(rs.getString("firstname"));  
	            u.setLastname(rs.getString("lastname"));  
	            u.setEmail(rs.getString("email"));  
	            u.setMessage(rs.getString("message"));  
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
}
