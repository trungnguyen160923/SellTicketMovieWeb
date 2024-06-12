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
body {
	background-image: url("./assets/images/account/login.jpg");
	background-size: cover;
	background-attachment: fixed;
	background-position: center;
	margin: 0;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-family: Arial, sans-serif;
}

.form-heading {
	color: #fff;
	font-size: 23px;
	margin-bottom: 10px;
}

h2 {
	color: #444444;
	font-size: 24px;
	margin: 0 0 20px 0;
	text-align: center;
}

p {
	color: #777777;
	font-size: 16px;
	margin-bottom: 30px;
	line-height: 24px;
	text-align: center;
}

.login-form .form-control {
	background: #f7f7f7 none repeat scroll 0 0;
	border: 1px solid #d4d4d4;
	border-radius: 4px;
	font-size: 16px;
	height: 50px;
	line-height: 50px;
	margin-bottom: 20px;
	padding: 0 15px;
	width: 100%;
	box-sizing: border-box;
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 10px;
	margin: 0px auto 50px;
	max-width: 400px;
	padding: 40px 40px;
	padding-top: 25px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.forget-pass {
	color: #007bff;
	font-size: 1rem;
	text-decoration: underline;
	display: inline-block;
	margin-bottom: 20px;
}

.forget-pass:hover {
	color: #0056b3;
}

.botto-text {
	color: #ffffff;
	font-size: 14px;
	margin: auto;
}

.login-form .btn {
	background: #f0ad4e;
	border: none;
	color: #ffffff;
	font-size: 16px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0;
	border-radius: 4px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.login-form .btn:hover {
	background: #ec971f;
}

.option {
	padding-top: 20px;
	font-size: 1rem;
}

.footer {
	bottom: 0;
}
</style>
<title>Pengu Ticket</title>
<base href="${pageContext.servletContext.contextPath}/*">
</head>
<body id="login-form">
	<div class="login-form">
		<div class="main-div">
			<div class="panel">
				<h2>Pengu Ticket</h2>
			</div>
			<form class="account-form"
				action="${pageContext.request.contextPath}/check-login.htm"
				method="post" onsubmit="return validateForm()">
				<div class="form-group">
					<label for="username">Tên Đăng Nhập<span>*</span></label> <input
						type="text" placeholder="Nhập tên đăng nhập của bạn" id="username"
						name="email" value="${taikhoan.email}" class="form-control">
					<div id="username-error" class="error-message"
						style="color: red; display: none;"></div>
				</div>
				<div class="form-group">
					<label for="password">Mật Khẩu<span>*</span></label> <input
						type="password" placeholder="Nhập mật khẩu của bạn" id="password"
						name="matKhau" value="${taikhoan.matKhau}" class="form-control">
					<div id="password-error" class="error-message"
						style="color: red; display: none;"></div>
				</div>
				<div class="form-group">
					<a href="forgot.htm" class="forget-pass">Quên mật khẩu?</a>
				</div>
				<div class="form-group">
					<input type="submit" value="Đăng nhập" class="btn">
				</div>
				<c:if test="${not empty error}">
					<script>
						alert("${error}");
					</script>
				</c:if>
				<c:if test="${not empty message}">
					<script>
						alert("${message}");
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
	<jsp:include page="/WEB-INF/views/footer.jsp" />
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
