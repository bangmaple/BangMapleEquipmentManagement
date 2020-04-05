<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head></head>

    <body>
        <div id="draggable2" class="mt-auto col-md-4 mx-auto rounded border
             border-success bg-light shadow-sm form-group">
            <form id="form3" class="form-horizontal" action="MainController" method="POST">
                <img class="img-fluid" src="image/fu-logo.png"/>
                <div class="col-md-12 alert alert-info">
                    Please tell us more about yourself so as to recover your account!
                </div>
                <div class="col-md-13">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-user"></i>
                            </div>
                        </div>
                        <input type="text" class="form-control" id="uname3" placeholder="Username" name="txtUsernameForgot" required>
                    </div>
                </div>
                <input class="mt-2 col-md-12 btn btn-outline-success"
                       type="submit" name="action" value="Next step"/>
                <button type="button" class="mb-2 mt-2 col-md-12 btn btn-outline-warning"
                        onclick="forgotToLog()">Back to login</button>
            </form>
        </div>
    </body>
</html>
