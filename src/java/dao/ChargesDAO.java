package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utilities.DBUtil;

/**
 *
 * @author robogod
 */
public class ChargesDAO {
    private PreparedStatement updateStatement;
    private PreparedStatement fetchStatement;
    
    public int getPricePerHour(String category) {
        Connection conn = null;
        ResultSet rs = null;
        int price = -1;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            fetchStatement = conn.prepareStatement("select * from charges where category=?");

            //Add parameters to the ?'s in the preparedstatement and execute
            fetchStatement.setString(1, category);
            rs = fetchStatement.executeQuery();
            if(rs.next())
                price = rs.getInt("PerHour");
            
          
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(fetchStatement);
            DBUtil.close(conn);
        }
        
        return price;
    }
    
    public void updatePricePerHour(String category, int price) {
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            updateStatement = conn.prepareStatement("update charges set PerHour=?  where category=?");

            //Add parameters to the ?'s in the preparedstatement and execute
            updateStatement.setInt(1, price);
            updateStatement.setString(2, category);
            updateStatement.executeUpdate();
            
          
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(updateStatement);
            DBUtil.close(conn);
        }
    }
}
