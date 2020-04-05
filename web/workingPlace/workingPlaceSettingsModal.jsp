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
        <div class="modal fade" id="viewMoreEquipUsingModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-info mr-2"></i>More Information</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">User currently using this equipment</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-user"></i>
                                </div>
                            </div>
                            <c:if test="${requestScope.equipUsing.username.fullname eq null or requestScope.equipUsing.username.fullname eq ''}">
                                <input type="text" class="form-control" value="-" readonly/>
                            </c:if>
                            <c:if test="${requestScope.equipUsing.username.fullname ne null and requestScope.equipUsing.username.fullname ne ''}">
                                <input type="text" class="form-control" value="${requestScope.equipUsing.username.fullname}" readonly/>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Equipment name</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-cube"></i>
                                </div>
                            </div>
                            <c:if test="${requestScope.equipUsing.equipID.equipName eq null or requestScope.equipUsing.equipID.equipName eq ''}">
                                <input type="text" class="form-control" value="-" readonly/>
                            </c:if>
                            <c:if test="${requestScope.equipUsing.equipID.equipName ne null or requestScope.equipUsing.equipID.equipName ne ''}">
                                <input type="text" class="form-control" value="${requestScope.equipUsing.equipID.equipName}" readonly/>
                            </c:if>

                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Room description</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-home"></i>
                                </div>
                            </div>
                            <c:if test="${requestScope.equipUsing.roomID.roomDescription eq null or requestScope.equipUsing.roomID.roomDescription eq ''}">
                                <input type="text" class="form-control" value="-" readonly/>
                            </c:if>
                            <c:if test="${requestScope.equipUsing.roomID.roomDescription ne null or requestScope.equipUsing.roomID.roomDescription ne ''}">
                                <input type="text" class="form-control" value="${requestScope.equipUsing.roomID.roomDescription}" readonly/>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">End of warranty date</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-wrench"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.equipUsing.equipDateWarranty}"/>" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Equipment Status</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-cog"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.equipUsing.equipStatus}" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Number of equipment repairs</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-wrench"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.equipUsing.numOfRepair}" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <c:if test="${requestScope.equipUsing.equipID.equipImage !=null}">
                            <small class="form-text text-muted">Equipment Image</small>
                            <div class="input-group mb-2">
                                <img class="img-fluid" src="uploads/equipments/${requestScope.equipUsing.equipID.equipImage}" alt="Error"/>
                            </div>
                        </c:if>
                    </div>
                    <div class="modal-footer">
                        <a href="workingPlace" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Request Repair Modal-->
        <div class="modal fade" id="requestRepairModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-flag mr-2"></i>Request a repair</h5>
                    </div>
                    <c:if test="${now.time gt requestScope.equipUsingID.equipDateWarranty.time}">
                        <div class="modal-body">This equipment is out-of-warranty!<br/>Please consider buying a new one!</div>
                        <div class="modal-footer">
                            <a class="btn btn-dark" href="workingPlace">Close</a>
                        </div>
                    </c:if>
                    <c:if test="${now.time le requestScope.equipUsingID.equipDateWarranty.time}">
                        <form method="POST" action="requestRepair">
                            <div class="modal-body">Are you sure want to request a repair for this equipment?<br/>Please choose this equipment situation before requesting.
                                <div class="col-md-10 mx-auto mt-2">
                                    <small class="form-text text-muted">Write down your repair request description here.</small>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="fas fa-outdent"></i>
                                            </div>
                                        </div>
                                        <textarea rows="3" name="txtRepairRequest" placeholder="Your repair request description goes here..." class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-10 mx-auto mt-2">
                                    <small class="form-text text-muted">Equipment Situation</small>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="fas fa-wrench"></i>
                                            </div>
                                        </div>
                                        <select class="form-control" name="txtEquipStatus" required>
                                            <option class="form-text" disabled selected value>-- Please choose --</option>
                                            <option class="form-text" value="BROKEN">Broken</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a class="btn btn-secondary" href="workingPlace">Cancel</a>
                                    <input type="hidden" name="txtEquipUsingID" value="${requestScope.equipUsingID.equipByUserID}"/>
                                    <input type="hidden" name="action" value="successRequest"/>
                                    <button type="submit" class="btn btn-dark">Request</button>
                                </div>
                            </div>
                        </form>
                    </c:if>
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
