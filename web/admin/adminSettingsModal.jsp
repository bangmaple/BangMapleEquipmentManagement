<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body id="page-top">
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <form action="MainController" method="POST">
                        <button class="btn btn-primary" name="action" value="Logout">Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Session Timeout Modal-->
    <div class="modal fade" id="sessionTimeoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-spinner mr-2"></i>Session timeout</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">Your session has been timeout.<br/>Please login again!</div>
                <div class="modal-footer">
                    <a class="btn btn-dark" href="login.jsp">Login</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Add to room Modal-->
    <div class="modal fade" id="successAddToRoomModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-play-circle-o mr-2"></i>Successfully added</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">Successfully added user/equipment to room!</div>
                <div class="modal-footer">
                    <a class="btn btn-dark" href="AddToRoomController">Close</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
