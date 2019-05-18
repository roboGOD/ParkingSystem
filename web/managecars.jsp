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
            <a href="#" class="btn btn-primary"> Add Car  </a>
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
        <% } else response.sendRedirect("index.jsp"); %>
    </body>
</html>
