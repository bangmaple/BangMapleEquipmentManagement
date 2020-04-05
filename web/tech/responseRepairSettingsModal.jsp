<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>

        <!-- View More User Modal-->
        <div class="modal fade" id="viewMoreUserModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-user mr-2"></i>User information</h5>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Username</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-user"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.userInfo.username}" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Fullname</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-id-card"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.userInfo.fullname}" readonly/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="responseRepair" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- View More Equipment Modal-->
        <div class="modal fade" id="viewMoreEquipModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-cube mr-2"></i>Equipment information</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Equipment ID</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-tag"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.equipInfo.equipID}" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Equipment Name</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-outdent"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.equipInfo.equipName}" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Equipment Description</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-table mr-n1"></i>
                                </div>
                            </div>
                            <textarea class="form-control" rows="3" readonly>${requestScope.equipInfo.equipDescription}</textarea>
                        </div>
                    </div>

                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Equipment Type</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-plug mr-n1"></i>
                                </div>
                            </div>
                            <input class="form-control" type="text" value="${requestScope.equipInfo.equipType}" readonly/>
                        </div>
                    </div>

                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">Equipment Image</small>
                        <div class="input-group mb-2">
                            <c:if test="${requestScope.equipImage ne '' or requestScope.equipImage ne null}">
                                <img class="img-fluid" src="uploads/equipments/${requestScope.equipInfo.equipImage}" alt="Error"/>
                            </c:if>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="responseRepair" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- View More Room Modal-->
        <div class="modal fade" id="viewMoreRoomModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-home mr-2"></i>Room information</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Room ID</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-tag"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" value="${requestScope.roomInfo.roomID}" readonly/>
                        </div>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="form-text text-muted">Room Description</small>
                        <div class="input-group mb-2">

                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-outdent"></i>
                                </div>
                            </div>
                            <textarea class="form-control" rows="3" readonly>${requestScope.roomInfo.roomDescription}</textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="responseRepair" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Repair Modal-->
        <div class="modal fade" id="viewRepairModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-home mr-2"></i>Repair equipment</h5>
                    </div>
                    <div class="modal-body col-auto">You can repair an equipment through here.</div>

                    <div class="col-md-10 mx-auto">
                        <small class="form-text text-muted">Request Repair Message</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </div>
                            </div>
                            <textarea rows="3" class="form-control" readonly="true"><c:out value="${equipReq.repairRequestDescription}"/></textarea>
                        </div>

                    </div>
                    <form action="responseRepair" method="POST">
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Take an action</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-wrench"></i>
                                    </div>
                                </div>

                                <select class="form-control" name="txtAction" required>
                                    <option class="form-text" disabled selected value>-- Please choose --</option>
                                    <option class="form-text" value="FIXING">Start repairing this equipment</option>
                                    <option class="form-text" value="DECLINED">Refuse repairing this equipment</option>
                                </select>

                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Response Repair Description</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-outdent"></i>
                                    </div>
                                </div>
                                <textarea rows="3" name="txtResponseRepair" class="form-control" required="true"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="responseRepair" class="btn btn-dark">Close</a>
                            <input type="hidden" name="txtEquipReqID" value="${equipReq.equipReqID}"/>
                            <input type="submit" class="btn btn-warning" name="action" value="Repair"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Repair Modal-->
        <div class="modal fade" id="viewFinishRepairModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-home mr-2"></i>Repair equipment</h5>
                    </div>
                    <div class="modal-body col-auto">You can repair an equipment through here.</div>

                    <div class="col-md-10 mx-auto">
                        <small class="form-text text-muted">Request Repair Message</small>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </div>
                            </div>
                            <textarea rows="3" class="form-control" readonly="true"><c:out value="${equipReq.repairRequestDescription}"/></textarea>
                        </div>

                    </div>
                    <form action="responseRepair" method="POST">
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Take an action</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-wrench"></i>
                                    </div>
                                </div>
                                <select class="form-control" name="txtAction" required>
                                    <option class="form-text" disabled selected value>-- Please choose --</option>
                                    <option class="form-text" value="OK">Finish this equipment</option>
                                    <option class="form-text" value="DECLINED">Refuse repairing this equipment</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Response Repair Description</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-outdent"></i>
                                    </div>
                                </div>
                                <textarea rows="3" name="txtResponseRepair" class="form-control" required="true"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="responseRepair" class="btn btn-dark">Close</a>
                            <input type="hidden" name="txtEquipReqID" value="${equipReq.equipReqID}"/>
                            <input type="submit" class="btn btn-warning" name="action" value="Finish Repair"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>
