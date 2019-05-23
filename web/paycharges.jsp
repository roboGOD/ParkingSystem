<%-- 
    Document   : paycharges
    Created on : 24 May, 2019, 2:09:31 AM
    Author     : robogod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Pay Charges </title>
    </head>
    
    <body onload="document.forms['paypalForm'].submit();">
        <h3> Loading ... </h3>
        <form name="paypalForm" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
         <input type="hidden" name="cmd" value="_xclick" />
         <input type="hidden" name="business" value="narindersingh007-facilitator_api1@gmail.com" />
         <input type="hidden" name="password" value="63JMW8HLU2S6GDQE" />
         <input type="hidden" name="custom" value="1123" />
         <input type="hidden" name="item_name" value="Parking Lot Booking" />
         <input type="hidden" name="amount" value="<%=request.getParameter("charges")%>"/>
         <input type="hidden" name="rm" value="1" />
         <input type="hidden" name="currency_code" value="INR">
         <input type="hidden" name="return" value="http://localhost:8080/ParkingSystem/AddBooking"/>
         <input type="hidden" name="cancel_return" value="http://localhost:8080/ParkingSystem/index.jsp" />
         <input type="hidden" name="cert_id" value="Ate6-ndGt-hiZx9gMhlig2Hmaz1kAhm8xzLWlSPONTdw5ha7MxYCBdL9" />

        </form>
    </body>
</html>
