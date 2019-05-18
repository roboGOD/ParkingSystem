<%-- 
    Document   : login
    Created on : 18 May, 2019, 11:58:04 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Login </title>
    </head>
    <body>
        <div class="body-content">
            <div id='loginform-cotainer'>

                <% if(session.getAttribute("errorMessage") != null) { %>    

                <span id="alertError" class='alert alert-danger'> ${errorMessage} </span>

                <% } %>
                <br>
                <form action="Login" method="post">
                    <h3 id="login-text">Log In</h3> <br>
                        <div class="input-group">
                            <span class="input-group-prepend"><span class="input-group-text"><i class="fa fa-user-o fa-lg"></i></span></span>
                            <input type="text" name="Username" maxlength="16" class="form-control" placeholder="Username" required>
                        </div>  <br>
                        <div class="input-group">
                            <span class="input-group-prepend"><span class="input-group-text"><i class="fa fa-lock fa-lg"></i> </span></span>
                            <input type="password" name="Password" placeholder="Password" class="form-control" required>
                        </div>  <br>

                    <input type="submit" class="btn btn-success" value="Log In">
                </form>
            </div>
        </div>
    </body>
</html>