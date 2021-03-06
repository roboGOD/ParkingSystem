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
    <body onload="init()" class="body-texture">
        <div class="body-content body-content-nobackground">
            <h4 class="alert alert-primary"> Fill Booking Details </h4>
            <div id="bookingdetails">
                <form id="bookingform" action="FetchSlots">
                    <label for="vehicle"  class="my-label"> Select Vehicle: </label>
                    <%
        
                        dao.CarsDAO cd = new dao.CarsDAO();
                        ArrayList<pojos.Car> cars = cd.fetchCarsList(currentUser.getUsername());

                        if(cars.size() < 1) 
                            response.sendRedirect("managecars.jsp");  
                        else { 
                    
                    %>
                    
                    <select id="vehicle" name="vehicle" required>
                        <% for(pojos.Car car: cars) { %>
                        
                        <option value="<%=car.getSno()%>"> <%= car.getYear()%> <%= car.getMake() %> <%=car.getModel()%> (<%=car.getPlateNo()%>)  </option>
                        
                        <% } %>
                    </select>
                    
                    <% } %>
                    <br>

                    <label for="date" class="my-label"> Date: </label>
                    <input type="date" id="date" name="date" required> <br>

                    <label for="starttime" class="my-label"> Parking Time: </label>
                    <input type="time" id="starttime" name="starttime" onfocus="setTimeLimit()" required> <br>

                    <label for="hours" class="my-label"> Number of Hours: </label>
                    <input type="number" id="hours" min="1" max="72" name="hours" required> <br>

                    <label for="category" class="my-label"> Category: </label>
                    <div id="category">
                        <input type="radio" id="premium" name="category" value="premium" required>
                        <label for="premium"> Premium </label>

                        <input type="radio" id="economy" name="category" value="economy" required>   
                        <label for="economy"> Economy </label> 
                    </div> <br>
                    
                    <input type="submit" value="Select Slot" class="btn btn-primary" >
                </form>
            </div>
            
            <div id="select-slots-form">
            <form action="confirmbooking.jsp" method="post">     
                <div id="select-slots">
                    <div id="parking-slots"> 
                        <div id="top-slots">
                            <% for(int i=1; i <= 22  ; i++) { %>
                                <div class="slot" id="slot-<%=i%>"> <%=i%> </div>
                            <% } %>
                        </div>

                        <div id="bottom-slots">
                            <div id="rightmost-slots">
                                <% for(int i=23; i <= 34  ; i++) { %>
                                    <div class="slot slot-inverted" id="slot-<%=i%>"> <%=i%> </div>
                                <% } %>
                            </div>

                            <div id="double-slots-container">
                                <div class="double-slots" id="double-slots-1">
                                    <div class="double-slots-grid"> 
                                    <% for(int i=35; i <= 58  ; i++) { %>
                                        <div class="slot slot-inverted" id="slot-<%=i%>"> <%=i%> </div>
                                    <% } %>
                                    </div>
                                </div>
                                
                                <div class="double-slots"  id="double-slots-2"> 
                                    <div class="double-slots-grid">
                                    <% for(int i=59; i <= 82  ; i++) { %>
                                        <div class="slot slot-inverted" id="slot-<%=i%>"> <%=i%> </div>
                                    <% } %>
                                    </div>
                                </div>
                                
                                <div class="double-slots"  id="double-slots-3"> 
                                    <div class="double-slots-grid">
                                    <% for(int i=83; i <= 106  ; i++) { %>
                                        <div class="slot slot-inverted" id="slot-<%=i%>"> <%=i%> </div>
                                    <% } %>
                                    </div>
                                </div>
                            </div>

                            <div style="clear: both;"> </div>
                        </div>
                    </div>   
                </div>
                <input type="text" placeholder="Slot Number" id="slotID" name="slotID" hidden required>
                <input type="submit" id="bookparkingsubmit" class="btn btn-primary" value="Book Parking">
            </form>
            </div>
        </div>
        
        <script src="js/fillbookingdetails.js"> </script>
    </body>
</html>
