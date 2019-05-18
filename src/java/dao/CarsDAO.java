package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pojos.User;
import utilities.DBUtil;

public class CarsDAO {
    
    private PreparedStatement fetchStatement;
    
    public ArrayList<pojos.Car> fetchCarsList(String username) {
        ArrayList<pojos.Car> cars = new ArrayList<>();
        pojos.Car car;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            fetchStatement = conn.prepareStatement("select * from cars where Username=?");

            //Add parameters to the ?'s in the preparedstatement and execute
            fetchStatement.setString(1, username);
            rs = fetchStatement.executeQuery();
            
            //if we've returned a row, turn that row into a new user object
            while (rs.next()) {
                car = new pojos.Car();
                car.setSno(rs.getInt("SNo"));
                car.setMake(rs.getString("Make"));
                car.setModel(rs.getString("Model"));
                car.setYear(rs.getInt("Year"));
                car.setPlateNo(rs.getString("PlateNo"));
                car.setUsername(username);
                
                cars.add(car);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(fetchStatement);
            DBUtil.close(conn);
        }
        return cars;
    }
}
