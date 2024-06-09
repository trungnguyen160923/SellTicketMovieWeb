package web.model;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="HOADON")
public class HoaDon {
	@Id
	@Column(name="MAHOADON")
	private int maHoaDon;
	
	@ManyToOne
	@JoinColumn(name="maTaiKhoan")
    private TaiKhoan taiKhoan;
	
	@Column(name="SOLUONG")
    private int soLuong;
	
	@Column(name="TONGGIA")
    private double tongGia;
	
	@Column(name="NGAYMUA")
    private Date ngayMua;
	
	@Column(name="TRANGTHAI")
    private boolean trangThai;
	
	@ManyToOne
	@JoinColumn(name="maGhe")
    private Ghe ghe;
	
	@ManyToOne
	@JoinColumn(name="maVe")
    private Ve ve;

    public HoaDon() {
    }

    public HoaDon(int maHoaDon, TaiKhoan taiKhoan, int soLuong, double tongGia, Date ngayMua, boolean trangThai) {
        this.maHoaDon = maHoaDon;
        this.taiKhoan = taiKhoan;
        this.soLuong = soLuong;
        this.tongGia = tongGia;
        this.ngayMua = ngayMua;
        this.trangThai = trangThai;
    }

    public int getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(int maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public int getSoLuong() {
        return soLuong;
    }
    

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
    public Ghe getGhe() {
        return ghe;
    }

    public void setGhe(Ghe ghe) {
        this.ghe = ghe;
    }

    public double getTongGia() {
        return tongGia;
    }

    public void setTongGia(double tongGia) {
        this.tongGia = tongGia;
    }

    public Date getNgayMua() {
        return ngayMua;
    }

    public void setNgayMua(Date ngayMua) {
        this.ngayMua = ngayMua;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }
    
    public Ve getVe() {
        return ve;
    }

    public void setVe(Ve ve) {
        this.ve = ve;
    }
    
    
}
