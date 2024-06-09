<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PenguTicket</title>
    <base href="${pageContext.servletContext.contextPath}/*">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .account-section {
            background: url('./views/Login_SignUp_Forgetpass/account-bg.jpg') no-repeat center center/cover;
            padding: 30px 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .account-area {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .section-header-3 .title {
            font-size: 32px;
            color: #333;
             text-align: center;
        }
        .account-form .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        .account-form label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        .account-form input,
        .account-form select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .account-form .btn-primary {
            background-color: #ff6f61;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .account-form .btn-primary:hover {
            background-color: #ff3b2f;
        }
        .form-group.text-center {
            margin-top: 30px;
        }
        .option {
            text-align: center;
            margin-top: 20px;
        }
        .option a {
            color: #ff6f61;
            text-decoration: none;
        }
        .option a:hover {
            text-decoration: underline;
        }
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
    </style>
</head>

<body>
    <section class="account-section bg_img" data-background="./assets/images/account/account-bg.jpg">
        <div class="container">
            <div class="padding-top padding-bottom">
                <div class="account-area">
                    <div class="section-header-3">
                        <h2 class="title">SellingTicket</h2>
                    </div>
                    <form:form class="account-form" action="${pageContext.request.contextPath}/check-signup.htm" method="post" onsubmit="return validateForm()" modelAttribute="taikhoan">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="fullname">Tên đầy đủ<span>*</span></label>
                                    <form:input type="text" placeholder="Nhập họ và tên của bạn" id="fullname" path="hoTen" class="form-control"/>
                                    <div id="fullname-error" class="error-message"></div>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ<span>*</span></label>
                                    <form:input type="text" placeholder="Nhập địa chỉ của bạn" id="address" path="diaChi" class="form-control"/>
                                    <div id="address-error" class="error-message"></div>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Điện thoại<span>*</span></label>
                                    <form:input type="text" placeholder="Nhập số điện thoại của bạn" id="phone" path="sdt" class="form-control"/>
                                    <div id="phone-error" class="error-message"></div>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email<span>*</span></label>
                                    <form:input type="email" placeholder="Nhập email của bạn" id="email" path="email" class="form-control"/>
                                    <div id="email-error" class="error-message"></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="birthdate">Ngày sinh<span>*</span></label>
                                    <form:input type="date" placeholder="Nhập theo định dạng DD/MM/YYYY" id="birthdate" path="ngaySinh" class="form-control"/>
                                    <div id="birthdate-error" class="error-message"></div>
                                </div>
                                <div class="form-group">
                                    <label for="gender">Giới tính<span>*</span></label>
                                    <form:select id="gender" path="gioiTinh" class="form-control">
                                        <form:option value="Nam">Nam</form:option>
                                        <form:option value="Nữ">Nữ</form:option>
                                    </form:select>
                                    <div id="gender-error" class="error-message"></div>
                                </div>
                                <div class="form-group">
                                    <label for="password">Mật khẩu<span>*</span></label>
                                    <form:input type="password" placeholder="Nhập mật khẩu của bạn" id="password" path="matKhau" class="form-control"/>
                                    <i class="gg-eye toggle-password" onclick="togglePassword('password')"></i>
                                    <div id="password-error" class="error-message"></div>
                                </div>
                                <div class="form-group">
                                    <label for="passwordConfirm">Xác nhận mật khẩu<span>*</span></label>
                                    <input type="password" placeholder="Xác nhận lại mật khẩu của bạn" id="passwordConfirm" name="passwordConfirm" class="form-control"/>
                                    <i class="gg-eye toggle-password" onclick="togglePassword('passwordConfirm')"></i>
                                    <div id="passwordConfirm-error" class="error-message"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" value="Đăng ký" class="btn btn-primary">
                        </div>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        <c:if test="${not empty message}">
                            <div class="alert alert-success">${message}</div>
                        </c:if>
                    </form:form>
                    <div class="option">
                        Bạn đã có tài khoản PenguTicket? <a href="${pageContext.request.contextPath}/login.htm">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        function validateForm() {
            var fullname = document.getElementById("fullname").value;
            var address = document.getElementById("address").value;
            var phone = document.getElementById("phone").value;
            var email = document.getElementById("email").value;
            var birthdate = document.getElementById("birthdate").value;
            var gender = document.getElementById("gender").value;
            var password = document.getElementById("password").value;
            var passwordConfirm = document.getElementById("passwordConfirm").value;
            var fullnameError = document.getElementById("fullname-error");
            var addressError = document.getElementById("address-error");
            var phoneError = document.getElementById("phone-error");
            var emailError = document.getElementById("email-error");
            var birthdateError = document.getElementById("birthdate-error");
            var genderError = document.getElementById("gender-error");
            var passwordError = document.getElementById("password-error");
            var passwordConfirmError = document.getElementById("passwordConfirm-error");
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

            if (passwordConfirm === "") {
                passwordConfirmError.innerText = "Xác nhận mật khẩu không được để trống.";
                passwordConfirmError.style.display = "block";
                valid = false;
            } else if (password !== passwordConfirm) {
                passwordConfirmError.innerText = "Mật khẩu và xác nhận mật khẩu không khớp.";
                passwordConfirmError.style.display = "block";
                valid = false;
            } else {
                passwordConfirmError.style.display = "none";
            }
            return valid;
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
