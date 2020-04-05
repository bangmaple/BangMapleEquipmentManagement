<%-- 
    Document   : admin
    Created on : Feb 18, 2020, 9:58:42 PM
    Author     : bangmaple
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="head.html"%></head>
    <body id="page-top">
        <c:if test="${sessionScope.userInfo == null}"><c:redirect url="login.jsp"/></c:if>
            <div id="wrapper">
            <%@include file="genericSidebar.jsp" %>
            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <%@include file="genericTopbar.jsp"%>
                    <!-- Begin Page Content -->
                    <c:if test="${sessionScope.userInfo.role eq 'Administrator'}"><%@include file="/admin/adminDashboardContent.jsp"%></c:if>
                    <c:if test="${sessionScope.userInfo.role eq 'Technician'}"><%@include file="/tech/techDashboardContent.jsp"%></c:if>
                    <c:if test="${sessionScope.userInfo.role eq 'User'}"><%@include file="/users/userDashboardContent.jsp"%></c:if>
                    </div>
                    <!-- End of Main Content -->
                <%@include file="genericFooter.html" %>
                <!-- End of Footer -->
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
            <%@include file="genericSettingsModal.jsp" %>
            <%@include file="genericFooterScript.html" %>
    </body>

</html>
