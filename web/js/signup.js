
function matchPass() {
    var pass = document.getElementById("Password").value;
    var cpass = document.getElementById("cPassword").value;
    var out = document.getElementById("alertPassMatch");
    if(cpass === "") {
        out.hidden = true;
    }
    else if(pass === cpass) {
        out.hidden = false;
        out.innerHTML = "Matched!";
        out.className = "alert alert-success";
    }
    else {
        out.hidden = false;
        out.innerHTML = "Do Not Match!";
        out.className = "alert alert-danger";
    }
}


var strength = {
    0: "Worst",
    1: "Bad",
    2: "Weak",
    3: "Good",
    4: "Strong"
};

function checkStrength() {
    var password = document.getElementById('Password');
    var meter = document.getElementById('password-strength-meter');
    var text = document.getElementById('password-strength-text');
    var val = password.value;
    var result = zxcvbn(val);

    // Update the password strength meter
    meter.value = result.score;

    // Update the text indicator
    if (val !== "") {
        text.innerHTML = " " + strength[result.score]; 
    } else {
        text.innerHTML = "";
    }
}

function validateEmail() {
    var mail = document.getElementById("email").value;
    

    if(mail === "") 
        $("#validateEmailAlert").hide();
    else 
        $("#validateEmailAlert").show();
    if (/^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(mail)) {
        $("#validateEmailAlert").hide();
    } else {
        var span = document.getElementById("validateEmailAlert");
        span.innerHTML = "Invalid Email";
        span.className = "alert alert-danger";
    }
}


function alreadyExists(uname) {

    var xhttp = new XMLHttpRequest();
    var span = document.getElementById("validateUserAlert");
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            var res = JSON.parse(this.responseText);
            if(!res.doesExist) {
                span.innerHTML = "Available";
                span.className = "alert alert-success";
            }
            else {
                span.innerHTML = "Not Available";
                span.className = "alert alert-danger";
            }
            return res.doesExist();
        }
    };
    xhttp.open("GET", "/Hanashi/UsernameExists?uname="+uname, true);
    xhttp.send();
}


function validateUser() {
    var uname = document.getElementById("uname").value;

    if(uname === "") 
        $("#validateUserAlert").hide();
    else 
        $("#validateUserAlert").show();

    var unameregex = /^[a-zA-Z0-9_]+$/;
    if(unameregex.test(uname) === true) {
        alreadyExists(uname);
    }
    else {
        var span = document.getElementById("validateUserAlert");
        span.innerHTML = "Invalid Username";
        span.className = "alert alert-danger";
    }
}


function isValidated() {
    var uname = document.getElementById("uname").value;

    if(uname === "") 
        $("#validateUserAlert").hide();
    else 
        $("#validateUserAlert").show();

    var unameregex = /^[a-zA-Z0-9_]+$/;
    if(unameregex.test(uname) !== true) {  
        var span = document.getElementById("validateUserAlert");
        span.innerHTML = "Invalid Username";
        span.className = "alert alert-danger";
        return false;
    }





    var password = document.getElementById('Password');
    var meter = document.getElementById('password-strength-meter');
    var val = password.value;
    var result = zxcvbn(val);

    // Update the password strength meter
    meter.value = result.score;

    // Update the text indicator
    if (val !== "") {
        if(result.score < 1)
            return false;
    } else {
        return false;
    }






    var mail = document.getElementById("email").value;

    if(mail === "") 
        $("#validateEmailAlert").hide();
    else 
        $("#validateEmailAlert").show();
    if (/^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(mail)) {
        $("#validateEmailAlert").hide();
    } else {
        var span = document.getElementById("validateEmailAlert");
        span.innerHTML = "Invalid Email";
        span.className = "alert alert-danger";
        return false;
    }




    var pass = document.getElementById("Password").value;
    var cpass = document.getElementById("cPassword").value;
    var out = document.getElementById("alertPassMatch");
    if(cpass === "") {
        out.hidden = true;
        return false;
    }
    else if(pass === cpass) {
        out.hidden = false;
        out.innerHTML = "Matched!";
        out.className = "alert alert-success";
    }
    else {
        out.hidden = false;
        out.innerHTML = "Do Not Match!";
        out.className = "alert alert-danger";
        return false;
    }

    return true;
}

