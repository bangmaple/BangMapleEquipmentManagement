<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="now" class="java.util.Date" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-dark" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-dark" href="LogoutController">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- View More Modal-->
        <div class="modal fade" id="viewInfoEquipReqModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-info mr-2"></i>More Information</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">Equipment Request ID</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-tag"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<c:out value="${requestScope.equipReq.equipReqID}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">Equipment ID</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-tag"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<c:out value="${requestScope.equipReq.equipByUserID.equipID.equipID}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">Equipment Name</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-align-justify"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<c:out value="${requestScope.equipReq.equipByUserID.equipID.equipName}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">Equipment Type</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-cog"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<c:out value="${requestScope.equipReq.equipByUserID.equipID.equipType}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Username request repairing</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-user"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<c:out value="${requestScope.equipReq.usernameRequest.username}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Request Repairing Date</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-calendar"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.equipReq.repairRequestDate}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Request Repairing Description</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-outdent"></i>
                                </div>
                            </div>
                            <textarea rows="3" readonly="true" class="form-control"><c:out value="${requestScope.equipReq.repairRequestDescription}"/></textarea>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Username response</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-user"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<c:out value="${requestScope.equipReq.usernameResponse.username}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Response Repairing Description</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-outdent"></i>
                                </div>
                            </div>
                            <textarea rows="3" class="form-control" readonly="true"><c:out value="${requestScope.equipReq.repairResponseDescription}"/></textarea>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Repairing Start Date</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-calendar"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.equipReq.repairStartDate}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Repairing End Date</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-calendar"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.equipReq.repairEndDate}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Repair result</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-wrench"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.equipReq.repairResult}" readonly/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="adminEquipmentHistory" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Remove Modal-->
        <div class="modal fade" id="removeEquipReqModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-spinner mr-2"></i>Removed successfully!</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">Successfully removed the following equipment history entry.</div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" href="adminEquipmentHistory">Close</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
