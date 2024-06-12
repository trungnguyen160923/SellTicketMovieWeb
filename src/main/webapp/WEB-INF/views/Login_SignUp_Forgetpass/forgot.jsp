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
<title>Pengu Ticket</title>
<style>
body {
	background-image: url("./assets/images/account/login.jpg");
	background-size: cover;
	background-attachment: fixed;
	background-position: center;
	margin: 0;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center; /* Center horizontally */
	font-family: Arial, sans-serif;
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 10px;
	margin: auto;
	max-width: 400px;
	padding: 45px 40px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 40px;
}

h2 {
	color: #444444;
	font-size: 24px;
	margin: 0 0 20px 0;
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
	padding-top: 30px;
}

.footer {
	bottom: 0;
}
</style>
</head>
<body>
	<div>
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="login-form">
					<div class="main-div">
						<div class="panel">
							<h2>Pengu Ticket</h2>
						</div>
						<form:form class="account-form"
							action="${pageContext.request.contextPath}/check-forgot.htm"
							method="post" onsubmit="return validateForm()"
							modelAttribute="taikhoan">
							<div class="form-group">
								<label for="email">Email<span>*</span></label>
								<form:input type="email" placeholder="Nhập email của bạn"
									id="email" path="email" class="form-control" />
								<div id="email-error" class="error-message"
									style="color: red; display: none;">Email không được để
									trống và phải hợp lệ.</div>
							</div>
							<div class="form-group">
								<input type="submit" value="Lấy lại mật khẩu" class="btn">
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
						</form:form>
						<div class="option">
							Bạn đã có tài khoản PenguTicket? <a
								href="${pageContext.request.contextPath}/login.htm">Đăng
								nhập</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	<script>
		function validateForm() {
			var email = document.getElementById("email").value;
			var emailError = document.getElementById("email-error");
			var valid = true;

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
			return valid;
		}
	</script>
</body>
</html>
