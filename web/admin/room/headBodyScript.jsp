<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body id="page-top">
        <c:if test="${sessionScope.userInfo == null}">

            <a class="dropdown-item clickTimeoutSession" href="#" style="display: none;" data-toggle="modal" data-target="#sessionTimeoutModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickTimeoutSession").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.queryUpdate != null}">
            <a class="dropdown-item clickUpdateRoom" href="#" style="display: none;" data-toggle="modal" data-target="#updateRoomModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickUpdateRoom").trigger("click");
                });
            </script>

        </c:if>
        <c:if test="${requestScope.deleteSuccess != null}">
            <a class="dropdown-item deleteSuccess" href="#" style="display: none;" data-toggle="modal" data-target="#deleteSuccessModal"></a>
            <script>
                $(document).ready(function () {
                    $(".deleteSuccess").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.queryDelete != null}">
            <a class="dropdown-item clickDeleteUser" style="display: none;" href="#" data-toggle="modal" data-target="#deleteModal"></a>
            <script>
                $(document).ready(function () {
                    $(".clickDeleteUser").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.conflictRoom != null}">
            <a class="dropdown-item clickConflictRoomModal" style="display: none;" href="#" data-toggle="modal" data-target="#conflictRoomModal"></a>
            <script>
                $(document).ready(function () {
                    $(".clickConflictRoomModal").trigger("click");
                });
            </script>
        </c:if>
    </body>

</html>
