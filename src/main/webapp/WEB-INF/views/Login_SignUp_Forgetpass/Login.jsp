<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
body#login-form {
	background-image: url("./assets/images/account/account-bg.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	padding: 10px;
}

.form-heading {
	color: #fff;
	font-size: 23px;
}

.panel h2 {
	color: #444444;
	font-size: 18px;
	margin: 0 0 8px 0;
}

.panel p {
	color: #777777;
	font-size: 14px;
	margin-bottom: 30px;
	line-height: 24px;
}

.login-form .form-control {
	background: #f7f7f7 none repeat scroll 0 0;
	border: 1px solid #d4d4d4;
	border-radius: 4px;
	font-size: 14px;
	height: 50px;
	line-height: 50px;
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 2px;
	margin: 10px auto 30px;
	max-width: 38%;
	padding: 50px 70px 70px 71px;
}

.login-form .form-group {
	margin-bottom: 10px;
}

.login-form {
	text-align: center;
}

.forgot a {
	color: #777777;
	font-size: 14px;
	text-decoration: underline;
}

.login-form .btn.btn-primary {
	background: #f0ad4e none repeat scroll 0 0;
	border-color: #f0ad4e;
	color: #ffffff;
	font-size: 14px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0;
}

.forgot {
	text-align: left;
	margin-bottom: 30px;
}

.botto-text {
	color: #ffffff;
	font-size: 14px;
	margin: auto;
}

.login-form .btn.btn-primary.reset {
	background: #ff9900 none repeat scroll 0 0;
}

.back {
	text-align: left;
	margin-top: 10px;
}

.back a {
	color: #444444;
	font-size: 13px;
	text-decoration: none;
}
</style>
<title>Cinema Ticket</title>
    <base href="${pageContext.servletContext.contextPath}/*">
</head>
<body id="login-form">
	<div class="container">
		<div class="login-form">
			<div class="main-div">
				<div class="panel">
					<h2>Cinema Ticket</h2>
				</div>
				<form class="account-form"
					action="${pageContext.request.contextPath}/check-login.htm"
					method="post" onsubmit="return validateForm()">
					<div class="form-group">
						<label for="username">Tên Đăng Nhập<span>*</span></label> <input
							type="text" placeholder="Nhập tên đăng nhập của bạn"
							id="username" name="email" value="${taikhoan.email}">
						<div id="username-error" class="error-message"
							style="color: red; display: none;"></div>
					</div>
					<div class="form-group">
						<label for="password">Mật Khẩu<span>*</span></label> <input
							type="password" placeholder="Nhập mật khẩu của bạn" id="password"
							name="matKhau" value="${taikhoan.matKhau}">
						<div id="password-error" class="error-message"
							style="color: red; display: none;"></div>
					</div>
					<div class="form-group">
						<a href="forgot.htm" class="forget-pass">Quên mật khẩu?</a>
					</div>
					<div class="form-group text-center">
						<input type="submit" value="Đăng nhập">
					</div>
					<c:if test="${not empty error}">
						<script>
							alert("${error}");
						</script>
					</c:if>
				</form>
				<div class="option">
					Bạn chưa có tài khoản tại Cinema Ticket? <a
						href="${pageContext.request.contextPath}/signup.htm">Đăng kí
						ngay</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validateForm() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var usernameError = document.getElementById("username-error");
			var passwordError = document.getElementById("password-error");
			var valid = true;
			if (username === "") {
				usernameError.innerText = "Tên đăng nhập không được để trống.";
				usernameError.style.display = "block";
				valid = false;
			} else {
				usernameError.style.display = "none";
			}
			if (password === "") {
				passwordError.innerText = "Mật khẩu không được để trống.";
				passwordError.style.display = "block";
				valid = false;
			} else {
				passwordError.style.display = "none";
			}
			return valid;
		}
	</script>
</body>
</html>
