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
            <h4 class="alert alert-primary"> <a href="#/" style="float: right; margin: 0px;" class="btn btn-primary btn-sm" onclick="addCar()"> Add Car  </a> Manage Cars </h4>
            
        <%
        
            dao.CarsDAO cd = new dao.CarsDAO();
            ArrayList<pojos.Car> cars = cd.fetchCarsList(currentUser.getUsername());
            
            if(cars.size() < 1) {
        %>
        
            <h4 class="alert alert-danger"> No Cars Added! </h4>
        
        <% } else { %>
        
            <div class="car-details-container">
                <table class="table table-hover">
                    <thead class="thead text-light" style="background-color: #1f0f66;">
                        <tr>
                            <th> License Plate Number </th>
                            <th> Car </th>
                            <th> Options </th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for(pojos.Car car : cars) { %>

                        <tr>
                            <td> <%= car.getPlateNo()%> </td>
                            <td> <%=car.getYear()%> <%=car.getMake()%> <%=car.getModel()%> </td>
                            <td> 
                                <button class="btn btn-success" onclick="editCar(
                                             <%= car.getSno()%>, 
                                            '<%=car.getMake()%>', 
                                            '<%=car.getModel()%>',
                                             <%=car.getYear()%> , 
                                            '<%= car.getPlateNo()%>');"> 
                                    <i class="fa fa-edit fa-lg"> </i> 
                                </button>
                                
                                <button class="btn btn-danger" onclick="deleteCar(<%= car.getSno()%>)">
                                    <i class="fa fa-times fa-lg"> </i>
                                </button>
                            </td>
                        </tr>

                    <% } %>
                    </tbody>
                </table>
            </div>
        
        <% } %>
        
        </div>
        
        <div id="input-box-div" class="full-screen-background" style="display: none">
            <div class="input-box">
                <form id="input-box-form" method="POST">
                    <h5 id="form-title">  </h5>
                    <input type="text" name="sno" class="text" hidden>
                    <input type="text" placeholder="Make" name="make" class="text"> <br>
                    <input type="text" placeholder="Model" name="model" class="text"> <br>
                    <input type="number" placeholder="Year" name="year" min="1800" max="2222" class="text"> <br>
                    <input type="text" placeholder="Plate Number" name="plateno" class="text"> <br>
                   
                    <input type="submit" value="Submit" class="btn btn-success my-btn">
                    <input type="button" value="Cancel" class="btn btn-default my-btn"  onclick="toggleInputBox()">
                </form>
            </div>
        </div>
        
        <div id="confirm-box-div" class="full-screen-background" style="display: none">
            <div class="confirm-box">
                <form id="confirm-box-form" method="POST">
                    <h5 id="form-title">  </h5>
                    <span> Are you sure you want to continue? </span> <br>
                    <input type="text" name="sno" class="text" hidden>
                    <input type="submit" value="Yes" class="btn btn-success my-btn">
                    <input type="button" value="Cancel" class="btn btn-default my-btn"  onclick="toggleConfirmBox()">
                </form>
            </div>
        </div>
        
        <script src="js/managecars.js"> </script>
        
        <% } else response.sendRedirect("index.jsp"); %>
    </body>
</html>
