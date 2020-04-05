<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="../head.html" %></head>
    <body id="page-top">
        <%@include file="equipment/headBodyScript.jsp" %>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!--Sidebar-->
            <%@include file="/genericSidebar.jsp" %>
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
                            <%@include file="equipment/heading.html" %>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-dark">Equipments Table</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTableEquipment" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Name</th>
                                                    <th>Type</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Name</th>
                                                    <th>Type</th>
                                                    <th></th>
                                                    <th></th>
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
                                                                <td>
                                                                    <c:if test="${empty dto.equipName}">-</c:if>
                                                                    <c:if test="${not empty dto.equipName}">${dto.equipName}</c:if>
                                                                    </td>
                                                                    <td>
                                                                    <c:if test="${empty dto.equipType}">-</c:if>
                                                                    <c:if test="${not empty dto.equipType}">${dto.equipType}</c:if>
                                                                    </td>
                                                                    <td>
                                                                        <form action="ViewMoreEquipInfoController" method="POST">
                                                                            <button type="submit" data-toggle="tooltip" data-placement="top" 
                                                                                    title="View more information" class="btn-circle btn-primary fas fa-info"></button>
                                                                            <input type="hidden" name="txtEquipID" value="${dto.equipID}"/>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${dto.isDisabled==false}">
                                                                        <form action="MainController" method="POST">
                                                                            <button type="submit" class="btn-circle btn-warning fas fa-eye-slash" data-toggle="tooltip" data-placement="top" title="Disable equipment">
                                                                                <input type="hidden" value="${dto.equipID}" name="txtEquipID"/>
                                                                                <input type="hidden" value="disableEquipment" name="actionDisable"/>
                                                                                <input type="hidden" value="Disable" name="action"/>
                                                                            </button>
                                                                        </form>
                                                                    </c:if>
                                                                    <c:if test="${dto.isDisabled==true}">
                                                                        <form action="MainController" method="POST">
                                                                            <button type="submit" class="btn-circle btn-warning fas fa-eye" data-toggle="tooltip" data-placement="top" title="Enable equipment">
                                                                                <input type="hidden" value="${dto.equipID}" name="txtEquipID"/>
                                                                                <input type="hidden" value="disableEquipment" name="actionDisable"/>
                                                                                <input type="hidden" value="Disable" name="action"/>
                                                                            </button>
                                                                        </form>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:url var="deleteLink" value="MainController">
                                                                        <c:param name="txtEquipID" value="${dto.equipID}"/>
                                                                        <c:param name="action" value="Delete"/>
                                                                        <c:param name="actionDelete" value="deleteEquipment"/>
                                                                    </c:url>
                                                                    <a href="${deleteLink}"><button type="submit" data-toggle="tooltip" data-placement="top" title="Delete equipment" class="btn-circle btn-danger fas fa-trash">
                                                                        </button></a>
                                                                </td>
                                                                <td>
                                                                    <form action="MainController" method="POST">
                                                                        <input type="hidden" value="${dto.equipID}" name="txtEquipmentID"/>
                                                                        <input type="hidden" value="queryEquipment" name="actionQuery"/>
                                                                        <input type="hidden" value="update" name="actionQueryUpdate"/>
                                                                        <input type="hidden" value="Query" name="action"/>
                                                                        <button type="submit" data-toggle="tooltip" data-placement="top" title="Update equipment" class="btn-circle btn-success fas fa-magic">
                                                                        </button>
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
        </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <script>
            $(document).ready(function() {
               $('#dataTableEquipment').DataTable(); 
            });
        </script>
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
            <%@include file="equipment/equipmentSettingsModal.jsp" %>
            <%@include file="../genericSettingsModal.jsp" %>
            <%@include file="../genericFooterScript.html"%>

    </body>

</html>
