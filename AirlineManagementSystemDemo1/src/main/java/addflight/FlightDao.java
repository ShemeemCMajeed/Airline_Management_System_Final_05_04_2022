package addflight;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import addflight.Flight; 
public class FlightDao {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system","root","");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}  
	public static int save(Flight u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into flight(flightno,airlinename,departureairport,departuredate,departuretime,arrivalairport,arrivaltime,travelclass,capacity,price) values(?,?,?,?,?,?,?,?,?,?)");  
	        ps.setString(1,u.getFlightno());  
	        ps.setString(2,u.getAirlinename());  
	        ps.setString(3,u.getDepartureairport());  
	        ps.setString(4,u.getDeparturedate());  
	        ps.setString(5,u.getDeparturetime());
	        ps.setString(6,u.getArrivalairport());  
	        ps.setString(7,u.getArrivaltime()); 
	        ps.setString(8,u.getTravelclass());
	        ps.setString(9,u.getCapacity());  
	        ps.setString(10,u.getPrice());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int update(Flight u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"update flight set flightno=?,airlinename=?,departureairport=?,departuredate=?,departuretime=?,arrivalairport=?,arrivaltime=?,travelclass=?,capacity=?,price=? where id=?");  
	        ps.setString(1,u.getFlightno());  
	        ps.setString(2,u.getAirlinename());  
	        ps.setString(3,u.getDepartureairport());  
	        ps.setString(4,u.getDeparturedate());  
	        ps.setString(5,u.getDeparturetime());
	        ps.setString(6,u.getArrivalairport());  
	        ps.setString(7,u.getArrivaltime());  
	        ps.setString(8,u.getTravelclass());
	        ps.setString(9,u.getCapacity());  
	        ps.setString(10,u.getPrice());  
	        ps.setInt(11,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int delete(Flight u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from flight where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
	public static List<Flight> getAllRecords(){  
	    List<Flight> list=new ArrayList<Flight>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from flight");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            Flight u=new Flight();  
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
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	public static Flight getRecordById(int id){  
	    Flight u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from flight where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new Flight();  
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
