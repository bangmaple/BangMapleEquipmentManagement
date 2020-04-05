<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head><%@include file="head.html" %></head>
    <body id="page-top">
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <div class="container-fluid mt-xl-5">
                        <div class="text-center">
                            <div class="error mx-auto" data-text="400">400</div>
                            <p class="lead text-gray-800 mb-5">Bad Request! Error Page!</p>
                            <p class="text-gray-500 mb-0">
                                <c:if test="${requestScope.ERROR eq null}">
                                    It looks like you found a glitch in the matrix...
                                </c:if>
                                <c:if test="${requestScope.ERROR ne null}">
                                    <c:out value="${requestScope.ERROR}"/>
                                </c:if>
                            </p>
                            <a href="login.jsp">&larr; Back to Dashboard</a>
                        </div>
                    </div>
                </div>
                <%@include file="genericFooter.html" %>
            </div>
        </div>
        <%@include file="genericFooterScript.html" %>
    </body>
</html>
