<%-- 
    Document   : fillbookingdetails
    Created on : 19 May, 2019, 11:49:19 PM
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Book Parking </title>
    </head>
    <body onload="init()">
        <div class="body-content">
            <h4 class="alert alert-primary"> Fill Booking Details </h4>
            <div id="bookingdetails">
                <form id="bookingform" action="FetchSlots">
                    <label for="vehicle" > Select Vehicle: </label>
                    <%
        
                        dao.CarsDAO cd = new dao.CarsDAO();
                        ArrayList<pojos.Car> cars = cd.fetchCarsList(currentUser.getUsername());

                        if(cars.size() < 1) {
                    %>

                        <script>alert("No Cars Added!!"); </script>
                        

                    <% response.sendRedirect("managecars.jsp"); } else { %>
                    
                    <select id="vehicle" name="vehicle" required>
                        <% for(pojos.Car car: cars) { %>
                        
                        <option value="<%=car.getSno()%>"> <%= car.getYear()%> <%= car.getMake() %> <%=car.getModel()%> (<%=car.getPlateNo()%>)  </option>
                        
                        <% } %>
                    </select>
                    
                    <% } %>
                    <br>

                    <label for="date"> Date: </label>
                    <input type="date" id="date" name="date" required> <br>

                    <label for="starttime"> Parking Time: </label>
                    <input type="time" id="starttime" name="starttime" required> <br>

                    <label for="hours"> Number of Hours: </label>
                    <input type="number" id="hours" name="hours" required> <br>

                    <input type="radio" id="premium" name="category" value="premium" required>
                    <label for="premium"> Premium </label>

                    <input type="radio" id="economy" name="category" value="economy" required>   
                    <label for="economy"> Economy </label> <br>
                    
                    <input type="submit" value="Select Slot" class="btn btn-outline-primary" >
                </form>
            </div>
            
            <div id="select-slots-form">
            <form action="AddBooking" method="post">     
                <div id="select-slots">
                    <div id="parking-slots"> 
                        <div id="top-slots">
                            <% for(int i=1; i < 10; i++) { %>
                                <div class="slot" id="slot-<%=i%>"> </div>
                            <% } %>
                        </div>

                        <div id="bottom-slots">
                            <div id="right-slots">
                                <div class="slot slot-inverted" id="slot-10"> </div>
                                <div class="slot slot-inverted" id="slot-11"> </div>
                                <div class="slot slot-inverted" id="slot-12"> </div>
                            </div>

                            <div id="left-slots">
                                <div class="slot slot-inverted" id="slot-15"> </div>
                                <div class="slot slot-inverted" id="slot-14"> </div>
                                <div class="slot slot-inverted" id="slot-13"> </div>
                            </div>

                            <div style="clear: both;"> </div>
                        </div>
                    </div>   
                </div>
                <label for="slotID"> Slot Number </label>
                <input type="text" placeholder="Slot Number" id="slotID" name="slotID" readonly required> <br>
                <input type="submit" id="bookparkingsubmit" class="btn btn-primary" value="Book Parking">
            </form>
            </div>
        </div>
        
        <script src="js/fillbookingdetails.js"> </script>
    </body>
</html>
