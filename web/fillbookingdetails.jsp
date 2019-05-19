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
            <div class="alert alert-primary"> Location <%=request.getParameter("locationID")%> </div>
        </div>
    </body>
</html>
