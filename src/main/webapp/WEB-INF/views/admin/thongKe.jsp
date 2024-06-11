<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin Thống Kê</title>
	<base href="${pageContext.servletContext.contextPath}/*">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/@adminkit/core@latest/dist/css/app.css">
    <style>
        body {
            background-color: #b1d1d9;
            width: 100%;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        .main {
            background-color: #ffffff; /* White background color */
            padding: 2rem;
            border-radius: 15px;
        }
        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }
    </style>
</head>
<body>
		<div class="container">
        <div class="row">
            <header class="navbar navbar-expand-lg navbar-light col" style="margin-bottom: 4.5rem;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"><img src="assets/images/logo/logo.png" alt="" class="mr-2">Pengu</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="admin/index.htm">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="admin/phong.htm">Phòng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="admin/caChieu.htm">Sắp Lịch</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="admin/thongKe.htm">Thống Kê</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <button class="btn btn-info" style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng Xuất</button>
            </header>
        </div>
        <div class="row m-4">
            <div class="col">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="revenue-tab" data-bs-toggle="tab" href="#revenue" role="tab" aria-controls="revenue" aria-selected="true">Phim và doanh thu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="views-tab" data-bs-toggle="tab" href="#views" role="tab" aria-controls="views" aria-selected="false">Lượt xem</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="likes-tab" data-bs-toggle="tab" href="#likes" role="tab" aria-controls="likes" aria-selected="false">Lượt thích</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="tab-content main" id="myTabContent">
            <div class="tab-pane fade show active" id="revenue" role="tabpanel" aria-labelledby="revenue-tab">
                <div class="row">
                    <div class="col-6">
                        <div class="row">
                            <div class="col-8">
                            	<h3>Doanh thu trong năm</h3>
                            </div>
                            <div class="col-4">
                                    <input type="month" id="selectedMonth" class="form-control" onchange="updateChartData(this.value)">
                                </div>
                        </div>
                        <div class="card chart-container">
                            <canvas id="chartjs-line"></canvas>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="row">
                                <div class="col-8">
                                    <h3>Top 3 phim doanh thu cao nhất</h3>
                                </div>
                                <div class="col-4">
                                    <input type="month" id="selectedMonth" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card chart-container">
                                <canvas id="chartjs-pie"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="views" role="tabpanel" aria-labelledby="views-tab">
                <div class="row">
                    <div class="col-6">
                        <div class="row">
                            <h3>Lượt xem trong năm</h3>
                        </div>
                        <div class="card chart-container">
                            <canvas id="chartjs-views"></canvas>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-8">
                                <h3>Top 3 phim xem nhiều nhất</h3>
                            </div>
                            <div class="col-4">
                                <input type="month" id="selectedMonth" class="form-control">
                            </div>
                        </div>
                        <div class="card chart-container">
                            <canvas id="chartjs-top-views"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="likes" role="tabpanel" aria-labelledby="likes-tab">
                <div class="row">
                    <div class="col-6">
                        <div class="row">
                            <h3>Lượt thích trong năm</h3>
                        </div>
                        <div class="card chart-container">
                            <canvas id="chartjs-likes"></canvas>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-8">
                                <h3>Top 3 phim thích nhiều nhất</h3>
                            </div>
                            <div class="col-4">
                                <input type="month" id="selectedMonth" class="form-control">
                            </div>
                        </div>
                        <div class="card chart-container">
                            <canvas id="chartjs-top-likes"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	        <!--footer  -->
        <jsp:include page="/WEB-INF/views/footer.jsp" />
        <!--End Footer  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    //Chuyển định dạng dữ liệu
    document.addEventListener('DOMContentLoaded', function() {
    });
    	var hoaDons = [
			<c:forEach items="${hoaDons}" var="cc" varStatus="loop">
			{
				"maHoaDon": ${cc.maHoaDon},
				"tongGia" : ${cc.tongGia},
				"ngayMua" : "${cc.ngayMua}",
				"trangThai": "${cc.trangThai}"
/* 				"maVe": ${cc.ve.maVe},
				"maGhe":${cc.ghe.maGhe} */
			}<c:if test="${!loop.last}">,</c:if>
			</c:forEach>
		];
	    
    // End Chuyển định dạng dữ liệu
    // Hàm tính tiền theo tháng và năm
    	function groupByMonthAndYear(hoaDons, yearChoice) {
            const salesByMonthAndYear = {};
            hoaDons.forEach(hoaDon => {
            	
                const date = new Date(hoaDon.ngayMua);
                const month = date.getMonth(); // Get the month (0-11)
                const year = date.getFullYear(); // Get the year
                const key = month+1; // Create a key like '2024-6'

                if(yearChoice == year){
                	if (!salesByMonthAndYear[key]) {
                        salesByMonthAndYear[key] = 0;
                    }
                    salesByMonthAndYear[key] += hoaDon.tongGia;
                } // Summing up the total sales
            });

            return salesByMonthAndYear;
        }
    // End hàm tính tiền theo tháng và năm
    // Dữ liệu đổ vào line chart
    const currentYear = new Date().getFullYear();
    const salesData = groupByMonthAndYear(hoaDons,currentYear);
    const allMonths = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    
    const labels = [];
    const data_price = [];
    for (let i = 0; i < 12; i++) {
        const key = i+1;
        labels.push(allMonths[i]);
        data_price.push(salesData[key] || 0); // If there is no data for a month, use 0
    }
    const dataPrice = {
            labels: labels,
            datasets: [{
                label: `Sales in ${currentYear} ($)`,
                fill: true,
                backgroundColor: "transparent",
                borderColor: "blue",
                data: data_price
            }]
        };
    // Line Chart
        function createLineChart(elementId, data) {
            return new Chart(document.getElementById(elementId), {
                type: "line",
                data: data,
                options: {
                    scales: {
                        x: {
                            grid: {
                                color: "rgba(0,0,0,0.05)"
                            }
                        },
                        y: {
                            grid: {
                                color: "rgba(0,0,0,0)"
                            }
                        }
                    }
                }
            });
        }
    // Hàm update khi chọn năm
    function updateChartData(selectedYear) {
    // Tách năm từ selectedYear
	    const year = selectedYear.split("-")[0]; // Nếu "selectedYear" có dạng "YYYY-MM"
	    // hoặc
	    // const year = selectedYear.substring(0, 4); // Nếu "selectedYear" có dạng "YYYY-MM"
	
	    // Cập nhật dữ liệu dựa trên năm đã tách
	    const salesData = groupByMonthAndYear(hoaDons, parseInt(year));
	    const data = [];
	    for (let i = 0; i < 12; i++) {
	        const key = i + 1;
	        data.push(salesData[key] || 0);
	    }
	    lineChart.data.datasets[0].data = data;
	    lineChart.update();
	}
    // Hàm khởi tạo
    let lineChart = createLineChart("chartjs-line", dataPrice);
    // End Line Chart Price

        function createPieChart(elementId, data) {
            return new Chart(document.getElementById(elementId), {
                type: "pie",
                data: data,
                options: {
                    maintainAspectRatio: false,
                    cutout: "0%"
                }
            });
        }

        function createBarChart(elementId, data) {
            return new Chart(document.getElementById(elementId), {
                type: "bar",
                data: data,
                options: {
                    scales: {
                        x: {
                            grid: {
                                color: "rgba(0,0,0,0.05)"
                            }
                        },
                        y: {
                            grid: {
                                color: "rgba(0,0,0,0)"
                            }
                        }
                    }
                }
            });
        }

        

        const revenueData = {
            labels: ["Movie A", "Movie B", "Movie C"],
            datasets: [{
                data: [260, 125, 54],
                backgroundColor: ["#007bff", "#28a745", "#ffc107"],
                borderColor: "transparent"
            }]
        };

        const viewsData = {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [{
                label: "Views",
                fill: true,
                backgroundColor: "rgba(0,123,255,0.5)",
                borderColor: "#007bff",
                data: [1015, 1162, 1184, 1392, 1487, 1723, 1966, 2248, 2405, 2838, 2617, 2927]
            }]
        };

        const topViewsData = {
            labels: ["Movie D", "Movie E", "Movie F"],
            datasets: [{
                data: [300, 200, 100],
                backgroundColor: ["#007bff", "#28a745", "#ffc107"],
                borderColor: "transparent"
            }]
        };

        const likesData = {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [{
                label: "Likes",
                fill: true,
                backgroundColor: "rgba(40,167,69,0.5)",
                borderColor: "#28a745",
                data: [715, 862, 984, 1092, 1287, 1523, 1766, 2048, 2305, 2638, 2417, 2727]
            }]
        };

        const topLikesData = {
            labels: ["Movie G", "Movie H", "Movie I"],
            datasets: [{
                data: [280, 180, 80],
                backgroundColor: ["#007bff", "#28a745", "#ffc107"],
                borderColor: "transparent"
            }]
        };

        
        let pieChart = createPieChart("chartjs-pie", revenueData);
        let viewsChart, topViewsChart, likesChart, topLikesChart;

        document.getElementById('views-tab').addEventListener('click', function () {
            if (!viewsChart) {
                viewsChart = createLineChart("chartjs-views", viewsData);
            }
            if (!topViewsChart) {
                topViewsChart = createPieChart("chartjs-top-views", topViewsData);
            }
        });

        document.getElementById('likes-tab').addEventListener('click', function () {
            if (!likesChart) {
                likesChart = createLineChart("chartjs-likes", likesData);
            }
            if (!topLikesChart) {
                topLikesChart = createPieChart("chartjs-top-likes", topLikesData);
            }
        });
        // End Chart
       
        // Đẩy dữ liệu vào Chart doanh thu
       	
        // End Đẩy dữ liệu và Chart doanh thu
    </script>
</body>
</html>