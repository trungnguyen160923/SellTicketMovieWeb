<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/account-info.css">
<title>Thông tin tài khoản</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
@import url('${pageContext.request.contextPath}/assets/css/colors.css'); /* Import custom colors */

/* AdminInfoContainer */
.AdminInfoContainer {
    background: url('${pageContext.request.contextPath}/assets/images/account/login.jpg') no-repeat center center/cover;
    font-family: 'Roboto', sans-serif;
	align-items: center;
	height: 100vh;
}

/* Return Button */
.return.btn-primary {
    background-color: rgb(84, 180, 235);
    border: none;
    border-radius: 5px;
    margin-top: 20px;
    margin-left: 20px;
    font-size: 1.5rem;
}

/* Admin Info */
.AdminInfo {
    max-width: 900px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.AdminInfo h2 {
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}

.AdminInfo .row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.text-label {
    font-weight: normal;
    flex: 1;
}

.text-value {
    font-weight: bold;
    flex: 2;
}

/* Buttons Wrapper */
.buttons-wrapper {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.buttons-wrapper button {
    background-color: rgb(84, 180, 235);
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.5rem;
    font-weight: bold;
    transition: background-color 0.3s ease;
    margin: 0 10px;
}

.footer {
    bottom: 0;
}
</style>
</head>
<body>
    <div class="AdminInfoContainer">
        <button class="return btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/user/home.htm'">Quay lại</button>
        <div class="AdminInfo">
            <h2>Thông Tin Tài Khoản</h2>
            <div class="card-body p-2">
                <div class="py-2" style="font-size: 0.875em;">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-4 px-0">
                                <p><span class="text-label">Họ và tên:</span> <span class="text-value">${user.hoTen}</span></p>
                            </div>
                            <div class="col-sm-4 px-0">
                                <p><span class="text-label">Email:</span> <span class="text-value">${user.email}</span></p>
                            </div>
                            <div class="col-sm-4 px-0">
                                <p><span class="text-label">Ngày sinh:</span> <span class="text-value"><fmt:formatDate value="${user.ngaySinh}" pattern="dd/MM/yyyy" /></span></p>
                            </div>
                            <div class="col-sm-4 px-0">
                                <p><span class="text-label">Địa chỉ:</span> <span class="text-value">${user.diaChi}</span></p>
                            </div>
                            <div class="col-sm-4 px-0">
                                <p><span class="text-label">Số điện thoại:</span> <span class="text-value">${user.sdt}</span></p>
                            </div>
                            <div class="col-sm-4 px-0">
                                <p><span class="text-label">Giới tính:</span> <span class="text-value">${user.gioiTinh}</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="buttons-wrapper">
            <button onclick="window.location.href='${pageContext.request.contextPath}/user/update-form.htm'" class="update">Chỉnh Sửa Thông Tin Cá Nhân</button>
            <button onclick="window.location.href='${pageContext.request.contextPath}/user/change-password.htm'" class="pass">Thay Đổi Mật Khẩu Tài Khoản</button>
        </div>
        <jsp:include page="/WEB-INF/views/footer.jsp" />
    </div>
</body>
</html>
