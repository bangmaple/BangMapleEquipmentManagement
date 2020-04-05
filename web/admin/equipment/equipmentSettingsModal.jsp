<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body id="page-top">
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">Ã</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-dark" href="login.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Conflict References Modal-->
        <div class="modal fade" id="conflictModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Error!</h5>
                    </div>
                    <div class="modal-body">${requestScope.conflictReference}</div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" href="equipmentManagement">Close</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Insert Modal-->
        <div class="modal fade" id="addEquipmentModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-cube mr-2"></i>Please insert the fields in order to add an equipment!</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>

                    <form method="POST" action="AddEquipmentController" enctype="multipart/form-data">
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Input equipment name here</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-outdent"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" pattern="^[a-zA-Z\s\d\.]{1,}$" id="equipmentNameAdd" placeholder="Equipment Name" name="txtEquipmentName" required/>
                            </div>
                        </div>

                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Input equipment description here if you want to</small>
                            <textarea class="form-control" id="equipmentDescription" placeholder="Equipment Description" name="txtEquipmentDescription" rows="3"></textarea>
                        </div>

                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Select an equipment type</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-plug"></i>
                                    </div>
                                </div>
                                <select class="form-control" name="txtEquipType" required>
                                    <option value="Others">Others</option>
                                    <option value="Working">Working</option>
                                    <option value="Teaching">Teaching</option>
                                    <option value="Accessories">Accessories</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Upload equipment image if you have</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-file-image"></i>
                                    </div>
                                    <input type="file" class="form-control-file" id="equipmentImageAdd" name="txtEquipImage">
                                </div>
                            </div>
                        </div>
                        <div class="modal-body">If you are ready, click the 'Add' button below to perform action!</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-dark" name="action" value="Add"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- View More Modal-->
        <div class="modal fade" id="viewMoreModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-info mr-2"></i>Equipment information</h5>
                    </div>
                    <div class="col-md-10 mx-auto mt-2">
                        <small class="text-muted form-text">Equipment ID</small>
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
                            <textarea form="updateEquipmentForm" class="form-control" rows="3" readonly>${requestScope.equipInfo.equipDescription}</textarea>
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
                        <small class="form-text text-muted">Equipment Image</small>
                        <div class="input-group mb-2">
                            <img class="img-fluid" src="${requestScope.equipImage}" alt="Error"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="equipmentManagement" class="btn btn-dark">Close</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Update Modal-->
        <div class="modal fade" id="updateEquipmentModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-magic mr-2"></i>Please update the fields you want!</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <form method="POST" action="UpdateController" id="updateEquipmentForm" enctype="multipart/form-data">
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Equipment ID</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-tag"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" name="txtEquipID" value="${requestScope.queryUpdate.equipID}" readonly/>
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
                                <input type="text" class="form-control" id="equipName" pattern="^[a-zA-Z\s\d\.]{1,}$" name="txtEquipmentName" value="${requestScope.queryUpdate.equipName}"/>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Equipment Description</small>
                            <div class="input-group mb-2">
                                <textarea form="updateEquipmentForm" name="txtEquipmentDescription" placeholder="Enter equipment description here.." class="form-control" rows="3">${requestScope.queryUpdate.equipDescription}</textarea>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Select an equipment type</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-plug"></i>
                                    </div>
                                </div>
                                <select class="form-control" name="txtEquipType" required>
                                    <option value="Others">Others</option>
                                    <option value="Working">Working</option>
                                    <option value="Teaching">Teaching</option>
                                    <option value="Accessories">Accessories</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Equipment Update</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-cog"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" name="actionUpdate" value="updateEquipment" readonly>
                            </div>
                        </div>
                        <div class="col-md-10 mx-auto mt-2">
                            <small class="form-text text-muted">Upload an equipment image</small>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-file-image"></i>
                                    </div>
                                    <input type="file" class="form-control-file" id="equipmentImageAdd" name="txtEquipImage">
                                </div>
                            </div>
                        </div>


                        <div class="modal-body">If you are ready, click the 'Update' button below to perform action!</div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="equipmentManagement">Cancel</a>
                            <button type="submit" class="btn btn-dark">Update</a>
                        </div>
                    </form>
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
    </body>

</html>
