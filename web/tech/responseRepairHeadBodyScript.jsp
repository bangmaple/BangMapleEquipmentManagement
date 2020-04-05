<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
        <c:if test="${sessionScope.userInfo == null}">
            <a class="dropdown-item clickTimeoutSession" href="#" style="display: none;" data-toggle="modal" data-target="#sessionTimeoutModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickTimeoutSession").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.queryUser != null}">
            <a class="dropdown-item clickViewUserInfoModal" href="#" style="display: none;" data-toggle="modal" data-target="#viewMoreUserModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewUserInfoModal").trigger("click");
                });
            </script>
        </c:if>

        <c:if test="${requestScope.queryRoom != null}">
            <a class="dropdown-item clickViewRoomInfoModal" href="#" style="display: none;" data-toggle="modal" data-target="#viewMoreRoomModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewRoomInfoModal").trigger("click");
                });
            </script>
        </c:if>

        <c:if test="${requestScope.queryEquip != null}">
            <a class="dropdown-item clickViewEquipInfoModal" href="#" style="display: none;" data-toggle="modal" data-target="#viewMoreEquipModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewEquipInfoModal").trigger("click");
                });
            </script>
        </c:if>

        <c:if test="${requestScope.queryRepair != null}">
            <a class="dropdown-item clickViewRepairModal" href="#" style="display: none;" data-toggle="modal" data-target="#viewRepairModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewRepairModal").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.queryFinishRepair != null}">
            <a class="dropdown-item clickViewFinishRepair" href="#" style="display: none;" data-toggle="modal" data-target="#viewFinishRepairModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewFinishRepair").trigger("click");
                });
            </script>
        </c:if>
    </body>
</html>
