<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/sweetalert2.min.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/odometer.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/jquery.animatedheadline.css">
    <link rel="stylesheet" href="css/main.css">

    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">

    <title>PenguTicket</title>
</head>
<body>
	<div class="overlay"></div>
    <a href="index-2.html#0" class="scrollToTop">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- ==========Overlay========== -->

    <!-- ==========Header-Section========== -->
    <header class="header-section">
        <div class="container">
            <div class="header-wrapper">
                <div class="logo">
                    <a href="/">
                        <img src="images/logo/logo.png" alt="logo">
                    </a>
                </div>
                <ul class="menu">
                    <li>
                        <a href="/">Trang chủ</a>
                    </li>
                    <li class="header-button pr-0" id="login-btn">
                        <a href="/login">Đăng nhập</a>
                    </li>
                </ul>
                <div class="header-bar d-lg-none">
					<span></span>
					<span></span>
					<span></span>
				</div>
            </div>
        </div>
    </header>
    <!-- ==========Header-Section========== -->

    <!-- ==========Banner-Section========== -->
    <section class="banner-section">
        <div class="banner-bg bg_img bg-fixed" data-background="images/banner/banner01.jpg"></div>
        <div class="container">
            <div class="banner-content">
                <h1 class="title  cd-headline clip"><span class="d-block">Rạp chiếu phim</span> Pengu
                    <span class="color-theme cd-words-wrapper p-0 m-0">
                        <b class="is-visible">ScreenX</b>
                        <b>IMax</b>
                        <b>3D/4D</b>
                    </span>
                </h1>
                <p>Rạp chiếu phim  phục vụ khán giả với những thước phim điện ảnh chất lượng, dịch vụ tốt nhất với giá vé hợp lý.</p>
            </div>
        </div>
    </section>
    <!-- ==========Banner-Section========== -->

    <!-- ==========Ticket-Search========== -->
    <section class="search-ticket-section padding-top pt-lg-0">
        <div class="container">
            <div class="search-tab bg_img" data-background="images/ticket/ticket-bg01.jpg">
                <div class="row align-items-center mb--20">
                    <div class="col-lg-6 mb-20">
                        <div class="search-ticket-header">
                            <h6 class="category">Chào mừng PenguTicket </h6>
                            <h3 class="title">Bạn đang tìm kiếm phim gì ?</h3>
                        </div>
                    </div>
                </div>
                <div class="tab-area">
                    <div class="tab-item active">
                        <form class="ticket-search-form">
                            <div class="form-group large" style="width:100%">
                                <input id="moive-name" type="text" placeholder="Tên phim tìm kiếm">
                                <button type="submit"><i class="fas fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>    
    <!-- ==========Ticket-Search========== -->

    <!-- ==========Movie-Section========== -->
    <section class="movie-section padding-top padding-bottom">
        <div class="container">
            <div class="tab">
                <div class="section-header-2">
                    <div class="left">
                        <h2 class="title">Phim</h2>
                        <p>Đừng bỏ lỡ những bộ phim hay trong hôm nay.</p>
                    </div>
                </div>
                <div class="tab-area mb-30-none">
                    <div class="tab-item active">
                        <div class="owl-carousel owl-theme tab-slider" id="list-movies">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ==========Movie-Section========== -->

    <!-- ==========Newslater-Section========== -->
    <footer class="footer-section"></footer>
    <!-- ==========Newslater-Section========== -->
	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery.cookie.min.js"></script>
    <script src="js/sweetalert2.min.js"></script>
    <script src="js/modernizr-3.6.0.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/heandline.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/magnific-popup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/countdown.min.js"></script>
    <script src="js/odometer.min.js"></script>
    <script src="js/viewport.jquery.js"></script>
    <script src="js/nice-select.js"></script>
    <script src="js/js.cookie.min.js"></script>
    <!-- <script src="js/requestAPI.js"></script> -->
    <script src="js/main.js"></script>
    <script src="js/index.js"></script>
    <script src="js/test.js"></script>
    <script >
    const scriptPath = document.currentScript.src;
    alert("The current script path is: " + scriptPath);
    </script>
</body>
</html>