<%-- 
    Document   : viewbookings
    Created on : 19 May, 2019, 10:55:05 PM
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Bookings </title>
    </head>
    <body class="body-texture">
        <div class="body-content body-content-wider body-content-nobackground">
            <h4 class="alert alert-primary"> View Bookings </h4>
            <%
        
                dao.BookingsDAO bd = new dao.BookingsDAO();
                ArrayList<pojos.Booking> bookings = bd.fetchUserBookings(currentUser.getUsername());

            %>

            <div class="bookings-container">
                <table class="table table-hover table-striped table-light text-dark">
                    <thead class="thead text-light" style="background-color: #1f0f66;">
                        <tr>
                            <th> ID </th>
                            <th> Location </th>
                            <th> Slot </th>
                            <th> Parking Time </th>
                            <th> # Hours </th>
                            <th> CarID </th>
                            <th> Category </th>
                            <th> Booking Date </th>
                        </tr>
                    </thead>
                    <tbody >
                    <% for(pojos.Booking booking : bookings) { %>

                        <tr >
                            <td> <%=booking.getId()%> </td>
                            <td> <%=booking.getLocationId()%> </td>
                            <td> <%=booking.getSlotId()%> </td>
                            <td> <%=new SimpleDateFormat("MMM dd yyyy HH:mm a ").format(booking.getParkingDateTime().getTime())%> </td>
                            <td> <%=booking.getParkingHours()%> </td>
                            <td> <%=booking.getCarId()%> </td>
                            <td> <%=booking.getCategory()%> </td>
                            <td> <%=new SimpleDateFormat("MMM dd yyyy HH:mm a ").format(booking.getBookingTime().getTime())%> </td>
                        </tr>

                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
