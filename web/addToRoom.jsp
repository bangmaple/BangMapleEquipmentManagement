<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="head.html" %></head>
    <body id="page-top">
        <%@include file="admin/adminHeadBodyScript.jsp" %>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="genericSidebar.jsp" %>
            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <%@include file="genericTopbar.jsp" %>
                    <c:if test="${empty requestScope.uINFO or empty requestScope.eINFO or empty requestScope.rINFO}"><c:redirect url="login.jsp"></c:redirect></c:if>
                    <c:if test="${sessionScope.userInfo != null}">
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- DataTales Example -->
                            <form action="AddToRoomController" method="POST">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-dark">Users Table</h6>
                                        <small class="form-text text-muted">Please select a user to use an equipment in a room.</small>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Username</th>
                                                        <th>Fullname</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Username</th>
                                                        <th>Fullname</th>
                                                        <th></th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:if test="${requestScope.uINFO !=null}">
                                                        <c:if test="${not empty requestScope.uINFO}" var="checkList">
                                                            <c:forEach var="dto" items="${requestScope.uINFO}" varStatus="counter">
                                                                <tr>
                                                                    <td><c:out value="${counter.count}"/></td>
                                                                    <td><c:out value="${dto.username}"/></td>
                                                                    <td>
                                                                        <c:if test="${empty dto.fullname}">-</c:if>
                                                                        <c:if test="${not empty dto.fullname}">${dto.fullname}</c:if>
                                                                        </td>
                                                                        <td><input type="radio" id="customRadio" name="txtUsername" value="${dto.username}" required/></td>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <c:if test="${!checkList}">No record found!</c:if>
                                                        </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-dark">Equipments Table</h6>
                                        <small class="text-muted form-text">Please select one equipment to add to the room. Make sure to choose a user first.</small>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable2" width="%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>ID</th>
                                                        <th>Equipment Name</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>ID</th>
                                                        <th>Equipment Name</th>
                                                        <th></th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:if test="${requestScope.eINFO !=null}">
                                                        <c:if test="${not empty requestScope.eINFO}" var="checkList">
                                                            <c:forEach var="dto" items="${requestScope.eINFO}" varStatus="counter">
                                                                <tr>
                                                                    <td><c:out value="${counter.count}"/></td>
                                                                    <td><c:out value="${dto.equipID}"/></td>
                                                                    <td>
                                                                        <c:if test="${empty dto.equipName}">-</c:if>
                                                                        <c:if test="${not empty dto.equipName}">${dto.equipName}</c:if>
                                                                        </td>
                                                                        <td><input type="radio" id="customRadio" name="txtEquipID" value="${dto.equipID}" required/></td>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${!checkList}">No record found!</c:if>
                                                        </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-dark">Rooms Table</h6>
                                        <small class="text-muted form-text">Please select a room. Make sure to select an user and an equipment first!</small>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable3" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Room ID</th>
                                                        <th>Room Description</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Room ID</th>
                                                        <th>Room Description</th>
                                                        <th></th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:if test="${requestScope.rINFO !=null}">
                                                        <c:if test="${not empty requestScope.rINFO}" var="checkList">
                                                            <c:forEach var="dto" items="${requestScope.rINFO}" varStatus="counter">
                                                                <tr>
                                                                    <td><c:out value="${counter.count}"/></td>
                                                                    <td><c:out value="${dto.roomID}"/></td>
                                                                    <td>
                                                                        <c:if test="${empty dto.roomDescription}">-</c:if>
                                                                        <c:if test="${not empty dto.roomDescription}">${dto.roomDescription}</c:if>
                                                                        </td>
                                                                        <td><input type="radio" id="customRadio" name="txtRoomID" value="${dto.roomID}" required></td>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${!checkList}">No record found!</c:if>
                                                        </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="add" value=""/>
                                <button type="submit" class="btn btn-info btn-icon-split">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-plus"></i>
                                    </span>
                                    <span class="text">Add to Room</span>
                                </button>
                            </form>
                        </c:if>
                    </div>
                    <!-- End of Main Content -->
                    <script>
                        $(document).ready(function () {
                            $('#dataTable1').DataTable();
                            $('#dataTable2').DataTable();
                            $('#dataTable3').DataTable();
                        });
                    </script>
                    <!-- Footer -->
                    <%@include file="genericFooter.html" %>
                    <!-- End of Footer -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
            <%@include file="admin/adminSettingsModal.jsp" %>
            <%@include file="genericFooterScript.html"%>
    </body>

</html>
