<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body id="page-top">
        <c:if test="${sessionScope.userInfo == null}">
            <a style="display: none;" class="dropdown-item clickTimeoutSession" href="#" data-toggle="modal" data-target="#sessionTimeoutModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickTimeoutSession").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.successAddToRoom != null}">
            <a style="display: none;" class="dropdown-item successAddToRoom" href="#" data-toggle="modal" data-target="#successAddToRoomModal"></a>
            <script>
                $(document).ready(function () {
                    $(".successAddToRoom").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.viewMoreEquipUsingInfo != null}">
            <a style="display: none;" class="dropdown-item clickViewMoreEquipUsingInfo" href="#" data-toggle="modal" data-target="#viewMoreEquipStatisticsModal"></a>
            <script>
                $(document).ready(function () {
                    $(".clickViewMoreEquipUsingInfo").trigger("click");
                });
            </script>
        </c:if>
    </body>

</html>
