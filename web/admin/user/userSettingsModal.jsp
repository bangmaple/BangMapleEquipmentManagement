<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body id="page-top">
        <!-- Insert Modal-->
        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-male mr-2"></i>Please insert the fields in order to add a user!</h5>
                    </div>
                    <form id="insertFormModal" method="POST" action="MainController">
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-user"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" placeholder="Username" name="txtUsername" pattern="^[a-z\d\.]{3,}$" id="txtUsername" required/>
                            </div>
                            <small class="form-text text-muted">Only accept minimum 3 letters with no spacebar.</small>
                        </div>

                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-lock"></i>
                                    </div>
                                </div>
                                <input type="password" class="form-control" id="password" placeholder="Password" pattern="^[a-z\d\.]{3,}$" name="txtPassword" required/>
                            </div>
                            <small class="form-text text-muted">Only accept minimum 3 letters with no spacebar.</small>
                        </div>

                        <div class="col-md-10 mx-auto mt-2">
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

                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-address-card mr-n1"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" placeholder="Fullname" name="txtFullname">
                            </div>
                            <small class="text-muted form-text">Fullname should be meaningful.</small>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-envelope mr-n1"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" id="emailRegister"
                                       placeholder="E-mail" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" name="txtEmail" required>
                            </div>
                            <small class="form-text text-muted">Only accept correct e-mail format.</small>
                        </div>

                        <div class="col-md-10 mx-auto mt-2">
                            <label class="sr-only">
                                Date of Birth
                            </label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-calendar"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" 
                                       placeholder="Date of Birth" name="txtDate" id="datepickerAdd" width="351" readonly/>
                            </div>
                            <small class="form-text text-muted">Date of birth should be correct.</small>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-wrench mr-n1"></i>
                                    </div>
                                </div>
                                <select name="txtRole" id="selection" class="form-control">
                                    <option value="User">Role: User</option>
                                    <option value="Technician">Role: Technician</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-body">If you are ready, click the 'Add' button below to perform action!</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-dark" name="action" value="Add"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Update Modal-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-magic mr-2"></i>Please update the fields you want!</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <form method="POST" action="UpdateController">
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-user"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" id="usernameUpdate"
                                       placeholder="Username" name="txtUsername" value="${requestScope.queryUpdate.username}" readonly>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-address-card mr-n1"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" id="fullnameUpdate"
                                       placeholder="Fullname" name="txtFullname" value="${requestScope.queryUpdate.fullname}">
                            </div>
                        </div>

                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-envelope mr-n1"></i>
                                    </div>
                                </div>
                                <input type="email" class="form-control" id="emailUpdate" 
                                       placeholder="E-mail" name="txtEmail" value="${requestScope.queryUpdate.email}" pattern="[^@\s]+@[^@\s]+\.[^@\s]+"> 
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-calendar"></i>
                                    </div>
                                </div>
                                <input class="form-control" placeholder="Date of Birth" name="txtDate" id="datepickerUpdate" 
                                       value="<fmt:formatDate value="${requestScope.queryUpdate.doB}" pattern="dd/MM/yyyy"/>" width="351" readonly />
                            </div>
                        </div>

                        <div class="modal-body">If you are ready, click the 'Update' button below to perform action!</div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="userManagement">Cancel</a>
                            <input type="hidden" name="actionUpdate" value="updateUser"/>
                            <button type="submit" class="btn btn-dark">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Duplicated Email Modal-->
        <div class="modal fade" id="duplicateEmailModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-info mr-2"></i>Error!</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">${requestScope.duplicateEmail}</div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" href="userManagement">Login</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Conflict User Modal-->
        <div class="modal fade" id="conflictUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-trash mr-2"></i>Failed to remove this user</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body"><c:out value="${requestScope.conflictUser}"/></div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" href="roomManagement">Close</a>
                    </div>
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
    </body>

</html>
