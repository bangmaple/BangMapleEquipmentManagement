<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>PRJ321 Assignment</title>
    </head>
    <body id="page-top">
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

    <c:if test="${requestScope.queryRequest != null}">
        <a style="display: none" class="dropdown-item clickRequestRepair" href="#" data-toggle="modal" data-target="#requestRepairModal"></a>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".clickRequestRepair").trigger("click");
            });
        </script>
    </c:if>

</html>
