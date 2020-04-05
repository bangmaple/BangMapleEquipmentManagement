<!DOCTYPE html>
<html>
    <head><%@include file="head.html" %></head>
    <body style="background-image: url(image/background-main-1.jpg);
          background-repeat: initial; background-size: cover">
        <div class="container">
            <div id="draggable" class="my-5 col-md-4 mx-auto border rounded border-success
                 bg-light shadow-sm form-group">
                    <img class="img-fluid mb-2" src="image/fu-logo.png"/>
                    <div id="alertLogin" class="col-md-12 alert alert-success"
                         role="alert">
                        We sent you a verification email so as to verify your registration/password recovery before using our service! Please wait some seconds.
                    </div>
                    <a href="login.jsp"><button id="loginButton" class="mb-2 col-md-12 btn btn-outline-info">Proceed to login</button></a>
            </div>
    </body>
</html>