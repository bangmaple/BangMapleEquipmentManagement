<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
            <%@include file="genericLogo.html"%>
            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                <c:if test="${sessionScope.userInfo.role eq 'Administrator'}">For Admin</c:if>
                <c:if test="${sessionScope.userInfo.role eq 'Technician'}">For Technician</c:if>
                <c:if test="${sessionScope.userInfo.role eq 'User'}">For User</c:if>
            </div>
            <c:if test="${sessionScope.userInfo.role eq 'Administrator'}"><%@include file="/admin/adminSidebar.html" %></c:if>
            <c:if test="${sessionScope.userInfo.role eq 'Technician'}"><%@include file="/tech/techSidebar.jsp" %></c:if>
            <c:if test="${sessionScope.userInfo.role eq 'User'}"><%@include file="/users/userSidebar.html" %></c:if>
        </ul>
    </body>

</html>
