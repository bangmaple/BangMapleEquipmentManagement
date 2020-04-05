<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
        <c:if test="${sessionScope.userInfo == null}">
            <a class="dropdown-item clickTimeoutSession" href="#" data-toggle="modal" data-target="#sessionTimeoutModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickTimeoutSession").trigger("click");
                });
            </script>
        </c:if>

        <c:if test="${requestScope.viewMore != null}">
            <a style="display: none" class="dropdown-item clickViewMoreEquipUsing" href="#" data-toggle="modal" data-target="#viewMoreEquipUsingModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewMoreEquipUsing").trigger("click");
                });
            </script>
        </c:if>
    </body>

    <c:if test="${requestScope.queryRepair != null}">
        <a style="display: none" class="dropdown-item clickRepair" href="#" data-toggle="modal" data-target="#viewRepairModal"></a>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".clickRepair").trigger("click");
            });
        </script>
    </c:if>

</html>
