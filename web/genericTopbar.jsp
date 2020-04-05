<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="head.html" %></head>
    <body id="page-top">
        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
                <c:if test="${sessionScope.userInfo ne null}">
                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <c:if test="${sessionScope.userInfo.role ne 'User'}">
                            <c:if test="${applicationScope.reqList eq null}">
                                <a class="nav-link dropdown-toggle" href="showReq" id="alertsDropdown" role="button">
                                </c:if>
                                <c:if test="${applicationScope.reqList ne null}">
                                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    </c:if>
                                    <i class="fas fa-bell fa-fw"></i>

                                    <!-- Counter - Alerts -->
                                    <c:if test="${fn:length(applicationScope.reqList) gt 0}">
                                        <span class="badge badge-danger badge-counter">${fn:length (applicationScope.reqList)}</span>
                                    </c:if>
                                    <c:if test="${fn:length(applicationScope.reqList) eq 0}">
                                        <span class="badge badge-danger"></span>

                                    </c:if>
                                </a>
                            </c:if>

                            <c:if test="${sessionScope.userInfo.role eq 'User'}">
                                <c:if test="${applicationScope.resList eq null}">
                                    <a class="nav-link dropdown-toggle" href="showRes" id="alertsDropdown" role="button">
                                    </c:if>
                                    <c:if test="${applicationScope.resList ne null}">
                                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        </c:if>
                                        <i class="fas fa-bell fa-fw"></i>

                                        <!-- Counter - Alerts -->
                                        <c:if test="${fn:length(applicationScope.resList) gt 0}">
                                            <span class="badge badge-danger badge-counter">${fn:length (applicationScope.resList)}</span>
                                        </c:if>
                                        <c:if test="${fn:length(applicationScope.resList) eq 0}">
                                            <span class="badge badge-danger"></span>

                                        </c:if>
                                    </a>
                                </c:if>
                                <!-- Dropdown - Alerts -->

                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                    <c:if test="${sessionScope.userInfo.role ne 'User'}">
                                        <c:if test="${applicationScope.reqList ne null}">
                                            <h6 class="dropdown-header bg-dark">
                                                Alerts Center
                                            </h6>
                                            <c:if test="${not empty applicationScope.reqList}">
                                                <c:forEach var="dto" items="${applicationScope.reqList}" begin="${fn:length(applicationScope.reqList)-1}">
                                                    <a class="dropdown-item d-flex align-items-center" href="showReq">
                                                        <div class="mr-3">
                                                            <div class="icon-circle bg-dark">
                                                                <i class="fas fa-bell text-white"></i>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="small text-gray-500"><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${dto.date}" /></div>
                                                            <span class="font-weight-bold"><c:out value="${dto.title}"/></span>
                                                        </div>
                                                    </a>
                                                </c:forEach>
                                            </c:if>
                                            <a class="dropdown-item text-center small text-gray-500" href="showReq">Show All Alerts</a>
                                        </c:if>
                                    </div>
                                </c:if>

                                <c:if test="${sessionScope.userInfo.role eq 'User'}">
                                    <c:if test="${applicationScope.resList ne null}">
                                        <h6 class="dropdown-header bg-dark">
                                            Alerts Center
                                        </h6>
                                        <c:if test="${not empty applicationScope.resList}">
                                            <c:forEach var="dto" items="${applicationScope.resList}" begin="${fn:length(applicationScope.resList)-1}">
                                                <a class="dropdown-item d-flex align-items-center" href="showRes">
                                                    <div class="mr-3">
                                                        <div class="icon-circle bg-dark">
                                                            <i class="fas fa-bell text-white"></i>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="small text-gray-500"><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${dto.date}" /></div>
                                                        <span class="font-weight-bold"><c:out value="${dto.title}"/></span>
                                                    </div>
                                                </a>
                                            </c:forEach>
                                        </c:if>
                                        <a class="dropdown-item text-center small text-gray-500" href="showRes">Show All Alerts</a>
                                    </c:if>
                                    </div>
                                </c:if>
                                </li>

                                <div class="topbar-divider d-none d-sm-block"></div>

                                <!-- Nav Item - User Information -->
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small"><c:out value="${sessionScope.userInfo.fullname}"/></span>
                                        <c:if test="${sessionScope.userInfo.avatarImage eq null}">
                                            <img class="img-profile rounded-circle" src="uploads/avatar/default.png">
                                        </c:if>
                                        <c:if test="${sessionScope.userInfo.avatarImage ne null}">
                                            <img class="img-profile rounded-circle" src="uploads/avatar/${sessionScope.userInfo.avatarImage}">
                                        </c:if>
                                    </a>
                                    <!-- Dropdown - User Information -->
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#profileModal">
                                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Profile
                                        </a>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#settingsModal">
                                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Settings
                                        </a>
                            </a>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#changePasswordModal">
                                <i class="fas fa-lock fa-sm fa-fw mr-2 text-gray-400"></i>
                                Change password
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                            </div>
                    </li>
                </c:if>
            </ul>
        </nav>
    </body>

</html>
