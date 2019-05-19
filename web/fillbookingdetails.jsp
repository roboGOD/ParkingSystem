<%-- 
    Document   : fillbookingdetails
    Created on : 19 May, 2019, 11:49:19 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Book Parking </title>
    </head>
    <body>
        <div class="body-content">
            <h4 class="alert alert-primary"> Fill Booking Details </h4>
            <div id="bookingdetails">
                
                <label for="vehicle" > Select Vehicle: </label>
                <select id="vehicle" name="vehicle">
                    <option> 1 </option>
                    <option> 2 </option>
                </select>
                <br>
                
                <label for="date"> Date: </label>
                <input type="date" id="date" name="date"> <br>
                
                <label for="starttime"> Parking Time: </label>
                <input type="time" id="starttime" name="starttime"> <br>
                
                <label for="hours"> Number of Hours: </label>
                <input type="text" id="hours" name="hours"> <br>
                
                <input type="radio" id="premium" name="category" value="premium">
                <label for="premium"> Premium </label>
                
                <input type="radio" id="economy" name="category" value="economy">   
                <label for="economy"> Economy </label>      
                
            </div>
            <button class="btn btn-outline-primary" > Select Slot </button>
            <div id="selectslots">
                <div id="parking-slots"> 
                
                </div>
                
            </div>
        </div>
    </body>
</html>
