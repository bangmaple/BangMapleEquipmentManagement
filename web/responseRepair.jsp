<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="head.html" %></head>
    <body id="page-top">
        <%@include file="tech/responseRepairHeadBodyScript.jsp" %>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!--Sidebar-->
            <%@include file="genericSidebar.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <%@include file="genericTopbar.jsp" %>
                    <c:if test="${sessionScope.userInfo != null}">
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- Page Heading -->
                            <%@include file="tech/responseRepairHeading.html" %>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-dark">Repair an equipment</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTableResponseRepair" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Equipment ID</th>
                                                    <th>Username</th>
                                                    <th>Room ID</th>
                                                    <th>Date Bought</th>
                                                    <th>Warranty</th>
                                                    <th>Status</th>
                                                    <th>Technician</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <td></td>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>Equipment ID</th>
                                                    <th>Username</th>
                                                    <th>Room ID</th>
                                                    <th>Date Bought</th>
                                                    <th>Warranty</th>
                                                    <th>Status</th>
                                                    <th>Technician</th>
                                                    <th></th>
                                                    <th></th>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <c:if test="${requestScope.INFO !=null}">
                                                    <c:if test="${not empty requestScope.INFO}" var="checkList">
                                                        <c:forEach var="dto" items="${requestScope.INFO}">
                                                            <tr>
                                                                <td><c:out value="${dto.equipID.equipID}"/></td>
                                                                <td><c:out value="${dto.username.username}"/></td>
                                                                <td><c:out value="${dto.roomID.roomID}"/></td>
                                                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${dto.equipDateBought}"/></td>
                                                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${dto.equipDateBought}"/></td>
                                                                <td><c:out value="${dto.equipStatus}"/></td>
                                                                <c:if test="${dto.usernameResponse eq null}">
                                                                    <td>-</td>
                                                                </c:if>
                                                                <c:if test="${dto.usernameResponse ne null}">
                                                                    <td><c:out value="${dto.usernameResponse.username}"/></td>
                                                                </c:if>
                                                                <td>
                                                                    <form action="responseRepair" method="POST">
                                                                        <input type="hidden" name="action" value="queryUser"/>
                                                                        <input type="hidden" name="txtUsername" value="${dto.username.username}"/>
                                                                        <button type="submit" class="btn-circle btn-info fas fa-user" 
                                                                                data-toggle="tooltip" data-placement="top" title="View user info"></button>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <form action="responseRepair" method="POST">
                                                                        <input type="hidden" name="action" value="queryRoom"/>
                                                                        <input type="hidden" name="txtRoomID" value="${dto.roomID.roomID}"/>
                                                                        <button type="submit" class="btn-circle btn-info fas fa-home" 
                                                                                data-toggle="tooltip" data-placement="top" title="View room info"></button>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <form action="responseRepair" method="POST">
                                                                        <input type="hidden" name="action" value="queryEquip"/>
                                                                        <input type="hidden" name="txtEquipID" value="${dto.equipID.equipID}"/>
                                                                        <button type="submit" class="btn-circle btn-info fas fa-cube" 
                                                                                data-toggle="tooltip" data-placement="top" title="View equipment info"></button>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${dto.usernameResponse ne null}">
                                                                        <c:if test="${dto.usernameResponse.username eq sessionScope.userInfo.username}">
                                                                            <c:if test="${dto.equipStatus eq 'FIXING'}">
                                                                                <form action="responseRepair" method="POST">
                                                                                    <input type="hidden" name="action" value="queryFinishRepair"/>
                                                                                    <input type="hidden" name="txtEquipmentReqID" value="${dto.equipReqID}"/>
                                                                                    <button type="submit" class="btn-circle btn-success fas fa-wrench" 
                                                                                            data-toggle="tooltip" data-placement="top" title="Take action this equipment"></button>
                                                                                </form>
                                                                            </c:if>
                                                                        </c:if>
                                                                        <c:if test="${dto.usernameResponse.username ne sessionScope.userInfo.username}">
                                                                            <button type="button" class="btn-circle btn-danger-outline fas fa-wrench" 
                                                                                    data-toggle="tooltip" data-placement="top" title="Currently repairing this equipment" disabled="true"></button>
                                                                        </c:if>
                                                                    </c:if>
                                                                    <c:if test="${dto.equipStatus ne 'FIXING'}">
                                                                        <form action="responseRepair" method="POST">
                                                                            <input type="hidden" name="action" value="queryRepair"/>
                                                                            <input type="hidden" name="txtEquipmentReqID" value="${dto.equipReqID}"/>
                                                                            <button type="submit" class="btn-circle btn-warning fas fa-wrench" 
                                                                                    data-toggle="tooltip" data-placement="top" title="Take action this equipment"></button>
                                                                        </form>
                                                                    </c:if>
                                                                </td>
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
                        </div>
                        <!-- /.container-fluid -->
                    </c:if>
                </div>
                <!-- End of Main Content -->
                <%@include file="genericFooter.html" %>
            </div>
            <script>
                $(document).ready(function() {
                   $('#dataTableResponseRepair').DataTable(); 
                });
            </script>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
            <%@include file="tech/responseRepairSettingsModal.jsp" %>
            <%@include file="genericSettingsModal.jsp" %>
            <%@include file="genericFooterScript.html"%>
    </body>

</html>
