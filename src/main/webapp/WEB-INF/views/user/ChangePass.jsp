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
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap')
	;

@import url('${pageContext.request.contextPath}/assets/css/colors.css');

.AdminInfoContainer {
	background:
		url('${pageContext.request.contextPath}/assets/images/account/login.jpg')
		no-repeat center center/cover;
	font-family: 'Roboto', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.return.btn-primary {
	background-color: rgb(84, 180, 235);
	border: none;
	border-radius: 5px;
	font-size: 1.5rem;
	position: absolute;
	top: 20px;
	left: 20px;
}

.AdminInfo {
	max-width: 600px;
	width: 100%;
	padding: 30px;
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

.group {
	margin-bottom: 20px;
}

.group label {
	font-weight: 500;
	display: block;
	margin-bottom: 5px;
}

.group input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
	transition: border-color 0.3s ease;
}

.group input:focus {
	border-color: rgb(84, 180, 235);
	outline: none;
}

.error-message {
	color: red;
	font-size: 14px;
	margin-top: 5px;
}

.buttons-wrapper {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.buttons-wrapper input {
	background-color: rgb(84, 180, 235);
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1.5rem;
	font-weight: bold;
	transition: background-color 0.3s ease;
}

.buttons-wrapper input:hover {
	background-color: rgb(72, 160, 210);
}

.footer {
	bottom: 0;
}
</style>
<body>
	<div class="AdminInfoContainer">
		<button class="return btn btn-primary"
			onclick="window.location.href='${pageContext.request.contextPath}/user/infor.htm'">Quay
			lại</button>
		<div class="AdminInfo">
			<h2>Chỉnh Sửa Thông Tin Cá Nhân</h2>
			<form:form class="account-form"
				action="${pageContext.request.contextPath}/user/Change-pass.htm"
				method="post" modelAttribute="user" onsubmit="return validateForm()">
				<div class="group">
					<label for="oldPassword">Nhập lại mật khẩu cũ:<span>*</span></label>
					<input type="password" placeholder="Nhập mật khẩu của bạn"
						id="oldPassword" name="oldPassword" class="form-control" />
					<div id="oldPassword-error" class="error-message"></div>
				</div>
				<div class="group">
					<label for="newPassword">Nhập mật khẩu mới:<span>*</span></label> <input
						type="password" placeholder="Nhập mật khẩu của bạn"
						id="newPassword" name="newPassword" class="form-control" />
					<div id="newPassword-error" class="error-message"></div>
				</div>
				<div class="group">
					<label for="passwordConfirm">Xác nhận mật khẩu mới:<span>*</span></label>
					<input type="password" placeholder="Xác nhận lại mật khẩu của bạn"
						id="passwordConfirm" name="passwordConfirm" class="form-control" />
					<div id="passwordConfirm-error" class="error-message"></div>
				</div>
				<div class="buttons-wrapper">
					<input type="submit" value="Lưu thay đổi" class="btn btn-primary">
				</div>
				<c:if test="${not empty error}">
					<script>
						alert("${error}");
						<c:remove var="error" scope="session" />
					</script>
				</c:if>
				<c:if test="${not empty message}">
					<script>
						alert("${message}");
						<c:remove var="message" scope="session" />
					</script>
				</c:if>
			</form:form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	<script>
		function validateForm() {
			var oldPassword = document.getElementById("oldPassword").value;
			var oldPasswordError = document.getElementById("oldPassword-error");
			var newPassword = document.getElementById("newPassword").value;
			var newPasswordError = document.getElementById("newPassword-error");
			var passwordConfirm = document.getElementById("passwordConfirm").value;
			var passwordConfirmError = document
					.getElementById("passwordConfirm-error");
			var valid = true;

			if (newPassword !== passwordConfirm) {
				alert("Mật khẩu mới và xác nhận mật khẩu không khớp!");
				return false;
			}
			if (oldPassword === "") {
				oldPasswordError.innerText = "Mật khẩu không được để trống.";
				oldPasswordError.style.display = "block";
				valid = false;
			} 
		/* 	else if (oldPassword.length < 6) {
				oldPasswordError.innerText = "Mật khẩu phải chứa ít nhất 6 ký tự.";
				oldPasswordError.style.display = "block";
				valid = false;
			} else if (!(/[A-Z]/.test(oldPassword))) {
				oldPasswordError.innerText = "Mật khẩu phải chứa ít nhất một chữ hoa.";
				oldPasswordError.style.display = "block";
				valid = false;
			} else if (!(/[0-9]/.test(oldPassword))) {
				oldPasswordError.innerText = "Mật khẩu phải chứa ít nhất một chữ số.";
				oldPasswordError.style.display = "block";
				valid = false;
			} */
			else {
				oldPasswordError.style.display = "none";
			}
			if (newPassword === "") {
				newPasswordError.innerText = "Mật khẩu mới không được để trống.";
				newPasswordError.style.display = "block";
				valid = false;
			} else if (newPassword.length < 6) {
				newPasswordError.innerText = "Mật khẩu mới phải chứa ít nhất 6 ký tự.";
				newPasswordError.style.display = "block";
				valid = false;
			} else if (!(/[A-Z]/.test(newPassword))) {
				newPasswordError.innerText = "Mật khẩu mới phải chứa ít nhất một chữ hoa.";
				newPasswordError.style.display = "block";
				valid = false;
			} else if (!(/[0-9]/.test(newPassword))) {
				newPasswordError.innerText = "Mật khẩu mới phải chứa ít nhất một chữ số.";
				newPasswordError.style.display = "block";
				valid = false;
			} else {
				newPasswordError.style.display = "none";
			}

			if (passwordConfirm === "") {
				passwordConfirmError.innerText = "Mật khẩu xác nhận không được để trống.";
				passwordConfirmError.style.display = "block";
				valid = false;
			} else {
				passwordConfirmError.style.display = "none";
			}
			return valid;
		}
	</script>
</body>
</html>
