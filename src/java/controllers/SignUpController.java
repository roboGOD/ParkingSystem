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
public class SignUpController extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            String email = request.getParameter("Email");
            
            PasswordService pwe = new PasswordService();
            
            //Encryption of new password
            String encryptPassword = pwe.encrypt(password);
            
            //Creating new user object
            User user = new User();
            user.setEmail(email);
            user.setUsername(username);
            
            dao.UsersDAO ud = new dao.UsersDAO();
            
            //Entering information to DB
            String message = ud.signUpUser(user, encryptPassword);
            
            
            if(message.equals("Done")) {
                String url;
                url = "managecars.jsp";
                session.invalidate();
                session=request.getSession(true);
                user = ud.authenticateUser(username, encryptPassword);
                session.setAttribute("user", user);
                response.sendRedirect(url);
            }
            else {
                session.setAttribute("errorMessage", message);
                response.sendRedirect("signup.jsp");
            }
        }
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
