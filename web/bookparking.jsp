<%-- 
    Document   : bookparking
    Created on : 19 May, 2019, 10:51:37 PM
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
    <body>
        <div class="body-content">
            <h4 class="alert alert-info"> Select a Region! </h4>
            <div class="locations-container">
            <%
                dao.LocationsDAO ld = new dao.LocationsDAO();
                ArrayList<pojos.Location> locs = ld.fetchLocations();
                for(pojos.Location loc : locs) {
            %>
            <a href="fillbookingdetails.jsp?locationID=<%=loc.getId()%>">
                <div class="location">
                    <div class="street-address"> <%=loc.getStreetAddress()%> </div>
                    <div class="city"> <%=loc.getCity()%> <%=loc.getState()%> </div>
                    <div class="postal-code"> <%=loc.getPostalCode()%> </div>
                    <div class="country"> <%=loc.getCountry()%> </div>
                </div>
            </a>
            <% } %>
            </div>
        </div>
    </body>
</html>