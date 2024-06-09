package web.model;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="TAIKHOAN")
public class TaiKhoan {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MATAIKHOAN")
	private int maTaiKhoan;
	
	@Column(name="HOTEN")
    private String hoTen;
	
	@Column(name="SDT")
    private String sdt;
	
	@Column(name="EMAIL")
    private String email;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ngaySinh;
	
	@Column(name="DIACHI")
    private String diaChi;
	
	@Column(name="MATKHAU")
    private String matKhau;
	
	@Column(name="TRANGTHAI")
    private boolean trangThai;
	
	@ManyToOne
	@JoinColumn(name="maVaiTro")
    private VaiTro vaiTro;
	
	@Column(name="GIOITINH")
    private String gioiTinh;
	
	@Column(name="ANHDAIDIEN")
    private String anhDaiDien;
	
	@OneToMany(mappedBy = "taiKhoan", fetch = FetchType.EAGER)
	private Collection<HoaDon> hoaDons;

    public TaiKhoan() {
    }

    public TaiKhoan(int maTaiKhoan, String hoTen, String std, String email, Date ngaySinh, String diaChi, String matKhau, boolean trangThai, VaiTro vaiTro, String gioiTinh, String anhDaiDien) {
        this.maTaiKhoan = maTaiKhoan;
        this.hoTen = hoTen;
        this.sdt = std;
        this.email = email;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.matKhau = matKhau;
        this.trangThai = trangThai;
        this.vaiTro = vaiTro;
        this.gioiTinh = gioiTinh;
        this.anhDaiDien = anhDaiDien;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String std) {
        this.sdt = std;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }

    public VaiTro getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(VaiTro vaiTro) {
        this.vaiTro = vaiTro;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getAnhDaiDien() {
        return anhDaiDien;
    }

    public void setAnhDaiDien(String anhDaiDien) {
        this.anhDaiDien = anhDaiDien;
    }
    
    public Collection<HoaDon> getHoaDons() {
        return this.hoaDons;
    }

    public void setHoaDon(Collection<HoaDon> hoaDons) {
        this.hoaDons = hoaDons;
    }
}
