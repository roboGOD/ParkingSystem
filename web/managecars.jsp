<%-- 
    Document   : managecars
    Created on : 19 May, 2019, 2:21:37 AM
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Manage Cars </title>
    </head>
    <body>
        <% if(currentUser != null) { %>
        <div class="body-content">
            <a href="#" class="btn btn-primary" onclick="toggleAddCar()"> Add Car  </a>
            <div id="addcarform" style="display: none"> 
                <h5> Add Car </h5>
                <form action="AddCar" method="POST"> 
                    <input type="text" placeholder="Make" name="make"> <br>
                    <input type="text" placeholder="Model" name="model"> <br>
                    <input type="text" placeholder="Year" name="year" maxlength="4"> <br>
                    <input type="text" placeholder="Plate Number" name="plateno"> <br>
                    <input type="submit" value="Submit" class="btn btn-success">
                </form>
                
            </div>
        <%
        
            dao.CarsDAO cd = new dao.CarsDAO();
            ArrayList<pojos.Car> cars = cd.fetchCarsList(currentUser.getUsername());
            
            if(cars.size() < 1) {
        %>
        
            <h4 class="alert alert-danger"> No Cars Added! </h4>
        
        <% } else { %>
        
            <div class="car-details-container">
                
                <% for(pojos.Car car : cars) { %>
                
                    <div class="car-details">
                        <span> <%=car.getYear()%> <%=car.getMake()%> <%=car.getModel()%> <%= car.getPlateNo()%> </span>
                    </div>
                
                <% } %>
                
            </div>
        
        <% } %>
        
        </div>
        <script src="js/managecars.js"> </script>
        
        <% } else response.sendRedirect("index.jsp"); %>
    </body>
</html>
