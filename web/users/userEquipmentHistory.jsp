<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="../head.html" %></head>
    <body id="page-top">
        <%@include file="userEquipmentHistoryHeadBodyScript.jsp" %>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!--Sidebar-->
            <%@include file="../genericSidebar.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <%@include file="../genericTopbar.jsp" %>
                    <c:if test="${sessionScope.userInfo != null}">
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- Page Heading -->
                            <%@include file="userEquipmentHistoryHeading.html" %>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-dark">Equipments History</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTableEquipHistory" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Equip Request ID</th>
                                                    <th>Equipment ID</th>
                                                    <th>Username Request</th>
                                                    <th>Repair Request Date</th>
                                                    <th>Username Response</th>
                                                    <th>Repair Finish Date</th>
                                                    <th>Repair Result</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Equip Request ID</th>
                                                    <th>Equipment ID</th>
                                                    <th>Username Request</th>
                                                    <th>Repair Request Date</th>
                                                    <th>Username Response</th>
                                                    <th>Repair Finish Date</th>
                                                    <th>Repair Result</th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <c:if test="${requestScope.INFO !=null}">
                                                    <c:if test="${not empty requestScope.INFO}" var="checkList">
                                                        <c:forEach var="dto" items="${requestScope.INFO}" varStatus="counter">
                                                            <tr>
                                                                <td><c:out value="${counter.count}"/></td>
                                                                <td><c:out value="${dto.equipReqID}"/> </td>
                                                                <td><c:out value="${dto.equipByUserID.equipID.equipID}"/> </td>
                                                                <td><c:out value="${dto.usernameRequest.username}"/></td>
                                                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${dto.repairRequestDate}"/></td>
                                                                <td><c:out value="${dto.usernameResponse.username}"/></td>
                                                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${dto.repairEndDate}"/></td>
                                                                <td><c:out value="${dto.repairResult}"/></td>
                                                                <td>
                                                                    <form action="userEquipmentHistory" method="POST">
                                                                        <input type="hidden" name="txtEquipReqID" value="${dto.equipReqID}"/>
                                                                        <input type="hidden" name="action" value="viewInfo"/>
                                                                        <button data-toggle="tooltip" data-placement="top" title="View more information" type="submit" class="btn-circle btn-info fas fa-info"></button>
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
                <%@include file="../genericFooter.html" %>
            </div>
            <!-- End of Content Wrapper -->
            <script>
                $(document).ready(function () {
                    $('#dataTableEquipHistory').DataTable();
                });
            </script>
        </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
        <%@include file="userEquipmentHistorySettingsModal.jsp" %>
            <%@include file="../genericSettingsModal.jsp" %>
            <%@include file="../genericFooterScript.html"%>
    </body>
</html>
