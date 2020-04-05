<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
    </head>
    <body style="background-image: url(image/background-main-1.jpg); background-repeat: initial; background-size: cover">
        <div class="container">
            <div id="draggable" class="my-5 col-md-4 mx-auto border rounded border-success bg-light shadow-sm form-group">
                <img class="img-fluid mb-2" src="image/fu-logo.png"/>
                <form action="TwoFactorAuthentication" id="form1" class="form-horizontal" method="POST">
                    <div id="alertLogin" class="col-md-12 alert alert-info"
                         role="alert">
                        We have just sent you an e-mail with 6-number password token in order to login to your dashboard.<br/>Please kindly check your mail and type it below!
                    </div>
                    <div class="col-md-13">
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-lock"></i>
                                </div>
                            </div>
                            <input type="text" pattern="\d*" minlength="6" maxlength="6" class="form-control" id="uname" placeholder="Password Token" name="txtToken" required>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="Authenticate"/>
                    <input type="hidden" name="txtUsername" value="${requestScope.username}"/>
                    <input class="mb-2 col-md-12 btn btn-outline-info" type="submit" value="Authenticate"/>
                </form>
            </div>
    </body>
</html>
