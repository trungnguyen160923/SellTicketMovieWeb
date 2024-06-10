<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/account-info.css">
<title>Thông tin tài khoản</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap')
	;

.head {
	display: flex;
}

.head h2 {
	margin-left: 500px;
	color: rgb(84, 180, 235);
}

.head button {
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 5px;
	background-color: rgb(84, 180, 235);
	color: white;
	padding: 0 10px 0 10px;
	font-size: 14px; /* Adjust font size as needed */
}

.AdminInfoContainer {
	font-family: 'Roboto', sans-serif;
}

.AdminInfo {
	margin-left: 30px;
	font-size: 1.5rem;
}

.AdminInfo h2 {
	text-align: center;
}

.text-label {
	font-weight: normal;
	padding: 20px;
}

.text-value {
	font-weight: bold;
}

.wrapper {
	display: flex;
	justify-content: space-between;
	align-items: stretch;
}

.footer {
	bottom: 0;
}
</style>
<body>
	<div class="AdminInfoContainer">
		<div class="AdminInfo">
			<div class="card-body p-2">
				<div class="head">
					<button onClick="goBack()">Quay lại</button>
					<h2>Thông Tin Tài Khoản</h2>
				</div>
				<div class="py-2" style="font-size: 0.875em; padding: 0 !important;">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-4 px-0">
								<div class="d-inline-block text-label">Họ và tên:</div>
								<div class="d-inline-block text-value">${user.hoTen}</div>
							</div>
							<div class="col-sm-4 px-0">
								<div class="d-inline-block text-label">Email:</div>
								<div class="d-inline-block text-value">${user.email}</div>
							</div>
							<div class="col-sm-4 px-0">
								<div class="d-inline-block text-label">Ngày sinh:</div>
								<div class="d-inline-block text-value">
									<fmt:formatDate value="${user.ngaySinh}" pattern="dd/MM/yyyy" />
								</div>
							</div>
							<div class="col-sm-4 px-0">
								<div class="d-inline-block text-label">Địa chỉ:</div>
								<div class="d-inline-block text-value">${user.diaChi}</div>
							</div>
							<div class="col-sm-4 px-0">
								<div class="d-inline-block text-label">Số điện thoại:</div>
								<div class="d-inline-block text-value">${user.sdt}</div>
							</div>
							<div class="col-sm-4 px-0">
								<div class="d-inline-block text-label">Giới tính:</div>
								<div class="d-inline-block text-value">${user.gioiTinh}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="wrapper">
			<jsp:include page="/WEB-INF/views/user/Update.jsp" />
			<jsp:include page="/WEB-INF/views/user/ChangePass.jsp" />
		</div>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>

	<script>

		<c:if test="${not empty error}">
		alert("${error}");
		</c:if>
		<c:if test="${not empty message}">
		alert("${message}");
		</c:if>
	</script>
</body>
</html>
