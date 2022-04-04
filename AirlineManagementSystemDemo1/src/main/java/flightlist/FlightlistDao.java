package flightlist;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;

import addflight.Flight;
import flightlist.FlightList; 
public class FlightlistDao {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system","root","");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}  
	public static FlightList getRecordById(int id){  
	    FlightList u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from flight where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new FlightList();  
	            u.setId(rs.getInt("id"));  
	            u.setFlightno(rs.getString("flightno"));  
	            u.setAirlinename(rs.getString("airlinename"));  
	            u.setDepartureairport(rs.getString("departureairport"));  
	            u.setDeparturedate(rs.getString("departuredate"));  
	            u.setDeparturetime(rs.getString("departuretime"));
	            u.setArrivalairport(rs.getString("arrivalairport"));  
	            u.setArrivaltime(rs.getString("arrivaltime"));  
	            u.setTravelclass(rs.getString("travelclass"));
	            u.setCapacity(rs.getString("capacity"));  
	            u.setPrice(rs.getString("price"));  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  
}
