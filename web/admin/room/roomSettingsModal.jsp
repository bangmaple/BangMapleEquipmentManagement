<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body id="page-top">

        <!-- Insert Modal-->
        <div class="modal fade" id="addRoomModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-info mr-2"></i>Please insert the fields in order to add a user!</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <form method="POST" action="MainController">
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-outdent"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" id="roomDescription"
                                       placeholder="Room Description" name="txtRoomDescription" pattern="^[a-zA-Z\d\.]{1,}$" required/>
                            </div>
                            <small class="form-text text-muted">Room description must not be blank.</small>
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
        <div class="modal fade" id="updateRoomModal" tabindex="-1" role="dialog">
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
                                        <i class="fas fa-home"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" value="<c:out value="${requestScope.queryUpdate.roomID}"/>" disabled>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-outdent mr-n1"></i>
                                    </div>
                                </div>
                                <textarea class="form-control" placeholder="Enter room description here.." name="txtRoomDescription" rows="3">${requestScope.queryUpdate.roomDescription}</textarea>
                            </div>
                        </div>

                        <div class="modal-body">If you are ready, click the 'Update' button below to perform action!</div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="roomManagement">Cancel</a>
                            <button type="submit" class="btn btn-dark">Update</a>
                                <input type="hidden" name="txtRoomID" value="${requestScope.queryUpdate.roomID}"/>
                                <input type="hidden" name="actionUpdate" value="updateRoom"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Session Timeout Modal-->
        <div class="modal fade" id="sessionTimeoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

        <!-- Conflict Room Modal-->
        <div class="modal fade" id="conflictRoomModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-trash mr-2"></i>Failed to remove this room</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body"><c:out value="${requestScope.conflictRoom}"/></div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" href="roomManagement">Close</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
