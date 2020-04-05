<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head><%@include file="head.html" %></head>
    <body style="background-image: url(image/background-main-1.jpg); background-repeat: initial; background-size: cover">
        <c:if test="${sessionScope.userInfo.role eq 'Administrator'}"><c:redirect url="adminDashboard"/></c:if>
        <c:if test="${sessionScope.userInfo.role eq 'Technician'}"><c:redirect url="techDashboard"/></c:if>
        <c:if test="${sessionScope.userInfo.role eq 'User'}"><c:redirect url="userDashboard"/></c:if>
            <div class="container">
                <div id="draggable" class="mt-xl-5 col-md-4 mx-auto border rounded border-primary bg-light shadow-sm form-group ">
                    <form id="form1" class="form-horizontal" action="MainController" method="POST">
                        <img class="img-fluid" src="image/fu-logo.png"/>
                        <div id="alertLogin" class="col-md-12 alert alert-primary" role="alert">
                            Please login to get started
                        </div>
                        <div class="col-md-13">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" id="uname" placeholder="Username" name="txtUsername" required>
                            </div>
                        </div>
                        <div class="col-md-13">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                </div>
                                <input type="password" name="txtPassword" class="form-control" id="pwd" placeholder="Password" required>
                            </div>
                        </div>
                        <small id="PasswordHint" class="form-text text-muted">
                            We never store any password in our server!<br/>Your session ends every 30 minutes.
                        </small>
                        <div class="mb-3">
                            <a href="#" onclick="logToForgot()"
                               style="text-decoration: none">
                                <small>You got trouble during logging in?</small><br/>
                            </a>
                            <a href="#" onclick="logtoReg()"
                               style="text-decoration: none">
                                <small>Are you new here?</small>
                            </a><br/>
                        </div>
                        <input id="loginButton" class="mb-3 col-md-12 btn btn-outline-info" type="submit" name="action" value="Login"/>
                    </form>
                </div>
                <!--Register form-->
            <%@include file="register.jsp" %>
            <!--Forget password form-->
            <%@include file="forgetPassword.jsp" %>
        </div>
        <script>
            function regToLog() {
                $("#form2").hide(1000);
                $("#form1").show(1000);
                $("#draggable").addClass("border border-primary");
                $("#draggable1").removeClass("border border-warning");
                $("#draggable2").removeClass("border border-success");
            }
            function logtoReg() {
                $("#form1").hide(1000);
                $("#form2").show(1000);
                $("#draggable").removeClass("border border-primary");
                $("#draggable1").addClass("border border-warning");
            }

            function logToForgot() {
                $("#form1").hide(1000);
                $("#draggable").removeClass("border border-primary");
                $("#draggable2").addClass("border border-success");
                $("#form3").show(1000);
            }

            function forgotToLog() {

                $("#form3").hide(1000);
                $("#draggable2").removeClass("border border-success");
                $("#draggable").addClass("border border-primary");
                $("#form1").show(1000);
            }

            $(function () {
                $("#draggable").draggable();
            });
            $(function () {
                $("#draggable1").draggable();
            });
            $(function () {
                $("#draggable2").draggable();
            });

            $(document).ready(function () {
                $("#form2").hide();
                $("#form3").hide();
                $("#draggable1").removeClass("border border-warning");
                $("#draggable2").removeClass("border border-success");
                $("#hide").click(function () {
                    $("#form1").hide(1000);
                    $("#form2").show(1000);
                });
                $("#show").click(function () {
                    $("#form1").show(1000);
                });
                $("#disable").click(function () {
                    $("#form1 input").prop("disabled", true);
                });
                $("#enable").click(function () {
                    $("#form1 input").prop("disabled", false);
                });
                $("#moveBack").click(function () {
                    $("#draggable1").appendTo("#dead").fadeIn("slow");
                });
            });
        </script>
    </body>
</html>
