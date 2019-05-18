<%-- 
    Document   : signup
    Created on : 18 May, 2019, 11:58:19 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Sign Up </title>
    </head>
    <body>
        <div class="body-content">
            <div id="signupform">
                
                <% if(session.getAttribute("errorMessage") != null) { %>
                    <span class="alertError" class='alert alert-danger'>  ${errorMessage} </span>
                <% } %>
                <br>
                <form  action="SignUp" method="post" onsubmit="return isValidated();">
                    <h3 id="signup-text"> Sign Up </h3><br>
                    <div class="input-group">
                        <span class="input-group-prepend"><span class="input-group-text"><i class="fa fa-user-o fa-lg"></i></span></span>
                        <input type="text" id="uname" name="Username" placeholder="Username" maxlength="16" class="form-control" onblur="validateUser();" required>
                    </div> 
                    <div class="alerts-div">
                        <span id="validateUserAlert"> </span>
                    </div>  <br>

                    <div class="input-group">
                        <span class="input-group-prepend"><span class="input-group-text"><i class="fa fa-envelope fa-lg"></i></span></span>
                        <input type="text" id="email" name="Email" placeholder="Email" maxlength="50" onblur="validateEmail();" class="form-control" required>
                    </div> 
                    <div class="alerts-div">
                        <span id="validateEmailAlert"> </span>
                    </div>  <br>

                    <div id="password-div">
                        <div class="input-group">
                            <span class="input-group-prepend"><span class="input-group-text"><i class="fa fa-lock fa-lg"></i></span></span>
                            <input type="password" name="Password" id="Password" placeholder="Password" onkeyup="checkStrength()" class="form-control" required>
                        </div>
                    </div>
                    <div id="pass-alerts-div">
                        <span id="password-strength-text"> </span>
                    </div>
                    <meter max="4" id="password-strength-meter"></meter> <br>

                    <div class="input-group">
                        <span class="input-group-prepend"><span class="input-group-text"><i class="fa fa-check fa-lg"></i></span></span>
                        <input type="password" id="cPassword" name="cPassword" placeholder="Confirm Password" onkeyup="matchPass()" class="form-control" required>
                    </div>
                    <div class="alerts-div">
                        <span id="alertPassMatch"> </span>
                    </div>  <br>

                    <div id="signup-submit"><input type="submit" class="btn btn-success" value="Sign Up"></div>
                </form>
            </div>
        </div>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.2.0/zxcvbn.js"></script>
        <script src="js/signup.js"> </script>
    </body>
</html>