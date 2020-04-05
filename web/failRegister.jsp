<!DOCTYPE html>
<html>
    <head><%@include file="head.html" %></head>
    <body style="background-image: url(image/background-main-1.jpg);
          background-repeat: initial; background-size: cover">
        <div class="container">
            <div id="draggable" class="my-5 col-md-4 mx-auto border rounded border-success
                 bg-light shadow-sm form-group">
                <form id="form1" class="form-horizontal" action="login.jsp" method="POST">
                    <img class="img-fluid mb-2" src="image/fu-logo.png"/>
                    <div id="alertLogin" class="col-md-12 alert alert-danger"
                         role="alert">
                        This account has already been activated or failed during registration! If this is a problem, please contact to the Administrator. Thank you!
                    </div>
                    <button id="loginButton" class="mb-2 col-md-12 btn btn-outline-info">Proceed to login</button>
                </form>
            </div>
    </body>
</html>