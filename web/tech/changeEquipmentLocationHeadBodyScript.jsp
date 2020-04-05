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
        <c:if test="${requestScope.changeLocation != null}">
            <a class="dropdown-item clickChangeEquipmentLocation" href="#" style="display: none;" data-toggle="modal" data-target="#changeEquipmentLocation"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickChangeEquipmentLocation").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.queryInfo != null}">
            <a class="dropdown-item clickViewMoreInfo" href="#" style="display: none;" data-toggle="modal" data-target="#viewMoreInfo"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewMoreInfo").trigger("click");
                });
            </script>
        </c:if>
    </body>
</html>
