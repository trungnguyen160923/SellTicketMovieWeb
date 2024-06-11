<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <base href="${pageContext.servletContext.contextPath}/*">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #b1d1d9; /* Light background color */
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #e9ecef; /* Light background color for header */
            border-bottom: 1px solid #dee2e6;
        }
        .main {
            background-color: #e3f2fd;
            flex: 1;
            display: flex;
        }
        .sidebar {
            display: flex;
            flex-direction: column;
            justify-content: center; /* Centering buttons vertically */
            padding: 20px;
            border-right: 1px solid #dee2e6;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto;
            max-height: calc(100vh - 100px); /* Adjust based on header height and padding */
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .custom-modal-header {
        background-color: #007bff;
        color: white;
        position: relative;
        padding: 1rem;
    }
    .custom-close-btn {
        background: none;
        border: none;
        color: white;
        font-size: 1.5rem;
        position: absolute;
        top: 1rem;
        right: 1rem;
    }
	    .custom-close-btn:hover {
	        color: #ff4d4d;
	    }
	    .form-label {
	    font-weight: bold;
		}
	
		.form-control:focus {
		    box-shadow: none;
		    border-color: #007bff;
		}
    </style>
    <script>
        function showTable(selection) {
            document.getElementById('phongTable').style.display = 'none';
            document.getElementById('loaiPhongTable').style.display = 'none';
            document.getElementById('loaiGheTable').style.display = 'none';

            if (selection === 'phong') {
                document.getElementById('phongTable').style.display = 'block';
            } else if (selection === 'loaiPhong') {
                document.getElementById('loaiPhongTable').style.display = 'block';
            } else if (selection === 'loaiGhe') {
                document.getElementById('loaiGheTable').style.display = 'block';
            }
        }
    </script>
</head>
<body>
    <div class="container-sm">
        <!--Header  -->
        <header class="navbar navbar-expand-lg navbar-light col" style="margin-bottom: 4.5rem;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="assets/images/logo/logo.png" alt="" class="mr-2">Pengu</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="admin/index.htm">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="admin/phong.htm">Phòng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin/caChieu.htm">Sắp Lịch</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin/thongKe.htm">Thống Kê</a>
                        </li>
                    </ul>
                </div>
            </div>
            <button class="btn btn-info" style="width: 150px; height:50px;border-radius: 15px; color:aliceblue">Đăng Xuất</button>
        </header>
        <!--End Header  -->
        <!--Main  -->
        <div class="main container-fluid flex-grow-1 d-flex">
            <div class="row flex-grow-1 w-100">
                <div class="sidebar col-2 d-flex flex-column">
                    <button class="btn btn-secondary w-100 mb-3" onclick="showTable('phong')">Phòng</button>
                    <button class="btn btn-secondary w-100 mb-3" onclick="showTable('loaiPhong')">Loại Phòng</button>
                    <button class="btn btn-secondary w-100" onclick="showTable('loaiGhe')">Loại Ghế</button>
                </div>
                <div class="content col-10">
                    <div id="phongTable" style="display:block;">
                        <div class="row mb-2">
						    <div class="col">
						        <h3>Phòng</h3>
						    </div>
						    <div class="col-auto">
						        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPhongModel">Thêm</button>
						    </div>
						</div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Mã phòng</th>
                                    <th>Tên phòng</th>
                                    <th>Loại</th>
                                    <th>Mô Tả</th>
                                    <th>Xem chi tiết</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="p" items="${phongs}">
                                <tr>
                                    <td>${p.maPhong}</td>
                                    <td>${p.tenPhong }</td>
                                    <td>${p.loaiPhong.tenLoaiPhong}</td>
                                    <td>
									    <c:choose>
									        <c:when test="${p.tinhTrang}">
									            Đang sử dụng
									        </c:when>
									        <c:otherwise>
									            Không sử dụng
									        </c:otherwise>
									    </c:choose>
									</td>
                                    <td><button class="btn btn-info chitietPhong_btn" data-ma-phong="${p.maPhong}">Xem chi tiết</button></td>
                                    <td>
                                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updatePhongModel_${p.maPhong}">Sửa</button>
                                        <button class="btn btn-danger" onclick="prepareDelete(${p.maPhong})">Xóa</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                <!-- More rows as needed -->
                            </tbody>
                        </table>
                    </div>

                    <div id="loaiPhongTable" style="display:none;">
                        <div class="row mb-2">
						    <div class="col">
						        <h3>Loại Phòng</h3>
						    </div>
						    <div class="col-auto">
						        <button class="btn btn-primary btn_themLoaiPhong" data-bs-toggle="modal" data-bs-target="#addLoaiPhongModel">Thêm</button>
						    </div>
						</div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Mã loại phòng</th>
                                    <th>Tên loại phòng</th>
                                    <th>Mô tả</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                           		<c:forEach var="lp" items="${loaiPhongs}">
                                <tr>
                                    <td>${ lp.maLoaiPhong}</td>
                                    <td>${lp.tenLoaiPhong}</td>
                                    <td>
									    <c:choose>
									        <c:when test="${lp.trangThai}">
									            Đang sử dụng
									        </c:when>
									        <c:otherwise>
									            Đã Hủy
									        </c:otherwise>
									    </c:choose>
									</td>
                                    <td>
                                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updateLoaiPhongModel_${lp.maLoaiPhong}">Sửa</button>
                                        <button class="btn btn-danger" onclick="prepareDeleteLoaiPhong(${lp.maLoaiPhong})">Xóa</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                <!-- More rows as needed -->
                            </tbody>
                        </table>
                    </div>

                    <div id="loaiGheTable" style="display:none;">
                        <div class="row mb-2">
						    <div class="col">
						        <h3>Loại Ghế</h3>
						    </div>
						    <div class="col-auto">
						        <button class="btn btn-primary btn_themLoaiGhe" data-bs-toggle="modal" data-bs-target="#addLoaiGheModel">Thêm</button>
						    </div>
						</div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Mã loại ghế</th>
                                    <th>Tên loại ghế</th>
                                    <th>Mô tả</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="lg" items="${loaiGhes}">
                                <tr>
                                    <td>${lg.maLoaiGhe}</td>
                                    <td>${lg.tenLoaiGhe}</td>
                                    <td>
									    <c:choose>
									        <c:when test="${lg.trangThai}">
									            Đang sử dụng
									        </c:when>
									        <c:otherwise>
									            Đã Hủy
									        </c:otherwise>
									    </c:choose>
									</td>
                                    <td>
                                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updateLoaiGheModel_${lg.maLoaiGhe}">Sửa</button>
                                        <button class="btn btn-danger"onclick="prepareDeleteLoaiGhe(${lg.maLoaiGhe})">Xóa</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                <!-- More rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--End Main  -->
    </div>
   	<!--Form ảo để xóa  -->
    <form id="deleteForm" method="POST" action="admin/deletePhong.htm">
    	<input type="hidden" name="maPhong" id="maPhongInput">
	</form>
	<form id="deleteFormLoaiPhong" method="POST" action="admin/deleteLoaiPhong.htm">
    	<input type="hidden" name="maLoaiPhong" id="maLoaiPhongInput">
	</form>
	<form id="deleteFormLoaiGhe" method="POST" action="admin/deleteLoaiGhe.htm">
    	<input type="hidden" name="maLoaiGhe" id="maLoaiGheInput">
	</form>
    <!--End form ảo để xóa  -->
    <!--Model Thêm Phòng  -->
    <div class="modal fade" id="addPhongModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm Phòng</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addPhongForm" method="POST" action="admin/addPhong.htm" enctype="application/x-www-form-urlencoded">
                    
                    <div class="mb-3">
                            <label for="tenPhong" class="form-label">Tên Phòng:</label>
                            <input type="text" class="form-control" id="tenPhong" name="tenPhong" required>
                    </div>                
                    <div class="mb-3">
                        <label for="trangThai" class="form-label">Loại Phòng</label>
                        <select class="form-control" id="maLoaiPhong" name="maLoaiPhong" required>
                        	<c:forEach var="lp" items="${loaiPhongs}">
                            <option value="${lp.maLoaiPhong}">${lp.tenLoaiPhong}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveadd_phim" form="addPhongForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
    <!--End Model Thêm Phòng  -->
    <!--Model Sửa Phòng  -->
    <c:forEach var="p" items="${phongs}">
    <div class="modal fade getmodals" id="updatePhongModel_${p.maPhong}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Sửa Phòng</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form class="updatePhongForm" method="POST" action="admin/updatePhong.htm" enctype="application/x-www-form-urlencoded">
                    <div class="mb-3">
                            <label for="maPhong" class="form-label">Mã Phòng:</label>
                            <input type="text" class="form-control" id="maPhong" name="maPhong" value="${p.maPhong}" readonly>
                    </div>
                    <div class="mb-3">
                            <label for="tenPhong" class="form-label">Tên Phòng:</label>
                            <input type="text" class="form-control" id="tenPhong" name="tenPhong" value="${p.tenPhong}" required>
                    </div>                
                    <div class="mb-3">
                        <label for="trangThai" class="form-label">Loại Phòng</label>
                        <select class="form-control" id="maLoaiPhong" name="maLoaiPhong" required>
						    <c:forEach var="lp" items="${loaiPhongs}">
						        <option value="${lp.maLoaiPhong}" 
						            <c:if test="${lp.maLoaiPhong eq p.loaiPhong.maLoaiPhong}">
						                selected
						            </c:if>
						        >${lp.tenLoaiPhong}</option>
						    </c:forEach>
						</select>
                    </div>
                    <div class="mb-3">
                        <label for="tinhTrang" class="form-label">Tình Trạng Phòng</label>
                        <select class="form-control" id="tinhTrang" name="tinhTrang" required>
						        <option value="1" 
						            <c:if test="${true eq p.tinhTrang}">
						                selected
						            </c:if>
						        >Đang Sử Dụng</option>
						        <option value="0" 
						            <c:if test="${false eq p.tinhTrang}">
						                selected
						            </c:if>
						        >Không Sử Dụng</option>
						</select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveadd_phim" form="updatePhongForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
</c:forEach>
    <!--End Model Sửa Phòng  -->
    <!--Modal thêm loại phòng  -->
    <div class="modal fade" id="addLoaiPhongModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm Loại Phòng</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addLoaiPhongForm" method="POST" action="admin/addLoaiPhong.htm" enctype="application/x-www-form-urlencoded">
                    
                    <div class="mb-3">
                            <label for="tenLoaiPhong" class="form-label">Tên Loại Phòng:</label>
                            <input type="text" class="form-control" id="tenLoaiPhong" name="tenLoaiPhong" required>
                    </div>               
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveadd_Loaiphong" form="addLoaiPhongForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
    <!--End Modal thêm loại phòng  -->
    <!--Modal Sửa loại Phòng  -->
    <c:forEach var="lp" items="${loaiPhongs}">
     <div class="modal fade getmodalsLoaiPhong" id="updateLoaiPhongModel_${lp.maLoaiPhong}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm Loại Phòng</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form class="updateLoaiPhongForm" method="POST" action="admin/updateLoaiPhong.htm" enctype="application/x-www-form-urlencoded" >
                    <div class="mb-3">
                            <label for="maLoaiPhong" class="form-label">Mã Loại Phòng:</label>
                            <input type="text" class="form-control-loaiPhong" id="maLoaiPhong" name="maLoaiPhong" value="${lp.maLoaiPhong}" readonly required>
                    </div>
                    <div class="mb-3">
                            <label for="tenLoaiPhong" class="form-label">Tên Loại Phòng:</label>
                            <input type="text" class="form-control-loaiPhong" id="tenLoaiPhong" name="tenLoaiPhong" value="${lp.tenLoaiPhong}" required>
                    </div>  
                    <div class="mb-3">
                        <label for="trangThai" class="form-label">Tình Trạng Phòng</label>
                        <select class="form-control" name="trangThai" required>
						        <option value="1" 
						        	<c:if test="${true eq lp.trangThai}">
						                selected
						            </c:if>
						        >Đang Sử Dụng</option>
						        <option value="0"
						        	<c:if test="${false eq lp.trangThai}">
						                selected
						            </c:if>
						        >Không Sử Dụng</option>
						</select>
                    </div>             
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary btn_saveadd_Loaiphong" form="updateLoaiPhongForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
</c:forEach>
    <!--End modal sửa loại phòng  -->
    <!--Modal thêm loại ghế  -->
    <div class="modal fade" id="addLoaiGheModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm Loại Ghế</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addLoaiGheForm" method="POST" action="admin/addLoaiGhe.htm" enctype="application/x-www-form-urlencoded">
                    
                    <div class="mb-3">
                            <label for="tenLoaiGhe" class="form-label">Tên Loại Ghế:</label>
                            <input type="text" class="form-control" id="tenLoaiGhe" name="tenLoaiGhe" required>
                    </div>               
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveadd_LoaiGhe" form="addLoaiGheForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
    <!--End Modal thêm loại Ghế  -->
     <!--Modal Sửa loại Ghế  -->
    <c:forEach var="lp" items="${loaiGhes}">
     <div class="modal fade getmodalsLoaiGhe" id="updateLoaiGheModel_${lp.maLoaiGhe}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm Loại Ghe</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form class="updateLoaiGheForm" method="POST" action="admin/updateLoaiGhe.htm" enctype="application/x-www-form-urlencoded" >
                    <div class="mb-3">
                            <label for="maLoaiGhe" class="form-label">Mã Loại Ghế:</label>
                            <input type="text" class="form-control"  name="maLoaiGhe" value="${lp.maLoaiGhe}" readonly required>
                    </div>
                    <div class="mb-3">
                            <label for="tenLoaiGhe" class="form-label">Tên Loại Ghế:</label>
                            <input type="text" class="form-control"  name="tenLoaiGhe" value="${lp.tenLoaiGhe}" required>
                    </div>  
                    <div class="mb-3">
                        <label for="trangThai" class="form-label">Tình Trạng Ghế</label>
                        <select class="form-control" name="trangThai" required>
						        <option value="1" 
						        	<c:if test="${true eq lp.trangThai}">
						                selected
						            </c:if>
						        >Đang Sử Dụng</option>
						        <option value="0"
						        	<c:if test="${false eq  lp.trangThai}">
						                selected
						            </c:if>
						        >Không Sử Dụng</option>
						</select>
                    </div>             
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveadd_LoaiGhe" form="updateLoaiGheForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
</c:forEach>
    <!--End modal sửa loại Ghế  -->
    <!--Phần script  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {   
        
        const modals = document.querySelectorAll('.getmodals');
        // Chỉnh sửa Phòng
        modals.forEach((modal) => {
            const formControls = modal.querySelectorAll('.form-control');
            const saveButton = modal.querySelector('.btn-primary');
            const cancelButton = modal.querySelector('.modal-footer .btn-secondary');
            const closeButton = modal.querySelector('.modal-header .custom-close-btn');
            

            function resetFormState() {
                // Thêm thuộc tính readonly cho các trường dữ liệu
                /* formControls.forEach(input => {
                    input.setAttribute('readonly', true);
                });
                
                trangThai.addAttribute('disabled'); */

                // Ẩn nút "Lưu" và hiển thị nút "Chỉnh Sửa"
                
            }


            cancelButton.addEventListener('click', resetFormState);
            closeButton.addEventListener('click', resetFormState);

            saveButton.addEventListener('click', function() {
                // Thiết lập hành động của form để đến trang xử lý cập nhật
                const formPhong = modal.querySelector('.updatePhongForm');
                formPhong.action = "admin/updatePhong.htm";
                
                // Gửi form
                formPhong.submit();
            });
        });  
        // End Chỉnh sửa phòng
        
        const modalLoaiPhongs = document.querySelectorAll('.getmodalsLoaiPhong');
        console.log(modalLoaiPhongs);
        // Chỉnh sửa Loại Phòng
        modalLoaiPhongs.forEach((modal) => {
            const formControls = modal.querySelectorAll('.form-control-loaiPhong');
            const saveButton = modal.querySelector('.btn_saveadd_Loaiphong');
            console.log(saveButton);
            const cancelButton = modal.querySelector('.modal-footer .btn-secondary');
            const closeButton = modal.querySelector('.modal-header .custom-close-btn');
            

            function resetFormState() {
                // Thêm thuộc tính readonly cho các trường dữ liệu
                /* formControls.forEach(input => {
                    input.setAttribute('readonly', true);
                });
                
                trangThai.addAttribute('disabled'); */

                // Ẩn nút "Lưu" và hiển thị nút "Chỉnh Sửa"
                
            }


            cancelButton.addEventListener('click', resetFormState);
            closeButton.addEventListener('click', resetFormState);

            saveButton.addEventListener('click', function() {
                // Thiết lập hành động của form để đến trang xử lý cập nhật
                console.log("Hello world");
                const formPhong = modal.querySelector('.updateLoaiPhongForm');
                formPhong.action = "admin/updateLoaiPhong.htm";
                
                // Gửi form
                formPhong.submit();
            });
        });  
        // End Chỉnh Loại Phòng
         const modalLoaiGhes = document.querySelectorAll('.getmodalsLoaiGhe');
        // Chỉnh sửa Loại Ghế
        modalLoaiGhes.forEach((modal) => {
            const formControls = modal.querySelectorAll('.form-control');
            const saveButton = modal.querySelector('.btn-primary');
            const cancelButton = modal.querySelector('.modal-footer .btn-secondary');
            const closeButton = modal.querySelector('.modal-header .custom-close-btn');
            

            function resetFormState() {
                // Thêm thuộc tính readonly cho các trường dữ liệu
                /* formControls.forEach(input => {
                    input.setAttribute('readonly', true);
                });
                
                trangThai.addAttribute('disabled'); */

                // Ẩn nút "Lưu" và hiển thị nút "Chỉnh Sửa"
                
            }


            cancelButton.addEventListener('click', resetFormState);
            closeButton.addEventListener('click', resetFormState);

            saveButton.addEventListener('click', function() {
                // Thiết lập hành động của form để đến trang xử lý cập nhật
                const formGhe = modal.querySelector('.updateLoaiGheForm');
                formGhe.action = "admin/updateLoaiGhe.htm";
                
                // Gửi form
                formGhe.submit();
            });
        });  
        // End Chỉnh Loại Ghế
        // Chi tiết Phòng:
        	var buttons = document.querySelectorAll('.chitietPhong_btn');
			
        	buttons.forEach((button) => {
        		button.addEventListener('click', function() {
        			var maPhong = button.getAttribute('data-ma-phong');
        			var url = 'admin/chiTietPhong.htm?maPhong=' + maPhong;
    		
    		        // Chuyển hướng người dùng đến đường dẫn mới
    		        window.location.href = url;
    		    });
        	});
		    
        //end
    });
    // Xóa Phòng
    function prepareDelete(maPhong) {
	    // Đặt giá trị cho trường ẩn trong form
	    document.getElementById('maPhongInput').value = maPhong;
	    // Gửi yêu cầu POST bằng cách gửi form
	    document.getElementById('deleteForm').submit();
	}
    // End Xóa Phòng
    // Thêm Loại Phòng
	const addLoaiPhongbtn = document.querySelector('.btn_saveadd_Loaiphong');
	addLoaiPhongbtn.addEventListener('click', function() {
        // Thiết lập hành động của form để đến trang xử lý cập nhật
        const formLoaiPhong = document.querySelector('#addLoaiPhongForm');
        formLoaiPhong.action = "admin/addLoaiPhong.htm";
        // Gửi form
      	formLoaiPhong.submit();
    });
	// Xóa Loại Phòng
	 function prepareDeleteLoaiPhong(maLoaiPhong) {
	    // Đặt giá trị cho trường ẩn trong form
	    document.getElementById('maLoaiPhongInput').value = maLoaiPhong;
	    // Gửi yêu cầu POST bằng cách gửi form
	    document.getElementById('deleteFormLoaiPhong').submit();
	}
	// End Xóa Loại Phòng
	// Thêm Loại Ghế
	const addLoaiGhebtn = document.querySelector('.btn_saveadd_LoaiGhe');
	addLoaiGhebtn.addEventListener('click', function() {
        // Thiết lập hành động của form để đến trang xử lý cập nhật
        const formLoaiGhe = document.querySelector('#addLoaiGheForm');
        formLoaiGhe.action = "admin/addLoaiGhe.htm";
        // Gửi form
      	formLoaiGhe.submit();
    });
	// Xóa Loại Ghế
	 function prepareDeleteLoaiGhe(maLoaiGhe) {
	    // Đặt giá trị cho trường ẩn trong form
	    document.getElementById('maLoaiGheInput').value = maLoaiGhe;
	    // Gửi yêu cầu POST bằng cách gửi form
	    document.getElementById('deleteFormLoaiGhe').submit();
	}
	// End Xóa Loại Ghế
    </script>
</body>
</html>
