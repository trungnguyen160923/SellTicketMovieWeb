<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Phòng</title>
<base href="${pageContext.servletContext.contextPath}/*">
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
    rel="stylesheet" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
    	background-color: #b1d1d9;
        width: 100%;
        height: 100vh;
        margin: 0;
        padding: 0;
    }

    .center {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(to right, rgb(162, 216, 162), rgb(102, 194, 102));
    }

    .tickets {
        width: 550px;
        height: fit-content;
        border: 0.4mm solid rgba(0, 0, 0, 0.08);
        border-radius: 3mm;
        box-sizing: border-box;
        padding: 10px;
        font-family: poppins;
        max-height: 96vh;
        overflow: auto;
        background: white;
        box-shadow: 0px 25px 50px -12px rgba(0, 0, 0, 0.25);
    }

    .ticket-selector {
        background: rgb(243, 243, 243);
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-direction: column;
        box-sizing: border-box;
        padding: 20px;
    }

    .head {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 30px;
    }

    .title {
        font-size: 16px;
        font-weight: 600;
    }

    .seats {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        min-height: 150px;
        position: relative;
    }

    .status {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-evenly;
    }

    .seats::before {
        content: "";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translate(-50%, 0);
        width: 220px;
        height: 7px;
        background: rgb(141, 198, 255);
        border-radius: 0 0 3mm 3mm;
        border-top: 0.3mm solid rgb(180, 180, 180);
    }

    .item {
        font-size: 12px;
        position: relative;
    }

    .item::before {
        content: "";
        position: absolute;
        top: 50%;
        left: -12px;
        transform: translate(0, -50%);
        width: 10px;
        height: 10px;
        background: rgb(255, 255, 255);
        outline: 0.2mm solid rgb(120, 120, 120);
        border-radius: 0.3mm;
    }

    .item:nth-child(2)::before {
        background: rgb(180, 180, 180);
        outline: none;
    }

    .item:nth-child(3)::before {
        background: rgb(28, 185, 120);
        outline: none;
    }

    .item:nth-child(4)::before {
        background: rgb(255, 0, 0);
        outline: none;
    }

    .all-seats {
        display: grid;
        grid-template-columns: repeat(10, 1fr);
        grid-gap: 15px;
        margin: 60px 0;
        margin-top: 20px;
        position: relative;
    }

    .seat {
        width: 20px;
        height: 20px;
        background: white;
        border-radius: 0.5mm;
        outline: 0.3mm solid rgb(180, 180, 180);
        cursor: pointer;
    }

    .all-seats input:checked+label {
        background: rgb(28, 185, 120);
        outline: none;
    }

    .seat.booked {
        background: rgb(180, 180, 180);
        outline: none;
    }

    .seat.unavailable {
        background: rgb(255, 0, 0);
        outline: none;
    }

    input {
        display: none;
    }

    .timings {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-top: 30px;
    }

    .dates {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .dates-item {
        width: 50px;
        height: 40px;
        background: rgb(233, 233, 233);
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 10px 0;
        border-radius: 2mm;
        cursor: pointer;
    }

    .day {
        font-size: 12px;
    }

    .times {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 10px;
    }

    .time {
        font-size: 14px;
        width: fit-content;
        padding: 7px 14px;
        background: rgb(233, 233, 233);
        border-radius: 2mm;
        cursor: pointer;
    }

    .timings input:checked+label {
        background: rgb(28, 185, 120);
        color: white;
    }

    .price {
        width: 100%;
        box-sizing: border-box;
        padding: 10px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .total {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: center;
        font-size: 16px;
        font-weight: 500;
    }

    .total span {
        font-size: 11px;
        font-weight: 400;
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
</head>
<body>
<div class="container">
    <header class="navbar navbar-expand-lg navbar-light col" style="margin-bottom: 4.5rem;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="assets/images/logo/logo.png" alt="" class="mr-2">Pengu</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
        <button class="btn btn-info"
            style="width: 150px; height:50px;border-radius: 15px; background: lightskyblue;color:aliceblue">Đăng Xuất</button>
    </header>
    <div class="col-12 ">
        <div class="row ">
            <div class="col-md-6">
                <h3>Chi Tiết Phòng</h3>
                <p><strong>Mã Phòng:</strong> ${phong.maPhong}</p>
                <p><strong>Tên Phòng:</strong> ${phong.tenPhong}</p>
                <p><strong>Loại Phòng:</strong> ${phong.loaiPhong.tenLoaiPhong}</p>
            </div>
            <div class="col-md-6 text-right">
                <c:choose>
                    <c:when test="${not empty ghes}">
                    	<button class="btn btn-danger deleteAllGhebtn">Xóa Tất Cả Ghế</button>
                        <!-- Không hiển thị nút khi có ghế -->
                    </c:when>
                    <c:otherwise>
                        <!-- Hiển thị nút khi không có ghế -->
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addGhesModel">Thêm Ghế</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="col-12">
            <div class="center">
                <div class="tickets">
                    <div class="ticket-selector">
                        <div class="head">
                            <div class="title">Sơ đồ phòng</div>
                        </div>
                        <div class="seats">
                            <div class="status">
                                <div class="item">Available</div>
                                <div class="item">Booked</div>
                                <div class="item">Selected</div>
                                <div class="item">Unavailable</div>
                            </div>
                            <div class="all-seats">
                                <c:forEach var="ghe" items="${ghes}">
                                    <input type="checkbox" name="tickets" id="s${ghe.maGhe}" value="${ghe.maGhe}"/>
                                    <label for="s${ghe.maGhe}"
                                        class="seat
                                        <c:choose>
                                            <c:when test="${ghe.trangThai == 1}">
                                                booked
                                            </c:when>
                                            <c:when test="${ghe.trangThai == -1}">
                                                unavailable
                                            </c:when>
                                        </c:choose>"
                                        <c:choose>
                                            <c:when test="${ghe.trangThai == 1}">
                                                booked
                                            </c:when>
                                            <c:when test="${ghe.trangThai == -1}">
                                                unavailable
                                            </c:when>
                                        </c:choose>"
                                        data-bs-toggle="tooltip" title="${ghe.loaiGhe.tenLoaiGhe}"
                                        >
                                        ${ghe.hang}${ghe.cot}
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="price">
                        <div class="total">
                            <span>Ghế được chọn</span>
                            <div class="count">0</div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-danger deleteBtn" onclick="prepareDelete()" disabled>Xóa</button>
                            <button type="submit" class="btn btn-primary updateBtn" data-bs-toggle="modal" data-bs-target="#updateGheModel"  disabled>Cập nhật</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Form ảo để xóa  -->
<form id="deleteFormGhe" method="POST" action="admin/deleteGhe.htm">
    	<input type="hidden" name="maGhe" id="maGheInput" value="">
    	<input type="hidden" name="maPhong" id="maPhongInput" value="${phong.maPhong}">
</form>
<form id="deleteAllFormGhe" method="POST" action="admin/deleteAllGhe.htm">
    	<input type="hidden" name="maPhong" id="maPhongInput" value="${phong.maPhong}">
</form>
<!--End Form ảo để xóa  -->
<!--modal cập nhật ghế  -->
<div class="modal fade getmodals" id="updateGheModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Cập nhật ghế</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form class="updateGheForm" method="POST" action="admin/updateGhe.htm" enctype="application/x-www-form-urlencoded">               
                    <div class="mb-3">
                        <label for="maLoaiGhe" class="form-label">Loại Ghế</label>
                        <select class="form-control" id="maLoaiGhe" name="maLoaiGhe" required>
						    <c:forEach var="lp" items="${loaiGhes}">
						        <option value="${lp.maLoaiGhe}" 
						        >${lp.tenLoaiGhe}</option>
						    </c:forEach>
						</select>
                    </div>
                    <div class="mb-3">
                        <label for="trangThai" class="form-label">Trạng Thái</label>
                        <select class="form-control" id="trangThai" name="trangThai" required>
						        <option value= "0">Sử Dụng Được</option>
						        <option value="-1" >Không Sử Dụng Được</option>
						</select>
                    </div>
                     <!-- Hidden input to store selected seat IDs -->
                    <input type="hidden" name="ghes" id="ghes" value="">
                    <input type="hidden" name="maPhong" id="maPhongInputModal" value="${phong.maPhong}">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveupdate_ghe" form="updateGheForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
<!--End Modal cập nhật ghế  -->
<!--Modal Thêm Ghế   -->
<div class="modal fade getmodals" id="addGhesModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm ghế</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form class="addGheForm" method="POST" action="admin/addGhe.htm" enctype="application/x-www-form-urlencoded">               
                    <div class="mb-3">
                            <label for="hang" class="form-label">Số Hàng:</label>
                            <input type="number" class="form-control" id="hang" name="hang" required>
                    </div>
                    <div class="mb-3">
                            <label for="cot" class="form-label">Số Cột:</label>
                            <input type="number" class="form-control" id="cot" name="cot" required>
                    </div>
                    <div class="mb-3">
                        <label for="maLoaiGhe" class="form-label">Loại Ghế</label>
                        <select class="form-control" id="maLoaiGhe" name="maLoaiGhe" required>
						    <c:forEach var="lp" items="${loaiGhes}">
						        <option value="${lp.maLoaiGhe}" 
						        >${lp.tenLoaiGhe}</option>
						    </c:forEach>
						</select>
                    </div>
                     <!-- Hidden input to store selected seat IDs -->
                    <input type="hidden" name="trangThai" value="0">
                    <input type="hidden" name="maPhong" value="${phong.maPhong}">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveadd_ghe" form="addGheForm">Lưu</button>
            </div>
        </div>
    </div>
</div>
<!--End Modal Thêm Ghế  -->
<!--Thông báo  -->
        <c:if test="${not empty message}">
                    <script>
                        alert("${message}");
                    </script>
         		</c:if>
        <!--End Thông báo  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous">
</script>
<script>
    let seats = document.querySelector(".all-seats");

    let tickets = seats.querySelectorAll("input");
    let countElement = document.querySelector(".count");
    let deleteBtn = document.querySelector(".deleteBtn");
    let updateBtn = document.querySelector(".updateBtn");

    tickets.forEach((ticket) => {
        ticket.addEventListener("change", () => {
            let count = document.querySelector(".count").innerHTML;
            count = Number(count);

            if (ticket.checked) {
                count += 1;
            } else {
                count -= 1;
            }
            document.querySelector(".count").innerHTML = count;

            // Enable or disable buttons based on the count of selected seats
            if (count === 0) {
                deleteBtn.disabled = true;
                updateBtn.disabled = true;
            } else {
                updateBtn.disabled = false;
                deleteBtn.disabled = count !== 1; // Enable delete button only if one seat is selected
            }
        });
    });
    // Xóa Ghế
    function prepareDelete() {
	    // Đặt giá trị cho trường ẩn trong form
	    let tickets = seats.querySelectorAll("input");
	    tickets.forEach((ticket) => {
	    	if (ticket.checked) {
	    		document.getElementById('maGheInput').value =ticket.value
            }
	    });
	    // Gửi yêu cầu POST bằng cách gửi form
	    document.getElementById('deleteFormGhe').submit();
	}
    // Cập nhật ghế
    const saveButton = document.querySelector('.btn_saveupdate_ghe');
    saveButton.addEventListener('click', function() {
        // Thiết lập hành động của form để đến trang xử lý cập nhật
        const formPhong = document.querySelector('.updateGheForm');
        formPhong.action = "admin/updateGhe.htm";
        let selectedSeats = [];
        tickets.forEach((ticket) => {
            if (ticket.checked) {
                selectedSeats.push(ticket.value);
            }
        });
        document.getElementById('ghes').value = selectedSeats.join(',');
        // Gửi form
      	formPhong.submit();
    });
    
    // Thêm Ghế
    // Cập nhật ghế
    const saveButtonAddGhe = document.querySelector('.btn_saveadd_ghe');
    saveButtonAddGhe.addEventListener('click', function() {
        // Thiết lập hành động của form để đến trang xử lý cập nhật
        const formGhe = document.querySelector('.addGheForm');
        formGhe.action = "admin/addGhe.htm";
        // Gửi form
      	formGhe.submit();
    });
    // Xóa hết ghế:
    	const deleteAllGheBtn = document.querySelector('.deleteAllGhebtn');
    	deleteAllGheBtn.addEventListener('click', function() {
            // Thiết lập hành động của form để đến trang xử lý cập nhật
            const formGhe = document.querySelector('#deleteAllFormGhe');
            formGhe.action = "admin/deleteAllGhe.htm";
            // Gửi form
          	formGhe.submit();
        });
</script>
</body>
</html>
