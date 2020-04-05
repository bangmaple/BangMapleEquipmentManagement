<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:if test="${requestScope.queryUpdate != null}">
            <a style="display: none;" class="dropdown-item clickUpdateUser" href="#" data-toggle="modal" data-target="#updateModal"></a>
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".clickUpdateUser").trigger("click");
                });
            </script>

        </c:if>
        <c:if test="${requestScope.deleteSuccess != null}">
            <a style="display: none;" class="dropdown-item deleteSuccess" href="#" data-toggle="modal" data-target="#deleteSuccessModal"></a>
            <script>
                $(document).ready(function () {
                    $(".deleteSuccess").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.queryDelete != null}">
            <a style="display: none;" class="dropdown-item clickDeleteUser" href="#" data-toggle="modal" data-target="#deleteModal"></a>
            <script>
                $(document).ready(function () {
                    $(".clickDeleteUser").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.duplicateEmail != null}">
            <a style="display: none;" class="dropdown-item clickDuplicateEmail" href="#" data-toggle="modal" data-target="#duplicateEmailModal"></a>
            <script>
                $(document).ready(function () {
                    $(".clickDuplicateEmail").trigger("click");
                });
            </script>
        </c:if>
        <c:if test="${requestScope.conflictUser != null}">
            <a class="dropdown-item clickConflictUserModal" style="display: none;" href="#" data-toggle="modal" data-target="#conflictUserModal"></a>
            <script>
                $(document).ready(function () {
                    $(".clickConflictUserModal").trigger("click");
                });
            </script>
        </c:if>
    </body>

</html>
