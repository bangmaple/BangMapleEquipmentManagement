<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="head.html" %></head>
    <body id="page-top">
        <%@include file="workingPlace/headBodyScript.jsp" %>
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
                            <%@include file="workingPlace/heading.html" %>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-dark">Working place</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Equipment ID</th>
                                                    <th>Username</th>
                                                    <th>Room ID</th>
                                                    <th>Date Bought</th>
                                                    <th>Warranty</th>
                                                    <th>Equipment Status</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Equipment ID</th>
                                                    <th>Username</th>
                                                    <th>Room ID</th>
                                                    <th>Date Bought</th>
                                                    <th>Warranty</th>
                                                    <th>Equipment Status</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <c:if test="${requestScope.INFO !=null}">
                                                    <c:if test="${not empty requestScope.INFO}" var="checkList">
                                                        <c:forEach var="dto" items="${requestScope.INFO}" varStatus="counter">
                                                            <tr>
                                                                <td><c:out value="${counter.count}"/></td>
                                                                <td><c:out value="${dto.equipID.equipID}"/> </td>
                                                                <td><c:out value="${dto.username.username}"/></td>
                                                                <td><c:out value="${dto.roomID.roomID}"/></td>
                                                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${dto.equipDateBought}"/></td>
                                                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${dto.equipDateWarranty}"/></td>
                                                                <td><c:out value="${dto.equipStatus}"/></td>
                                                                <td>
                                                                    <form action="viewMoreUsersWorking" method="POST">
                                                                        <input type="hidden" name="equipUsing" value="${dto.equipByUserID}"/>
                                                                        <button data-toggle="tooltip" data-placement="top" title="View more information" type="submit" class="btn-circle btn-info fas fa-info"></button>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${dto.equipStatus eq 'FIXING'}">
                                                                        <button type="button" data-toggle="tooltip" data-placement="top" title="Currently repairing..." class="btn-circle btn-info-outline fas fa-wrench" disabled="true"></button>
                                                                    </c:if>
                                                                    <c:if test="${dto.equipStatus ne 'FIXING'}">
                                                                        <c:if test="${dto.equipStatus eq 'OK'}">
                                                                            <form action="requestRepair" method="POST">
                                                                                <input type="hidden" name="action" value="request"/>
                                                                                <input type="hidden" name="txtEquipUsingID" value="${dto.equipByUserID}"/>
                                                                                <button type="submit" data-toggle="tooltip" data-placement="top" title="Request a repair" class="btn-circle btn-warning fas fa-flag"></button>
                                                                            </form>
                                                                        </c:if>
                                                                        <c:if test="${dto.equipStatus ne 'OK'}">
                                                                            <form action="requestRepair" method="POST">
                                                                                <input type="hidden" name="action" value="revertRequest"/>
                                                                                <input type="hidden" name="txtEquipUsingID" value="${dto.equipByUserID}"/>
                                                                                <button type="submit" data-toggle="tooltip" data-placement="top" title="Undo repair request" class="btn-circle btn-danger fas fa-undo"></button>
                                                                            </form>
                                                                        </c:if>
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
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
            <%@include file="workingPlace/workingPlaceSettingsModal.jsp" %>
            <%@include file="genericSettingsModal.jsp" %>
            <%@include file="genericFooterScript.html"%>
    </body>
</html>
