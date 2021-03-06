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
                            <%@include file="reqMessage/heading.html" %>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-dark">Alert Messages</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTableAlert" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Title</th>
                                                    <th>Sent date</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Title</th>
                                                    <th>Sent date</th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <c:if test="${applicationScope.reqList ne null}">
                                                    <c:if test="${not empty applicationScope.reqList}" var="checkList">
                                                        <c:forEach var="dto" items="${applicationScope.reqList}" varStatus="counter">
                                                            <tr>
                                                                <td><c:out value="${counter.count}"/></td>
                                                                <td><c:out value="${dto.title}"/></td>
                                                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${dto.date}" /></td>
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
        <script>
            $(document).ready(function () {
                $('#dataTableAlert').DataTable();
            });
        </script>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
            <%@include file="workingPlace/workingPlaceSettingsModal.jsp" %>
            <%@include file="genericSettingsModal.jsp" %>
            <%@include file="genericFooterScript.html"%>
    </body>
</html>
