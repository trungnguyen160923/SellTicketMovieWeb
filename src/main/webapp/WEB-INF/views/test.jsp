<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
	<h1>Hello world</h1>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã ghế</th>
				<th>Mã Loại Ghế</th>
				<th>Hàng</th>
				<th>Cột</th>
				<th>Trạng Thái</th>
				<th>Mã Phòng</th>
			</tr>
			<c:forEach var="g" items="${ghes}">
				<tr>
					<td>${g.maGhe}</td>
					<td>${g.loaiGhe.maLoaiGhe}</td>
					<td>${g.hang}</td>
					<td>${g.cot}</td>
					<td>${trangThai}</td>
					<td>${g.phong.tenPhong}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã Loại Ghế</th>
				<th>Tên loại ghế</th>
				<th>Trạng Thái</th>
			</tr>
			<c:forEach var="g" items="${loaiGhes}">
				<tr>
					<td>${g.maLoaiGhe}</td>
					<td>${g.tenLoaiGhe}</td>
					<td>${g.trangThai}</td>					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã phòng</th>
				<th>Tên Phòng</th>
				<th>Mã Rạp</th>
				<th>Mã Loại Phòng</th>
				<th>Tình Trạng</th>				
			</tr>
			<c:forEach var="g" items="${phongs}">
				<tr>
					<td>${g.maPhong}</td>
					<td>${g.tenPhong}</td>
					<td>${g.rap.maRap}</td>
					<td>${g.loaiPhong.maLoaiPhong}</td>
					<td>${g.tinhTrang}</td>					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã Loai Phong</th>
				<th>Tên Loại Phòng</th>				
				<th>Trạng Thái</th>				
			</tr>
			<c:forEach var="g" items="${loaiPhongs}">
				<tr>
					<td>${g.maLoaiPhong}</td>
					<td>${g.tenLoaiPhong}</td>					
					<td>${g.trangThai}</td>					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã Rạp</th>
				<th>Tên Rạp</th>				
				<th>Trạng Thái</th>				
			</tr>
			<c:forEach var="g" items="${raps}">
				<tr>
					<td>${g.maRap}</td>
					<td>${g.tenRap}</td>					
					<td>${g.trangThai}</td>					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã Ca Chiếu</th>
				<th>Mã Phim</th>				
				<th>Trạng Thái</th>
				<th>Mã Phòng</th>
				<th>Ngày Chiếu</th>
				<th>Giờ bắt đầu</th>
				<th>Giờ kết thúc</th>				
			</tr>
			<c:forEach var="g" items="${caChieus}">
				<tr>
					<td>${g.maCaChieu}</td>
					<td>${g.phim.maPhim}</td>					
					<td>${g.trangThai}</td>
					<td>${g.phong.maPhong}</td>
					<td>${g.ngayChieu}</td>
					<td>${g.gioBatDau}</td>
					<td>${g.gioKetThuc}</td>					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã Phim</th>
				<th>Tên Phim</th>				
				<th>Trailer</th>
				<th>Mô tả</th>
				<th>Thời lượng</th>
				<th>Lượt xem</th>
				<th>Lượt thích</th>
				<th>Trạng thái</th>
				<th>Ngôn ngữ</th>
				<th>Phụ để</th>
				<th>Giới hạn tuổi</th>
				<th>Ảnh bìa</th>
				<th>Hiệu lực từ</th>
				<th>Hiệu lực đến</th>				
			</tr>
			<c:forEach var="g" items="${phims}">
				<tr>
					<td>${g.maPhim}</td>
					<td>${g.tenPhim}</td>					
					<td>${g.trailer}</td>
					<td>${g.moTa}</td>
					<td>${g.thoiLuong}</td>
					<td>${g.luotXem}</td>
					<td>${g.luotThich}</td>
					<td>${g.trangThai}</td>
					<td>${g.ngonNgu}</td>
					<td>${g.phuDe}</td>
					<td>${g.gioiHanTuoi}</td>
					<td>${g.anhBia}</td>
					<td>${g.ngayHieuLucTu}</td>
					<td>${g.ngayHieuLucDen}</td>					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>
				<th>Mã Phim</th>				
				<th>Mã Thể Loại</th>			
			</tr>
			<c:forEach var="g" items="${phim_TheLoais}">
				<tr>
					<td>${g.phim.tenPhim}</td>
					<td>${g.theLoaiPhim.tenTheLoai}</td>					
					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>							
				<th>Mã Thể Loại</th>
				<th>Tên Thể Loại</th>
				<th>Trạng Thái</th>			
			</tr>
			<c:forEach var="g" items="${TheLoaiPhims}">
				<tr>
					<td>${g.maTheLoai}</td>
					<td>${g.tenTheLoai}</td>
					<td>${g.trangThai}</td>					
					
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>							
				<th>Mã Phim</th>
				<th>Mã Đoàn Phim</th>							
			</tr>
			<c:forEach var="g" items="${thamGias}">
				<tr>
					<td>${g.phim.tenPhim}</td>
					<td>${g.doanPhim.hoTen}</td>														
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>							
				<th>Mã Đoàn Phim</th>
				<th>Họ Tên</th>
				<th>Ngày Sinh</th>
				<th>Quê Quán</th>
				<th>Miêu Tả</th>
				<th>Mã Vai Trò</th>
				<th>Vai Trò</th>							
			</tr>
			<c:forEach var="g" items="${doanPhims}">
				<tr>
					<td>${g.maDP}</td>
					<td>${g.hoTen}</td>
					<td>${g.ngaySinh}</td>
					<td>${g.queQuan}</td>
					<td>${g.mieuTa}</td>
					<td>${g.vaiTro.maVaiTro}</td>
					<td>${g.vaiTro.tenVaiTro}</td>														
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>							
				<th>Mã Vai Trò</th>
				<th>Vai Trò</th>							
			</tr>
			<c:forEach var="g" items="${vaiTros}">
				<tr>
					<td>${g.maVaiTro}</td>
					<td>${g.tenVaiTro}</td>														
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>							
				<th>Mã Tài Khoản</th>
				<th>Họ Tên</th>
				<th>SDT</th>
				<th>Ngày Sinh</th>
				<th>Địa Chỉ</th>
				<th>Mật khẩu</th>
				<th>Trạng thái</th>
				<th>Giới tính</th>
				<th>Ảnh đại diện</th>
				<th>Mã Vai Trò</th>
				<th>Vai Trò</th>							
			</tr>
			<c:forEach var="g" items="${taiKhoans}">
				<tr>
					<td>${g.maTaiKhoan}</td>
					<td>${g.hoTen}</td>
					<td>${g.sdt}</td>
					<td>${g.ngaySinh}</td>
					<td>${g.diaChi}</td>
					<td>${g.matKhau}</td>
					<td>${g.trangThai}</td>
					<td>${g.gioiTinh}</td>
					<td>${g.anhDaiDien}</td>
					<td>${g.vaiTro.maVaiTro}</td>
					<td>${g.vaiTro.tenVaiTro}</td>														
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>							
				<th>Mã Hoá Đơn</th>
				<th>Mã tài khoản</th>
				<th>Tên người dùng</th>
				<th>Số Lượng</th>
				<th>Tổng giá</th>
				<th>Ngày mua</th>
				<th>Trạng thái</th>							
			</tr>
			<c:forEach var="g" items="${hoaDons}">
				<tr>
					<td>${g.maHoaDon}</td>
					<td>${g.taiKhoan.maTaiKhoan}</td>
					<td>${g.taiKhoan.hoTen}</td>
					<td>${g.soLuong}</td>
					<td>${g.tongGia}</td>
					<td>${g.ngayMua}</td>
					<td>${g.trangThai}</td>																		
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table class ="table table-hover">
			<tr>							
				<th>Mã Vé</th>
				<th>Mã Ca Chiếu</th>
				<th>Tên Phim</th>
				<th>Mã Ghế</th>
				<th>Giá Vé</th>
				<th>Mã Hóa Đơn</th>
				<th>Tên người mua</th>							
			</tr>
			<c:forEach var="g" items="${ves}">
				<tr>
					<td>${g.maVe}</td>
					<td>${g.caChieu.maCaChieu}</td>
					<td>${g.caChieu.phim.tenPhim}</td>
					<td>${g.ghe.maGhe}</td>
					<td>${g.giaVe}</td>
					<td>${g.hoaDon.maHoaDon}</td>
					<td>${g.hoaDon.taiKhoan.hoTen}</td>																		
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>