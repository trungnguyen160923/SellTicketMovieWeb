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
<title>PenguTicket</title>
</head>

<body>
	<section data-background="./assets/images/account/account-bg.jpg">
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="account-area">
					<div class="section-header-3">
						<span class="cate">Chào mừng trở lại</span>
						<h2 class="title">Cinema Ticket</h2>
					</div>
					<form:form class="account-form"
						action="${pageContext.request.contextPath}/check-forgot.htm"
						method="post" onsubmit="return validateForm()"
						modelAttribute="taikhoan">
						<div class="form-group">
							<label for="email">Email<span>*</span></label>
							<form:input type="email" placeholder="Nhập email của bạn"
								id="email" path="email" class="form-control" />
							<div id="email-error" class="error-message">Email không
								được để trống và phải hợp lệ.</div>
						</div>
						<div class="form-group text-center">
							<input type="submit" value="Lấy lại mật khẩu"
								class="btn btn-primary" />
						</div>
						<c:if test="${not empty error}">
							<div class="alert alert-danger">${error}</div>
						</c:if>
						<c:if test="${not empty message}">
							<div class="alert alert-success">${message}</div>
						</c:if>
					</form:form>
					<div class="option">
						Bạn đã có tài khoản PenguTicket? <a
							href="${pageContext.request.contextPath}/login.htm">Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</section>

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
