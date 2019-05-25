<%-- 
    Document   : index
    Created on : 18 May, 2019, 10:43:08 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Parking System </title>
    </head>
    <body>
        <div class="body-content body-content-nobackground">
            <% if(currentUser != null) { %>
                <h4 class='alert alert-primary'> Welcome <%=currentUser.getUsername()%>! </h4>
            <% } else { %>
                <h5 class='alert alert-primary'> Login to book parking slot. </h5>
            <% } %>
        </div>
    </body>
</html>
