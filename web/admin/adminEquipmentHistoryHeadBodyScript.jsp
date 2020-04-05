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

        <c:if test="${requestScope.viewInfoEquipReq != null}">
            <a style="display: none" class="dropdown-item clickViewInfoEquipReq" href="#" data-toggle="modal" data-target="#viewInfoEquipReqModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickViewInfoEquipReq").trigger("click");
                });
            </script>
        </c:if>
    </body>

    <c:if test="${requestScope.removeEquipReq != null}">
        <a style="display: none" class="dropdown-item clickRemoveEquipReq" href="#" data-toggle="modal" data-target="#removeEquipReqModal"></a>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".clickRemoveEquipReq").trigger("click");
            });
        </script>
    </c:if>

</html>
