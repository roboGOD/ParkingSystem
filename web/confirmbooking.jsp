<%-- 
    Document   : confirmbooking
    Created on : 24 May, 2019, 2:04:36 AM
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Confirm Booking </title>
    </head>
    <body class='body-texture'>
        <div class="body-content body-content-border">
            <%! pojos.Booking booking;%>
            <%
                booking = (pojos.Booking) session.getAttribute("currentBooking");
                

                booking.setSlotId(Integer.parseInt(request.getParameter("slotID")));
                session.removeAttribute("currentBooking");
                session.setAttribute("currentBooking", booking);
            %>
            
            <h4 class="alert alert-primary">Booking Details</h4>
            <div id="bookingdetails">
                <form id="bookingform" action="paycharges.jsp">
                    <label for="username" class="my-label"> Username: </label>
                    <input type="text" id="username" name="username" value="<%=booking.getUsername()%>" readonly> <br>
                    
                    <label for="vehicle"  class="my-label"> Vehicle: </label>
                    <%
        
                        dao.CarsDAO cd = new dao.CarsDAO();
                        pojos.Car car = cd.fetchCar(booking.getCarId());
                    
                    %>
                    
                    <select id="vehicle" name="vehicle" disabled>
                        <option value="<%=car.getSno()%>"> <%= car.getYear()%> <%= car.getMake() %> <%=car.getModel()%> (<%=car.getPlateNo()%>)  </option>
                    </select>
                    
                    <br>
                    
                    <label for="location" class="my-label"> Location ID: </label>
                    <input type="number" id="location" name="location" readonly value="<%=booking.getLocationId()%>"> <br>
                    
                    <label for="slotID" class="my-label"> Slot ID: </label>
                    <input type="number" id="slotID" name="slotID" readonly value="<%=booking.getSlotId()%>"> <br>

                    <label for="date" class="my-label"> Date: </label>
                    <input type="date" id="date" name="date" readonly value="<%= new SimpleDateFormat("yyyy-MM-dd").format(booking.getParkingDateTime().getTime())%>"> <br>

                    <label for="starttime" class="my-label"> Parking Time: </label>
                    <input type="time" id="starttime" name="starttime" readonly value="<%= new SimpleDateFormat("HH:mm").format(booking.getParkingDateTime().getTime())%>"> <br>

                    <label for="hours" class="my-label"> Number of Hours: </label>
                    <input type="number" id="hours" min="1" max="72" name="hours" readonly value="<%=booking.getParkingHours() %>"> <br>

                    <label for="category" class="my-label"> Category: </label>
                    <input type="text" id="category" name="category" value="<%=booking.getCategory()%>" readonly>  <br>
                    
                    <label for="charges"  class="my-label"> Charges: </label>
                    <%
        
                        dao.ChargesDAO chd = new dao.ChargesDAO();
                        int pricePerHour = chd.getPricePerHour(booking.getCategory());
                        
                        int total = pricePerHour * booking.getParkingHours();
                        
                    %>
                    <span> ₹</span> <strong><input type="text" id="charges" name="charges" value="<%=total%>" readonly>  </strong><br>
                    
                    <input type="submit" value="Pay" class="btn btn-primary" >
                </form>
            </div>
        </div>
    </body>
</html>
