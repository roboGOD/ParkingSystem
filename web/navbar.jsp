        

        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #1f0f66;">
          <a class="navbar-brand" href="index.jsp"> Parking System </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"> About </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
            </ul>
              
            <ul class="navbar-nav">
                
                <% if(session.getAttribute("user") == null) { %>
                
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"> Login </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-primary" href="signup.jsp">  Sign Up </a>
                </li>
                
                <% } else { %>
                
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-primary" href="Login"> Logout </a>
                </li>
                
                <% } %>
                
            </ul>
              
          </div>
        </nav>