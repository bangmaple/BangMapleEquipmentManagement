<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head><%@include file="../head.html" %></head>
    <script>
        $(document).ready(function () {
            $('#dataTableUser').DataTable();
        });
    </script>
    <body id="page-top">
        <!--Include headerActionScript.jsp-->
        <%@include file="user/headerActionScript.jsp"%>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!--Include sidebar.html-->
            <%@include file="../genericSidebar.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!--Include genericTopbar.jsp-->
                    <%@include file="../genericTopbar.jsp" %>

                    <c:if test="${sessionScope.userInfo != null}">
                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <%@include file="user/userPageHeading.html" %>

                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-dark">User Accounts Table</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTableUser" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Username</th>
                                                    <th>Fullname</th>
                                                    <th>Email</th>
                                                    <th>Role</th>
                                                    <th>Date of Birth</th>
                                                    <th>Creation Date</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Username</th>
                                                    <th>Fullname</th>
                                                    <th>Email</th>
                                                    <th>Role</th>
                                                    <th>Date of Birth</th>
                                                    <th>Creation Date</th>
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
                                                                <td><c:out value="${dto.username}"/></td>
                                                                <td>
                                                                    <c:if test="${empty dto.fullname}">-</c:if>
                                                                    <c:if test="${not empty dto.fullname}">${dto.fullname}</c:if>
                                                                    </td>
                                                                    <td><c:out value="${dto.email}"/></td>
                                                                <td><c:out value="${dto.role}"/></td>
                                                                <td>
                                                                    <c:if test="${empty dto.doB}">-</c:if>
                                                                    <c:if test="${not empty dto.doB}">
                                                                        <fmt:formatDate value="${dto.doB}" pattern="dd-MM-yyyy"/>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${dto.creationDate}" pattern="dd-MM-yyyy"/>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${dto.isDisabled==false}">
                                                                        <c:if test="${dto.role ne 'Administrator'}">
                                                                            <form action="MainController" method="POST">
                                                                                <button type="submit" class="btn-circle btn-warning fas fa-eye-slash" data-toggle="tooltip" data-placement="top" title="Disable user">
                                                                                    <input type="hidden" value="${dto.username}" name="txtUsername"/>
                                                                                    <input type="hidden" value="disableUser" name="actionDisable"/>
                                                                                    <input type="hidden" value="Disable" name="action"/>
                                                                                </button>
                                                                            </form>
                                                                        </c:if>
                                                                        <c:if test="${dto.role eq 'Administrator'}">
                                                                            <button class="btn-circle btn-warning-outline fas fa-eye-slash" disabled></button>
                                                                        </c:if>
                                                                    </c:if>
                                                                    <c:if test="${dto.isDisabled==true}">
                                                                        <c:if test="${dto.role ne 'Administrator'}">
                                                                            <form action="MainController" method="POST">
                                                                                <button type="submit" class="btn-circle btn-warning fas fa-eye" data-toggle="tooltip" data-placement="top" title="Enable user">
                                                                                    <input type="hidden" value="${dto.username}" name="txtUsername"/>
                                                                                    <input type="hidden" value="disableUser" name="actionDisable"/>
                                                                                    <input type="hidden" value="Disable" name="action"/>
                                                                                </button>
                                                                            </form>
                                                                        </c:if>
                                                                        <c:if test="${dto.role eq 'Administrator'}">
                                                                            <button class="btn-circle btn-warning-outline fas fa-eye" disabled></button>
                                                                        </c:if>
                                                                    </c:if>
                                                                </td>

                                                                <td>
                                                                    <c:if test="${dto.role ne 'Administrator'}">
                                                                        <c:url var="deleteLink" value="MainController">
                                                                            <c:param name="txtUsername" value="${dto.username}"/>
                                                                            <c:param name="action" value="Delete"/>
                                                                            <c:param name="actionDelete" value="deleteUser"/>
                                                                        </c:url>
                                                                        <a href="${deleteLink}" data-toggle="tooltip" data-placement="top" title="Delete user" class="btn-circle btn-danger fas fa-trash"></a>
                                                                    </c:if>
                                                                    <c:if test="${dto.role eq 'Administrator'}">
                                                                        <button type="button" class="btn-circle btn-danger-outline fas fa-trash" disabled>
                                                                        </button>
                                                                    </c:if>
                                                                </td>

                                                                <td>
                                                                    <form action="MainController" method="POST">
                                                                        <input type="hidden" value="${dto.username}" name="txtUsername"/>
                                                                        <input type="hidden" value="queryUser" name="actionQuery"/>
                                                                        <input type="hidden" value="update" name="actionQueryUpdate"/>
                                                                        <input type="hidden" value="Query" name="action"/>
                                                                        <button type="submit" data-toggle="tooltip" data-placement="top" title="Update user" class="btn-circle btn-success fas fa-magic">
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
                <!-- Include footer.html-->
                <%@include file="../genericFooter.html"%>
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
        <!--Include userSettingsModal.html-->
        <%@include file="user/userSettingsModal.jsp"%>
        <%@include file="../genericSettingsModal.jsp"%>
        <!--Include footerScript.html -->
        <%@include file="../genericFooterScript.html" %>
    </body>
</html>
