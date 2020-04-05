<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
        <c:if test="${requestScope.changePasswordSuccessful != null}">
            <a class="dropdown-item clickDoneChangePassword" href="#" data-toggle="modal" data-target="#successfulChangePasswordModal"></a>
            <script>
                $(document).ready(function () {
                    $(".clickDoneChangePassword").trigger("click");
                });
            </script>
        </c:if>

        <!-- Settings Modal -->
        <div class="modal fade" id="settingsModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-cogs mr-2"></i>Settings</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <form action="UserSettingsController" method="POST">
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <c:if test="${sessionScope.userInfo.email eq ''}">
                                    <label>Two-factor authentication setting only accessible if your account is bound with an e-mail</label>
                                </c:if>
                                <c:if test="${sessionScope.userInfo.email ne ''}">
                                    <div class="custom-control custom-switch">
                                        <input type="hidden" name="txtUsername" value="${sessionScope.userInfo.username}"/>
                                        <input type="checkbox" name="chkTwoFactor" value="" class="custom-control-input" id="customSwitch1" ${sessionScope.twoFactor}>
                                        <label class="custom-control-label" for="customSwitch1">Toggle two-factor authentication</label>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-dark" data-dismiss="modal" value="Close"/>
                            <c:if test="${sessionScope.userInfo.email ne ''}">
                                <input type="submit" class="btn btn-dark" value="Apply"/>
                            </c:if>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Profile Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-user mr-2"></i>Profile</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <form action="UserProfileController" method="POST" enctype="multipart/form-data">
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-user"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" id="username" 
                                       name="txtUsername" value="${sessionScope.userInfo.username}" readonly/>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-list-alt"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" placeholder="Fullname"
                                       id="fullname" name="txtFullname" value="${sessionScope.userInfo.fullname}"/>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-envelope"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" name="txtEmail" id="email" value="${sessionScope.userInfo.email}"/>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-calendar"></i>
                                    </div>
                                </div>
                                <input class="form-control" placeholder="Date of Birth" name="txtDate" id="datepickerProfile" value="<fmt:formatDate value="${sessionScope.userInfo.doB}" pattern="dd/MM/yyyy"/>" width="351" readonly/>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-file-image"></i>
                                    </div>
                                </div>
                                <input class="form-control" type="file" placeholder="Insert image" name="txtAvatarImage" value=""/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input class="btn btn-dark" type="button" data-dismiss="modal" value="Close"/>
                            <input class="btn btn-dark" type="submit" value="Apply"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Change Password Modal -->
        <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-lock mr-2"></i>Change Password</h5>
                    </div>
                    <div class="modal-body">
                        If you really want to change the password, the enter the password and click 'Change'.
                    </div>
                    <form action="ChangePasswordController" id="changePasswordForm" method="POST">
                        <input type="hidden" name="txtUsername" value="${sessionScope.username}"/>
                        <div class="col-md-10 mx-auto">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-lock"></i>
                                    </div>
                                </div>
                                <input type="password" class="form-control" 
                                       placeholder="Enter password" id="password" name="txtPassword" value=""/>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-lock"></i>
                                    </div>
                                </div>
                                <input type="password" class="form-control" placeholder="Re-enter Password" id="confirmPassword"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-dark" type="submit">Change</button>
                        </div>
                    </form>
                </div>
            </div>
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

        <!-- Successful ChangePassword Modal-->
        <div class="modal fade" id="successfulChangePasswordModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-check mr-2"></i>Your password has changed successfully!</h5>
                    </div>
                    <div class="modal-body">Successfully changed your password.</div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" href="login.jsp">Done</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <form action="MainController" method="POST">
                            <button class="btn btn-dark" name="action" value="Logout">Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Session Timeout Modal-->
        <div class="modal fade" id="sessionTimeoutModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-spinner mr-2"></i>Session timeout</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">Your session has been timeout.<br/>Please login again!</div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" href="login.jsp">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
