package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import utilities.DBUtil;

/**
 *
 * @author robogod
 */
public class BookingsDAO {
    private PreparedStatement fetchStatement;
    private PreparedStatement insertStatement;
    
    public ArrayList<Integer> fetchBookedSlots(pojos.Booking checkBook) {
        ArrayList<Integer> slots = null;
        HashSet<Integer> hashSlots = new HashSet<>();
        
        pojos.Booking booking;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            fetchStatement = conn.prepareStatement("select * from bookings where LocationID = ? and Category = ?;");
            fetchStatement.setInt(1, checkBook.getLocationId());
            fetchStatement.setString(2, checkBook.getCategory());

            rs = fetchStatement.executeQuery();
            
            //if we've returned a row, turn that row into a new user object
            while (rs.next()) {
                booking = new pojos.Booking(
                        rs.getInt("ID"), 
                        rs.getInt("LocationID"), 
                        rs.getInt("SlotID"), 
                        rs.getTimestamp("ParkingDateTime").getTime(), 
                        rs.getInt("ParkingHours"), 
                        rs.getString("Username"), 
                        rs.getInt("CarID"), 
                        rs.getString("Category"), 
                        rs.getTimestamp("BookingTime").getTime());
                
                // Checking if Dates overlap or not
                if(! ((booking.getParkingDateTime().before(checkBook.getParkingDateTime()) && booking.getParkingEndTime().before(checkBook.getParkingDateTime())) 
                        || (booking.getParkingDateTime().after(checkBook.getParkingEndTime()) && booking.getParkingEndTime().after(checkBook.getParkingEndTime())))) {
                    hashSlots.add(booking.getSlotId());
                }
            }
            slots = new ArrayList<> (hashSlots);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(fetchStatement);
            DBUtil.close(conn);
        }
        return slots;
    }
    
    
    public void addBooking(pojos.Location loc) {
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            insertStatement = conn.prepareStatement("insert into locations(StreetAddress, City, PostalCode, State, Country) values(?,?,?,?,?)");

            //Add parameters to the ?'s in the preparedstatement and execute
            insertStatement.setString(1, loc.getStreetAddress());
            insertStatement.setString(2, loc.getCity());
            insertStatement.setInt(3, loc.getPostalCode());
            insertStatement.setString(4, loc.getState());
            insertStatement.setString(5, loc.getCountry());
            insertStatement.executeUpdate();
            
          
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(insertStatement);
            DBUtil.close(conn);
        }
    }
}
