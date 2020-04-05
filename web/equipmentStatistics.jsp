<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="head.html" %></head>
    <body id="page-top">
        <%@include file="admin/headBodyScript.jsp" %>
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
                            <%@include file="admin/equipStatisticsHeading.html" %>

                            <div class="col-md-7 px-3 mb-5">
                                <form action="equipmentStatistics" method="POST">
                                    <div class="mx-auto">
                                        <small class="form-text text-muted">Search statistics by date range</small>
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fas fa-calendar"></i>
                                                </div>
                                            </div>
                                            <input class="form-control" placeholder="From-" value="" name="txtDateFrom" width="115" id="datepickerDateFrom" readonly />
                                            <input class="form-control" placeholder="To-" value="" name="txtDateTo" width="115" id="datepickerDateTo" readonly/>
                                            <input class="ml-2 btn btn-dark" type="submit" name="search" value="Search by Date"/>
                                        </div>
                                    </div>
                                </form>
                                <div class="mx-auto mt-2">
                                    <small class="form-text text-muted">Search statistics by repair time</small>
                                    <form action="equipmentStatistics" method="POST">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fas fa-wrench"></i>
                                                </div>
                                            </div>
                                            <input class="form-control col-md-1" min="0" max="999" placeholder="-" type="number" value="" name="txtRepairNum" width="115"/>
                                            <input class="ml-2 btn btn-dark" type="submit" name="search" value="Search from repair time"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-dark">Equipment Statistics</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTableStatistics" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Equipment ID</th>
                                                    <th>Owner username</th>
                                                    <th>Room ID</th>
                                                    <th>Date Bought</th>
                                                    <th>Warranty</th>
                                                    <th>Equipment Status</th>
                                                    <th>Repair time</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Equipment ID</th>
                                                    <th>Owner username</th>
                                                    <th>Room ID</th>
                                                    <th>Date Bought</th>
                                                    <th>Warranty</th>
                                                    <th>Equipment Status</th>
                                                    <th>Repair time</th>
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
                                                                <td><c:out value="${dto.numOfRepair}"/></td>
                                                                <td>
                                                                    <form action="equipmentStatistics" method="POST">
                                                                        <input type="hidden" name="txtEquipUsing" value="${dto.equipByUserID}"/>
                                                                        <input type="hidden" name="action" value="viewInfo"/>
                                                                        <button data-toggle="tooltip" data-placement="top" title="View more information" type="submit" class="btn-circle btn-info fas fa-info"></button>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <form action="equipmentStatistics" method="POST">
                                                                        <input type="hidden" name="txtEquipUsing" value="${dto.equipByUserID}"/>
                                                                        <input type="hidden" name="action" value="equipLocationHistory"/>
                                                                        <button data-toggle="tooltip" data-placement="top" title="Equipment Location History" type="submit" class="btn-circle btn-success fas fa-history"></button>
                                                                    </form>
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
        <script>
            $(document).ready(function () {
                $('#dataTableStatistics').DataTable();
            });
        </script>
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
            <%@include file="admin/equipmentStatisticsSettingsModal.jsp" %>
            <%@include file="genericSettingsModal.jsp" %>
            <%@include file="genericFooterScript.html"%>
    </body>
</html>
