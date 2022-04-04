package addflight;

public class Flight {
	private int id;
	private String flightno,airlinename,departureairport,departuredate,departuretime,arrivalairport,arrivaltime,travelclass,capacity,price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFlightno() {
		return flightno;
	}
	public void setFlightno(String flightno) {
		this.flightno = flightno;
	}
	public String getAirlinename() {
		return airlinename;
	}
	public void setAirlinename(String airlinename) {
		this.airlinename = airlinename;
	}
	public String getDepartureairport() {
		return departureairport;
	}
	public void setDepartureairport(String departureairport) {
		this.departureairport = departureairport;
	}
	public String getDeparturedate() {
		return departuredate;
	}
	public void setDeparturedate(String departuredate) {
		this.departuredate = departuredate;
	}
	public String getDeparturetime() {
		return departuretime;
	}
	public void setDeparturetime(String departuretime) {
		this.departuretime = departuretime;
	}
	public String getArrivalairport() {
		return arrivalairport;
	}
	public void setArrivalairport(String arrivalairport) {
		this.arrivalairport = arrivalairport;
	}
	public String getArrivaltime() {
		return arrivaltime;
	}
	public void setArrivaltime(String arrivaltime) {
		this.arrivaltime = arrivaltime;
	}
	public String getTravelclass() {
		return travelclass;
	}
	public void setTravelclass(String travelclass) {
		this.travelclass = travelclass;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}
