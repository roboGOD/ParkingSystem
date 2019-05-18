package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojos.User;
import utilities.PasswordService;

/**
 *
 * @author robogod
 */
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private HttpSession session;
    private String url;
    
    /**
     * Servlet constructor
     */
    public LoginController() {
        super();
    }
    
    /**
     * Process GET requests/responses (logout)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //User has clicked the logout link
        session = request.getSession();
        url= "index.jsp";
        
        
        logout();
        session=request.getSession(true);
        
        //forward our request along
        response.sendRedirect(url);
    }
    
    /**
     * Process POST requests/responses (login)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            
            
            
            //get our current session
            session = request.getSession();
            
            
            String Username = request.getParameter("Username");
            String Password = request.getParameter("Password");
            
            //encrypt the password to check against what's stored in DB
            PasswordService pws = new PasswordService();
            String encryptedPass = pws.encrypt(Password);
            
            //create a user helper class to make database calls, and call authenticate user method
            dao.UsersDAO uh = new dao.UsersDAO();
            User user = uh.authenticateUser(Username, encryptedPass);

            //we've found a user that matches the credentials
            if(user != null){
                //invalidate current session, then get new session for our user (combats: session hijacking)
                url= "index.jsp";
                session.invalidate();
                session=request.getSession(true);
                session.setAttribute("user", user);
                response.sendRedirect(url);
            }
            // user doesn't exist, redirect to previous page and show error
            else{
                String errorMessage;
                errorMessage = "Error: Invalid Username or Password";
                
                session.setAttribute("errorMessage", errorMessage);
                url = "login.jsp";
                response.sendRedirect(url);
            }
        }
    }
    
    /**
     * Logs the user out
     */
    public void logout() {
        session.setAttribute("user", null);
        session.removeAttribute("user");
        session.invalidate();
    }
    
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
