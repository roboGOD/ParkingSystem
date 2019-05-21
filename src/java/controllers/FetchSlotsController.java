package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import java.util.HashSet;

/**
 *
 * @author robogod
 */
public class FetchSlotsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println("Log:::: Fetching Overlapping Slots");
            String res = "";
            
            HttpSession session = request.getSession();
            pojos.User user = (pojos.User) session.getAttribute("user");
            
            Calendar parkingTime = Calendar.getInstance();
            try {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
                String startTime = request.getParameter("starttime");
                
                parkingTime.setTimeInMillis(date.getTime());
                parkingTime.set(Calendar.HOUR_OF_DAY, Integer.parseInt(startTime.split(":")[0].trim()));
                parkingTime.set(Calendar.MINUTE, Integer.parseInt(startTime.split(":")[1].trim()));
                
            } catch (Exception ex) { 
                Logger.getLogger(FetchSlotsController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            pojos.Booking booking = new pojos.Booking(
                    -1, 
                    Integer.parseInt(request.getParameter("location")), 
                    -1, 
                    parkingTime.getTimeInMillis(), 
                    Integer.parseInt(request.getParameter("hours")),
                    user.getUsername(),
                    Integer.parseInt(request.getParameter("vehicle")),
                    request.getParameter("category"),
                    Calendar.getInstance().getTimeInMillis()
            );
            
            session.setAttribute("currentBooking", booking);
            
            dao.BookingsDAO bd = new dao.BookingsDAO();
            ArrayList<Integer> slots = bd.fetchBookedSlots(booking);
            
            res = new Gson().toJson(slots);
            
            out.print(res);
            out.flush();
            
            HashSet<Integer> hashSlots = new HashSet<>(slots);
            session.setAttribute("bookedSlots", hashSlots);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
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
