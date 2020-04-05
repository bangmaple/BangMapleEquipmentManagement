<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body id="page-top">
        <c:if test="${sessionScope.userInfo == null}">
            <a class="dropdown-item clickTimeoutSession" href="#" data-toggle="modal" data-target="#sessionTimeoutModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickTimeoutSession").trigger("click");
                });
            </script>
        </c:if>

        <c:if test="${requestScope.viewMoreEquipUsingInfo != null}">
            <a style="display: none" class="dropdown-item clickViewMoreEquipStatistics" href="#" data-toggle="modal" data-target="#viewMoreEquipStatisticsModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewMoreEquipStatistics").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.equipLocationHistoryTable != null}">
            <a style="display: none" class="dropdown-item clickViewEquipmentLocationHistory" href="#" data-toggle="modal" data-target="#equipLocationHistoryTable"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewEquipmentLocationHistory").trigger("click");
                });
            </script>
        </c:if>
    </body>

</html>
