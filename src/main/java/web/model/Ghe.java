package web.model;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "GHE")
public class Ghe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MAGHE")
	private int maGhe;
	
	@ManyToOne
	@JoinColumn(name="maLoaiGhe")
	private LoaiGhe loaiGhe;
	
	@Column(name="HANG")
	private String hang;
	
	@Column(name="COT")
	private String cot;
	
	@Column(name="TRANGTHAI")
	private int trangThai;
	
	@ManyToOne
	@JoinColumn(name="maPhong")
	private Phong phong;
	
	@OneToMany(mappedBy = "ghe", fetch = FetchType.EAGER)
	private Collection<HoaDon> hoaDons;

    public Ghe() {
    }

    public Ghe(int maGhe, String hang, String cot, int trangThai) {
        this.maGhe = maGhe;
        this.hang = hang;
        this.cot = cot;
        this.trangThai = trangThai;
    }

    public int getMaGhe() {
        return maGhe;
    }

    public void setMaGhe(int maGhe) {
        this.maGhe = maGhe;
    }

    public LoaiGhe getLoaiGhe() {
        return loaiGhe;
    }

    public void setLoaiGhe(LoaiGhe loaiGhe) {
        this.loaiGhe = loaiGhe;
    }

    public String getHang() {
        return hang;
    }

    public void setHang(String hang) {
        this.hang = hang;
    }

    public String getCot() {
        return cot;
    }

    public void setCot(String cot) {
        this.cot = cot;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public Phong getPhong() {
        return phong;
    }

    public void setPhong(Phong phong) {
        this.phong = phong;
    }
    
    public Collection<HoaDon> getHoaDons() {
        return this.hoaDons;
    }

    public void setHoaDons(Collection<HoaDon> hoaDons) {
        this.hoaDons = hoaDons;
    }
}
