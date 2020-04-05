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
        <c:if test="${requestScope.equipViewInfoModal != null}">
            <a class="dropdown-item clickViewInfoModal" href="#" style="display: none;" data-toggle="modal" data-target="#viewMoreModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewInfoModal").trigger("click");
                });
            </script>
        </c:if>

        <c:if test="${requestScope.queryUpdate != null}">
            <a class="dropdown-item clickUpdateEquipment" href="#" style="display: none;" data-toggle="modal" data-target="#updateEquipmentModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickUpdateEquipment").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.conflictReference != null}">
            <a class="dropdown-item clickConflictReference" href="#" style="display: none;" data-toggle="modal" data-target="#conflictModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickConflictReference").trigger("click");
                });
            </script>
        </c:if>
    </body>
</html>
