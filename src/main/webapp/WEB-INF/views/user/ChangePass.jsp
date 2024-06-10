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
.error-message {
	color: red;
	display: none;
	font-size: 14px;
	margin-top: 5px;
}

.alert {
	padding: 15px;
	border-radius: 5px;
	margin-top: 20px;
}

.alert-danger {
	background-color: #f8d7da;
	color: #721c24;
}

.alert-success {
	background-color: #d4edda;
	color: #155724;
}

.toggle-password {
	position: absolute;
	right: 5px;
	top: 35px;
	cursor: pointer;
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
	padđing-right: 20px;
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
	<!-- Change Password Form -->
	<div class="password">
		<h2 class="title">Thay Đổi Mật Khẩu</h2>
		<form action="${pageContext.request.contextPath}/Change-pass.htm"
			method="post" onsubmit="return validateForm()">
			<div class="row">
				<div class="form-group row2">
					<div>
						<label for="oldPassword">Nhập lại mật khẩu cũ:<span>*</span></label>
						<input type="password" placeholder="Nhập mật khẩu của bạn"
							id="oldPassword" name="oldPassword" class="form-control" />
							<i class="gg-eye toggle-password"
										onclick="togglePassword('oldPassword')"></i>
						<div id="oldPassword-error" class="error-message"></div>
					</div>
				</div>
				<div class="form-group row2">
					<div>
						<label for="newPassword">Nhập mật khẩu mới:<span>*</span></label>
						<input type="password" placeholder="Nhập mật khẩu của bạn"
							id="newPassword" name="newPassword" class="form-control" />
							<i class="gg-eye toggle-password"
										onclick="togglePassword('newPassword')"></i>
						<div id="newPassword-error" class="error-message"></div>
					</div>
				</div>
				<div class="form-group row2">
					<div>
						<label for="passwordConfirm">Xác nhận mật khẩu mới:<span>*</span></label>
						<input type="password" placeholder="Xác nhận lại mật khẩu của bạn"
							id="passwordConfirm" name="passwordConfirm" class="form-control" />
							<i class="gg-eye toggle-password"
										onclick="togglePassword('passwordConfirm')"></i>
						<div id="passwordConfirm-error" class="error-message"></div>
					</div>
				</div>
			</div>
			<div class="btn-footer">
				<input type="submit" value="Lưu thay đổi" class="btn-btn">
			</div>
		</form>
	</div>
	<script>
	function validateForm() {
		var password = document.getElementById("oldPassword").value;
		var passwordnew = document.getElementById("newPassword").value;
		var passwordConfirm = document.getElementById("passwordConfirm").value;
		var passwordnewError = document.getElementById("newPassword-error");
		var passwordError = document.getElementById("password-error");
		var passwordConfirmError = document.getElementById("passwordConfirm-error");
		var valid = true;
		
		if (passwordnew !== passwordConfirm) {
			alert("Mật khẩu mới và xác nhận mật khẩu không khớp!");
			return false;
		}
		
		if (password === "") {
			passwordError.innerText = "Mật khẩu không được để trống.";
			passwordError.style.display = "block";
			valid = false;
		} else if (password.length < 6) {
			passwordError.innerText = "Mật khẩu phải chứa ít nhất 6 ký tự.";
			passwordError.style.display = "block";
			valid = false;
		} else if (!(/[A-Z]/.test(password))) {
			passwordError.innerText = "Mật khẩu phải chứa ít nhất một chữ hoa.";
			passwordError.style.display = "block";
			valid = false;
		} else if (!(/[0-9]/.test(password))) {
			passwordError.innerText = "Mật khẩu phải chứa ít nhất một chữ số.";
			passwordError.style.display = "block";
			valid = false;
		} else {
			passwordError.style.display = "none";
		}
		
		if (passwordnew === "") {
			passwordnewError.innerText = "Mật khẩu mới không được để trống.";
			passwordnewError.style.display = "block";
			valid = false;
		} else if (passwordnew.length < 6) {
			passwordnewError.innerText = "Mật khẩu mới phải chứa ít nhất 6 ký tự.";
			passwordnewError.style.display = "block";
			valid = false;
		} else if (!(/[A-Z]/.test(passwordnew))) {
			passwordnewError.innerText = "Mật khẩu mới phải chứa ít nhất một chữ hoa.";
			passwordnewError.style.display = "block";
			valid = false;
		} else if (!(/[0-9]/.test(passwordnew))) {
			passwordnewError.innerText = "Mật khẩu mới phải chứa ít nhất một chữ số.";
			passwordnewError.style.display = "block";
			valid = false;
		} else {
			passwordnewError.style.display = "none";
		}
		
		if (passwordConfirm === "") {
			passwordConfirmError.innerText = "Mật khẩu xác nhận không được để trống.";
			passwordConfirmError.style.display = "block";
			valid = false;
		} else {
			passwordConfirmError.style.display = "none";
		}
		return true;
	}
	
	function togglePassword(id) {
		var input = document.getElementById(id);
		var icon = input.nextElementSibling;
		if (input.type === "password") {
			input.type = "text";
			icon.classList.remove('gg-eye');
			icon.classList.add('gg-eye-alt');
		} else {
			input.type = "password";
			icon.classList.remove('gg-eye-alt');
			icon.classList.add('gg-eye');
		}
	}
</script>
</body>
</html>
