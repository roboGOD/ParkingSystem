package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utilities.DBUtil;

/**
 *
 * @author robogod
 */
public class LocationsDAO {
    
    private PreparedStatement fetchStatement;
    private PreparedStatement insertStatement;
    
    public ArrayList<pojos.Location> fetchLocations() {
        ArrayList<pojos.Location> locs = new ArrayList<>();
        pojos.Location loc;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            fetchStatement = conn.prepareStatement("select * from locations;");

            rs = fetchStatement.executeQuery();
            
            //if we've returned a row, turn that row into a new user object
            while (rs.next()) {
                loc = new pojos.Location();
                loc.setId(rs.getInt("ID"));
                loc.setStreetAddress(rs.getString("StreetAddress"));
                loc.setCity(rs.getString("City"));
                loc.setPostalCode(rs.getInt("PostalCode"));
                loc.setState(rs.getString("State"));
                loc.setCountry(rs.getString("Country"));
                locs.add(loc);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(fetchStatement);
            DBUtil.close(conn);
        }
        return locs;
    }
    
    public void addLocation(pojos.Location loc) {
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
