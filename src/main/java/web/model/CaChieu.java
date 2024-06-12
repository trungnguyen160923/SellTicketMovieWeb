package web.model;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="CACHIEU")
public class CaChieu {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MACACHIEU")
	private int maCaChieu;
	
	@ManyToOne
	@JoinColumn(name="maPhim")
    private Phim phim;
	
	@Column(name="TRANGTHAI")
    private String trangThai;
	
	@ManyToOne()
	@JoinColumn(name="maPhong")
    private Phong phong;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayChieu;
	
	@Column(name="GIOBATDAU")
    private String gioBatDau;
	
	@Column(name="GIOKETTHUC")
    private String gioKetThuc;
	
	@OneToMany(mappedBy = "caChieu", fetch = FetchType.EAGER)
	private Collection<HoaDon> hoaDons;

    public CaChieu() {
    }

    public CaChieu(int maCaChieu, String trangThai, Date ngayChieu, String gioBatDau, String gioKetThuc) {
        this.maCaChieu = maCaChieu;
        this.trangThai = trangThai;
        this.ngayChieu = ngayChieu;
        this.gioBatDau = gioBatDau;
        this.gioKetThuc = gioKetThuc;
    }

    public int getMaCaChieu() {
        return maCaChieu;
    }

    public void setMaCaChieu(int maCaChieu) {
        this.maCaChieu = maCaChieu;
    }

    public Phim getPhim() {
        return phim;
    }

    public void setPhim(Phim phim) {
        this.phim = phim;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public Phong getPhong() {
        return phong;
    }

    public void setPhong(Phong phong) {
        this.phong = phong;
    }

    public Date getNgayChieu() {
        return ngayChieu;
    }

    public void setNgayChieu(Date ngayChieu) {
        this.ngayChieu = ngayChieu;
    }

    public String getGioBatDau() {
        return gioBatDau;
    }

    public void setGioBatDau(String gioBatDau) {
        this.gioBatDau = gioBatDau;
    }

    public String getGioKetThuc() {
        return gioKetThuc;
    }

    public void setGioKetThuc(String gioKetThuc) {
        this.gioKetThuc = gioKetThuc;
    }
    
    public Collection<HoaDon> getHoaDons() {
        return this.hoaDons;
    }

    public void setHoaDons(Collection<HoaDon> hoaDons) {
        this.hoaDons = hoaDons;
    }
}
