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
    <title>Chỉnh Sửa Thông Tin Cá Nhân</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
        @import url('${pageContext.request.contextPath}/assets/css/colors.css');

        .AdminInfoContainer {
            background: url('${pageContext.request.contextPath}/assets/images/account/login.jpg') no-repeat center center/cover;
            font-family: 'Roboto', sans-serif;
            align-items: center;
            height: 100vh;
        }

        .return.btn-primary {
            background-color: rgb(84, 180, 235);
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            margin-left: 20px;
            font-size: 1.5rem;
        }

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

        .error-message {
            color: red;
            display: none;
            font-size: 14px;
            margin-top: 5px;
        }

        .text-label {
            font-weight: normal;
            flex: 1;
        }

        .text-value {
            font-weight: bold;
            flex: 2;
        }

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

        .row1 {
            display: flex;
        }

        .footer {
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="AdminInfoContainer">
        <button class="return btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/user/infor.htm'">Quay lại</button>
        <div class="AdminInfo">
            <h2>Chỉnh Sửa Thông Tin Cá Nhân</h2>
            <form:form class="account-form" action="${pageContext.request.contextPath}/update-in4.htm" method="post" modelAttribute="user" onsubmit="return validateForm()">
                <div class="form-group row1">
                    <div class="col-md-6 group">
                        <label for="fullname">Tên đầy đủ<span>*</span></label>
                        <form:input type="text" placeholder="Nhập họ và tên của bạn" id="fullname" path="hoTen" class="form-control" />
                        <div id="fullname-error" class="error-message"></div>
                    </div>
                    <div class="col-md-6 group">
                        <label for="address">Địa chỉ<span>*</span></label>
                        <form:input type="text" placeholder="Nhập địa chỉ của bạn" id="address" path="diaChi" class="form-control" />
                        <div id="address-error" class="error-message"></div>
                    </div>
                </div>
                <div class="form-group row1">
                    <div class="col-md-6 group">
                        <label for="email">Email<span>*</span></label>
                        <form:input type="email" placeholder="Nhập email của bạn" id="email" path="email" class="form-control" />
                        <div id="email-error" class="error-message"></div>
                    </div>
                    <div class="col-md-6 group">
                        <label for="phone">Điện thoại<span>*</span></label>
                        <form:input type="text" placeholder="Nhập số điện thoại của bạn" id="phone" path="sdt" class="form-control" />
                        <div id="phone-error" class="error-message"></div>
                    </div>
                </div>
                <div class="form-group row1">
                    <div class="col-md-6 group">
                        <label for="birthdate">Ngày sinh<span>*</span></label>
                        <form:input type="date" placeholder="Nhập theo định dạng DD/MM/YYYY" id="birthdate" path="ngaySinh" class="form-control" />
                        <div id="birthdate-error" class="error-message"></div>
                    </div>
                    <div class="col-md-6 group">
                        <label for="gender">Giới tính<span>*</span></label>
                        <form:select id="gender" path="gioiTinh" class="form-control">
                            <form:option value="Nam">Nam</form:option>
                            <form:option value="Nữ">Nữ</form:option>
                        </form:select>
                        <div id="gender-error" class="error-message"></div>
                    </div>
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
            var fullname = document.getElementById("fullname").value;
            var fullnameError = document.getElementById("fullname-error");
            var address = document.getElementById("address").value;
            var addressError = document.getElementById("address-error");
            var phone = document.getElementById("phone").value;
            var email = document.getElementById("email").value;
            var birthdate = document.getElementById("birthdate").value;
            var phoneError = document.getElementById("phone-error");
            var emailError = document.getElementById("email-error");
            var birthdateError = document.getElementById("birthdate-error");
            var valid = true;

            if (fullname.trim() === "") {
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

            if (address.trim() === "") {
                addressError.innerText = "Địa chỉ không được để trống.";
                addressError.style.display = "block";
                valid = false;
            } else {
                addressError.style.display = "none";
            }

            if (phone.trim() === "") {
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

            if (email.trim() === "") {
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

            if (birthdate.trim() === "") {
                birthdateError.innerText = "Ngày sinh không được để trống.";
                birthdateError.style.display = "block";
                valid = false;
            } else {
                birthdateError.style.display = "none";
            }

            return valid;
        }
    </script>
</body>
</html>
