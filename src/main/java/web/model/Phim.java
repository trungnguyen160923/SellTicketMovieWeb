package web.model;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.datatype.jsr310.*;

@Entity
@Table(name="PHIM")
public class Phim {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MAPHIM")
	private int maPhim;
	
	@Column(name="TENPHIM")
    private String tenPhim;
	
	@Column(name="TRAILER")
    private String trailer;
	
	@Column(name="MOTA")
    private String moTa;
	
	@Column(name="THOILUONG")
    private String thoiLuong;
	
	@Column(name="LUOTXEM")
    private int luotXem;
	
	@Column(name="LUOTTHICH")
    private int luotThich;
	
	@Column(name="TRANGTHAI")
    private String trangThai;
	
	@Column(name="NGONNGU")
    private String ngonNgu;
	
	@Column(name="PHUDE")
    private String phuDe;
	
	@Column(name="GIOIHANTUOI")
    private int gioiHanTuoi;
	
	@Column(name="ANHBIA")
    private String anhBia;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayHieuLucTu;

	@Temporal(TemporalType.DATE)
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	@Column(name="NGAYHIEULUCDEN")
    private Date ngayHieuLucDen;
	
	@OneToMany(mappedBy = "phim", fetch = FetchType.EAGER)
	private Collection<CaChieu> caChieus;
	
	@OneToMany(mappedBy = "phim", fetch = FetchType.EAGER)
	private Collection<Phim_TheLoai> phim_TheLoais;
	
	@OneToMany(mappedBy = "phim", fetch = FetchType.EAGER)
	private Collection<ThamGia> thamGias;

    public Phim() {
    }

    public Phim(int maPhim, String tenPhim, String trailer, String moTa, String thoiLuong, int luotXem, int luotThich, String trangThai, String ngonNgu, String phuDe, int gioiHanTuoi, String anhBia, Date ngayHieuLucTu, Date ngayHieuLucDen) {
        this.maPhim = maPhim;
        this.tenPhim = tenPhim;
        this.trailer = trailer;
        this.moTa = moTa;
        this.thoiLuong = thoiLuong;
        this.luotXem = luotXem;
        this.luotThich = luotThich;
        this.trangThai = trangThai;
        this.ngonNgu = ngonNgu;
        this.phuDe = phuDe;
        this.gioiHanTuoi = gioiHanTuoi;
        this.anhBia = anhBia;
        this.ngayHieuLucTu = ngayHieuLucTu;
        this.ngayHieuLucDen = ngayHieuLucDen;
    }

    public int getMaPhim() {
        return maPhim;
    }

    public void setMaPhim(int maPhim) {
        this.maPhim = maPhim;
    }

    public String getTenPhim() {
        return tenPhim;
    }

    public void setTenPhim(String tenPhim) {
        this.tenPhim = tenPhim;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getThoiLuong() {
        return thoiLuong;
    }

    public void setThoiLuong(String thoiLuong) {
        this.thoiLuong = thoiLuong;
    }

    public int getLuotXem() {
        return luotXem;
    }

    public void setLuotXem(int luotXem) {
        this.luotXem = luotXem;
    }

    public int getLuotThich() {
        return luotThich;
    }

    public void setLuotThich(int luotThich) {
        this.luotThich = luotThich;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getNgonNgu() {
        return ngonNgu;
    }

    public void setNgonNgu(String ngonNgu) {
        this.ngonNgu = ngonNgu;
    }

    public String getPhuDe() {
        return phuDe;
    }

    public void setPhuDe(String phuDe) {
        this.phuDe = phuDe;
    }

    public int getGioiHanTuoi() {
        return gioiHanTuoi;
    }

    public void setGioiHanTuoi(int gioiHanTuoi) {
        this.gioiHanTuoi = gioiHanTuoi;
    }

    public String getAnhBia() {
        return anhBia;
    }

    public void setAnhBia(String anhBia) {
        this.anhBia = anhBia;
    }

    public Date getNgayHieuLucTu() {
        return ngayHieuLucTu;
    }

    public void setNgayHieuLucTu(Date ngayHieuLucTu) {
        this.ngayHieuLucTu = ngayHieuLucTu;
    }

    public Date getNgayHieuLucDen() {
        return ngayHieuLucDen;
    }

    public void setNgayHieuLucDen(Date ngayHieuLucDen) {
        this.ngayHieuLucDen = ngayHieuLucDen;
    }
    
    public Collection<Phim_TheLoai> getPhim_TheLoais(){
    	return this.phim_TheLoais;
    }
    
    public void setPhim_TheLoais(Collection<Phim_TheLoai >phim_TheLoais) {
    	this.phim_TheLoais = phim_TheLoais;
    }
    
    public Collection<ThamGia> getThamGias(){
    	return this.thamGias;
    }
    
    public void setThamGias(Collection<ThamGia >thamGias) {
    	this.thamGias = thamGias;
    }
    
    public Collection<CaChieu> getCaChieus(){
    	return this.caChieus;
    }
    
    public void setCaChieus(Collection<CaChieu>caChieus) {
    	this.caChieus = caChieus;
    }
}
