<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="now" class="java.util.Date" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
        <!-- View More Modal-->
        <div class="modal fade" id="viewMoreEquipStatisticsModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-info mr-2"></i>More Information</h5>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">User currently using this equipment</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-user"></i>
                                </div>
                            </div>
                            <c:if test="${requestScope.equipUsingInfo.username.fullname eq null or requestScope.equipUsingInfo.username.fullname eq ''}">
                                <input type="text" class="form-control" value="-" readonly/>
                            </c:if>
                            <c:if test="${requestScope.equipUsingInfo.username.fullname ne null and requestScope.equipUsingInfo.username.fullname ne ''}">
                                <input type="text" class="form-control" value="${requestScope.equipUsingInfo.username.fullname}" readonly/>
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
                            <c:if test="${requestScope.equipUsingInfo.equipID.equipName eq null or requestScope.equipUsingInfo.equipID.equipName eq ''}">
                                <input type="text" class="form-control" value="-" readonly/>
                            </c:if>
                            <c:if test="${requestScope.equipUsingInfo.equipID.equipName ne null or requestScope.equipUsingInfo.equipID.equipName ne ''}">
                                <input type="text" class="form-control" value="${requestScope.equipUsingInfo.equipID.equipName}" readonly/>
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
                            <c:if test="${requestScope.equipUsingInfo.roomID.roomDescription eq null or requestScope.equipUsingInfo.roomID.roomDescription eq ''}">
                                <input type="text" class="form-control" value="-" readonly/>
                            </c:if>
                            <c:if test="${requestScope.equipUsingInfo.roomID.roomDescription ne null or requestScope.equipUsingInfo.roomID.roomDescription ne ''}">
                                <input type="text" class="form-control" value="${requestScope.equipUsingInfo.roomID.roomDescription}" readonly/>
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
                            <input type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.equipUsingInfo.equipDateWarranty}"/>" readonly/>
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
                            <input type="text" class="form-control" value="${requestScope.equipUsingInfo.equipStatus}" readonly/>
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
                            <input type="text" class="form-control" value="${requestScope.equipUsingInfo.numOfRepair}" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <c:if test="${requestScope.equipUsingInfo.equipID.equipImage !=null}">
                            <small class="form-text text-muted">Equipment Image</small>
                            <div class="input-group mb-2">
                                <img class="img-fluid" src="uploads/equipments/${requestScope.equipUsingInfo.equipID.equipImage}" alt="Error"/>
                            </div>
                        </c:if>
                    </div>
                    <div class="modal-footer">
                        <a href="techEquipmentStatistics" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- View More Modal-->
        <div class="modal fade" id="equipLocationHistoryTable" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-info mr-2"></i>More Information</h5>
                    </div>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-dark">Equipment Location History Table</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTableEquipmentLocationHistory" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Equip Location ID</th>
                                            <th>Last Location</th>
                                            <th>User Change Location</th>
                                            <th>Change Location Date</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>Equip Location ID</th>
                                            <th>Last Location</th>
                                            <th>User Change Location</th>
                                            <th>Change Location Date</th>
                                            <th>Description</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:if test="${requestScope.equipLocationHistoryList !=null}">
                                            <c:if test="${not empty requestScope.equipLocationHistoryList}" var="checkList">
                                                <c:forEach var="dto" items="${requestScope.equipLocationHistoryList}" varStatus="counter">
                                                    <tr>
                                                        <td><c:out value="${counter.count}"/></td>
                                                        <td><c:out value="${dto.equipLocHistoryID}"/></td>
                                                        <td><c:out value="${dto.roomID.roomID}"/></td>
                                                        <td><c:out value="${dto.usernameChange.username}"/></td>
                                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${dto.dateChange}"/></td>
                                                        <td><c:out value="${dto.changeLocationDescription}"/></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${!checkList}">No record found!</c:if>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="techEquipmentStatistics" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#dataTableEquipmentLocationHistory').DataTable();
            });
        </script>


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
