package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pojos.User;
import utilities.DBUtil;

public class UsersDAO {
    private PreparedStatement authenticateUserStatement;
    private PreparedStatement signUpUserStatement;
    private PreparedStatement checkEmail;
    
    
    /**
     * Authenticates a user in the database.
     * @param username  The username for the user.
     * @param password  The password for the user.
     * @return A user object if successful, null if unsuccessful.
     */
    public User authenticateUser(String username, String password) {
        User user = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Create the preparedstatement(s)
            authenticateUserStatement = conn.prepareStatement("select * from users where Username=? and Password=?");

            //Add parameters to the ?'s in the preparedstatement and execute
            authenticateUserStatement.setString(1, username);
            authenticateUserStatement.setString(2, password);
            rs = authenticateUserStatement.executeQuery();
            
            //if we've returned a row, turn that row into a new user object
            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(username);
                user.setEmail(rs.getString("Email"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(authenticateUserStatement);
            DBUtil.close(conn);
        }
        return user;
    }
    
    public String signUpUser(User user, String password){
        String message="";
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            //Set up connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/parkingsystem", "root", "");
            
            //Checking if Email already exists
            checkEmail = conn.prepareStatement("select * from users where Email = ?");
            checkEmail.setString(1, user.getEmail());
            rs = checkEmail.executeQuery();
            
            //if Email already exists
            if (rs.next()) {
                message = "Email already exists";
            }
            else{
                //Create the preparedstatement(s)
                signUpUserStatement = conn.prepareStatement("insert into users(Username, Password, Email) values(?, ?, ?)");
                signUpUserStatement.setString(1, user.getUsername());
                signUpUserStatement.setString(2, password);
                signUpUserStatement.setString(3, user.getEmail());
                signUpUserStatement.executeUpdate();
                message = "Done";
            }
        }
        catch (Exception e) {
            System.out.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            DBUtil.close(rs);
            DBUtil.close(signUpUserStatement);
            DBUtil.close(conn);
        }
        
        return message;
    }
}
