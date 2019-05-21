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
    private PreparedStatement insertStatement;
    private PreparedStatement deleteStatement;
    
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
    
    public void addCar(pojos.Car car) {
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            insertStatement = conn.prepareStatement("insert into cars(Make, Model, Year, PlateNo, Username) values(?,?,?,?,?)");

            //Add parameters to the ?'s in the preparedstatement and execute
            insertStatement.setString(1, car.getMake());
            insertStatement.setString(2, car.getModel());
            insertStatement.setInt(3, car.getYear());
            insertStatement.setString(4, car.getPlateNo());
            insertStatement.setString(5, car.getUsername());
            insertStatement.executeUpdate();
            
          
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(insertStatement);
            DBUtil.close(conn);
        }
    }
    
    
    public void updateCar(pojos.Car car) {
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            insertStatement = conn.prepareStatement("update cars set Make=?, Model=?, Year=?, PlateNo=? where SNo = ?");

            //Add parameters to the ?'s in the preparedstatement and execute
            insertStatement.setString(1, car.getMake());
            insertStatement.setString(2, car.getModel());
            insertStatement.setInt(3, car.getYear());
            insertStatement.setString(4, car.getPlateNo());
            insertStatement.setInt(5, car.getSno());
            insertStatement.executeUpdate();
            
          
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(insertStatement);
            DBUtil.close(conn);
        }
    }
    
    public void deleteCar(int sno) {
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            deleteStatement = conn.prepareStatement("delete from cars where SNo = ?");

            //Add parameters to the ?'s in the preparedstatement and execute
            
            deleteStatement.setInt(1, sno);
            deleteStatement.executeUpdate();
            
          
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(deleteStatement);
            DBUtil.close(conn);
        }
    }
    
    
}
