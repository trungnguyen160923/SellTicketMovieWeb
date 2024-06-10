<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</head>
<style>
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

.password .title, .update .title {
	display: flex;
	justify-content: center;
	color: rgb(84, 180, 235);
	font-size: 2rem;
}

.row1 {
	width: 100%;
	display: flex;
}

.row2 {
	width: 100%;
}

.update, .password {
	padding: 20px 20px 0px 20px;
	flex: 1;
	margin: 0 5px 10px 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.update .form-container, .password .form-container {
	display: flex;
	justify-content: flex-end;
}

.update label, .password label {
	font-weight: bold;
}

.update input, .password input, .update select, .password select {
	padding: 8px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.update .save, .password .save {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	padding-right: 20px;
}

.update .save:hover, .password .save:hover {
	background-color: #0056b3;
}

.button {
	padding-right: 20px;
}

.btn-footer {
	display: flex;
	justify-content: right;
}

.btn-footer .btn-btn {
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	margin: 20px 20px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s ease;
	background-color: rgb(84, 180, 235);
}
</style>
<body>
	<!-- Update Form -->
	<div class="update">
		<h2 class="title">Chỉnh Sửa Thông Tin Cá Nhân</h2>
		<form:form class="account-form"
			action="${pageContext.request.contextPath}/update-in4.htm"
			method="post" onsubmit="return validateForm()" modelAttribute="user">
			<div class="row">
				<div class="form-group row1">
					<div class="col-md-6 group">
						<label for="fullname">Tên đầy đủ<span>*</span></label>
						<form:input type="text" placeholder="Nhập họ và tên của bạn"
							id="fullname" path="hoTen" class="form-control" />
						<div id="fullname-error" class="error-message"></div>
					</div>
					<div class="col-md-6 group">
						<label for="address">Địa chỉ<span>*</span></label>
						<form:input type="text" placeholder="Nhập địa chỉ của bạn"
							id="address" path="diaChi" class="form-control" />
						<div id="address-error" class="error-message"></div>
					</div>
				</div>
				<div class="form-group row1">
					<div class="col-md-6 group">
						<label for="email">Email<span>*</span></label>
						<form:input type="email" placeholder="Nhập email của bạn"
							id="email" path="email" class="form-control" />
						<div id="email-error" class="error-message"></div>
					</div>
					<div class="col-md-6 group">
						<label for="phone">Điện thoại<span>*</span></label>
						<form:input type="text" placeholder="Nhập số điện thoại của bạn"
							id="phone" path="sdt" class="form-control" />
						<div id="phone-error" class="error-message"></div>
					</div>
				</div>
				<div class="form-group row1">
					<div class="col-md-6 group">
						<label for="birthdate">Ngày sinh<span>*</span></label>
						<form:input type="date"
							placeholder="Nhập theo định dạng DD/MM/YYYY" id="birthdate"
							path="ngaySinh" class="form-control" />
					</div>
					<div class="col-md-6">
						<label for="gender">Giới tính<span>*</span></label>
						<form:select id="gender" path="gioiTinh" class="form-control">
							<form:option value="Nam">Nam</form:option>
							<form:option value="Nữ">Nữ</form:option>
						</form:select>
						<div id="gender-error" class="error-message"></div>
					</div>
				</div>
			</div>
			<div class="btn-footer">
				<input type="submit" value="Lưu thay đổi" class="btn-btn">
			</div>
		</form:form>
	</div>
	<script>
	function validateForm() {
		var fullname = document.getElementById("fullname").value;
		var address = document.getElementById("address").value;
		var phone = document.getElementById("phone").value;
		var email = document.getElementById("email").value;
		var birthdate = document.getElementById("birthdate").value;
		var gender = document.getElementById("gender").value;
		var fullnameError = document.getElementById("fullname-error");
		var addressError = document.getElementById("address-error");
		var phoneError = document.getElementById("phone-error");
		var emailError = document.getElementById("email-error");
		var birthdateError = document.getElementById("birthdate-error");
		var genderError = document.getElementById("gender-error");
		var valid = true;

		if (fullname === "") {
			fullnameError.innerText = "Tên đầy đủ không được để trống.";
			fullnameError.style.display = "block";
			valid = false;
		} else if (/\d/.test(fullname)) {
			fullnameError.innerText = "Tên đầy đủ không được chứa chữ số.";
			fullnameError.style.display = "block";
			valid = false;
		} else {
			fullnameError.style.display = "none";
		}

		if (address === "") {
			addressError.innerText = "Địa chỉ không được để trống.";
			addressError.style.display = "block";
			valid = false;
		} else {
			addressError.style.display = "none";
		}

		if (phone === "") {
			phoneError.innerText = "Số điện thoại không được để trống.";
			phoneError.style.display = "block";
			valid = false;
		} else if (!/^\d+$/.test(phone)) {
			phoneError.innerText = "Số điện thoại chỉ được chứa chữ số.";
			phoneError.style.display = "block";
			valid = false;
		} else if (!/^\d{10}$/.test(phone)) {
			phoneError.innerText = "Số điện thoại phải chứa đúng 10 chữ số.";
			phoneError.style.display = "block";
			valid = false;
		} else {
			phoneError.style.display = "none";
		}

		if (email === "") {
			emailError.innerText = "Email không được để trống.";
			emailError.style.display = "block";
			valid = false;
		} else if (!(/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email))) {
			emailError.innerText = "Email không hợp lệ.";
			emailError.style.display = "block";
			valid = false;
		} else {
			emailError.style.display = "none";
		}

		if (birthdate === "") {
			birthdateError.innerText = "Ngày sinh không được để trống.";
			birthdateError.style.display = "block";
			valid = false;
		} else {
			birthdateError.style.display = "none";
		}

		if (gender === "") {
			genderError.innerText = "Giới tính không được để trống.";
			genderError.style.display = "block";
			valid = false;
		} else {
			genderError.style.display = "none";
		}
		return false;
	}
</script>
</body>
</html>
