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
        <div id="draggable1" class="mt-auto col-md-4 mx-auto rounded border border-warning bg-light shadow-sm form-group">
            <form id="form2" class="form-horizontal" action="MainController" method="POST">
                <img class="img-fluid" src="image/fu-logo.png"/>
                <div class="col-md-12 alert alert-primary">Please fill out all necessary fields before submitting!</div>
                <div class="col-md-13">
                    <div id="idUser" class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-user mr-1"></i></div>
                        </div>
                        <input type="text" class="form-control" id="uname2" placeholder="Username" name="txtUsernameRegistration" pattern="^[a-z\d\.]{3,}$" required>
                        <small class="text-muted form-text">Only accept minimum 3 letters with no spacebar.</small>
                    </div>
                </div>
                <div class="col-md-13">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-lock"></i>
                            </div>
                        </div>
                        <input type="password" class="form-control" id="password" placeholder="Password" pattern="^[a-z\d\.]{3,}$" name="txtPasswordRegistration" required/>
                    </div>
                    <small class="form-text text-muted">Only accept minimum 3 letters with no spacebar.</small>
                </div>

                <div class="col-md-13">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-lock"></i>
                            </div>
                        </div>
                        <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm password" pattern="^[a-z\d\.]{3,}$" required/>
                    </div>
                    <small class="form-text text-muted">Confirm password must match.</small>
                </div>
                <div class="col-md-13">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-envelope"></i></div>
                        </div>
                        <input type="text" class="form-control" id="idEmail" placeholder="Email" name="txtEmailRegistration" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required/>
                    </div>
                </div>
                <small class="form-text text-muted">Only accept correct e-mail format.</small> 
                <div class="dropdown-divider"></div>
                <div class="col-md-13">
                    <label class="sr-only" for="role">Role: User</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-wrench"></i></div>
                        </div>
                        <input type="text" class="form-control" id="role" placeholder="Role: User" disabled>
                    </div>
                </div>
                <small id="PasswordHint" class="form-text text-muted">
                    We never store any password in our server!
                </small>
                <input class="mt-2 col-md-12 btn btn-outline-warning" type="submit" name="action" value="Register"/>
                <button type="button" class="mb-2 mt-2 col-md-12 btn btn-outline-danger" onclick="regToLog()">Back to login</button>
            </form>
        </div>
        <script>
            var password = document.getElementById("password");
            var confirmPassword = document.getElementById("confirmPassword");
            function validatePassword() {
                if (password.value != confirmPassword.value) {
                    confirmPassword.setCustomValidity("Confirm password must match the original password.");
                } else {
                    confirmPassword.setCustomValidity('');
                }
            }
            password.onchange = validatePassword;
            confirmPassword.onkeyup = validatePassword;
        </script>
    </body>
</html>
