<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:useBean id="nowUser" class="java.util.Date" scope="request"/>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    <body id="page-top">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">User Dashboard</h1>
            </div>

            <!-- Content Row -->
            <div class="row">

                <!-- Area Chart -->
                <div class="col-xl-8 col-lg-7">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Introduction</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                Welcome ${sessionScope.userInfo.username} to BangMaple - PRJ321 Project. Here you can use the sidebar to access to <b>Repair Request</b> ,<b>Equipment Statistics</b> ,<b>Equipments History</b> so as to use the Utilities feature.<br/><br/>You can request a repair for your equipment in the <b>Working</b> section.<br/><br/>After all, you can use the <b>More</b> section to check the <b>Alert Center</b> for your equipment(s) repairing situation. <br/><br/>To personalize your account, please click on your avatar to access to your profile.<br/><br/>You can even protect your account with two-factor authentication!<br/><br/><b>Change Password</b> should be working for your fast feature.
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Today</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                Today is <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${nowUser}"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- /.container-fluid -->
    </body>
</html>
