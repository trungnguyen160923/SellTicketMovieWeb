package web.model;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="PHONG")
public class Phong {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MAPHONG")
	private int maPhong;
	
	@Column(name="TENPHONG")
    private String tenPhong;
	
	@ManyToOne
	@JoinColumn(name="maRap")
    private Rap rap;
	
	@ManyToOne
	@JoinColumn(name="maLoaiPhong")
    private LoaiPhong loaiPhong;
	
	@Column(name="TINHTRANG")
    private boolean tinhTrang;
	
	@OneToMany(mappedBy = "phong",fetch = FetchType.EAGER)
	private Collection<Ghe> ghes;
	
	@OneToMany(mappedBy = "phong", fetch = FetchType.EAGER)
	private Collection<CaChieu> caChieus;

    public Phong() {
    }

    public Phong(int maPhong, String tenPhong, boolean tinhTrang) {
        this.maPhong = maPhong;
        this.tenPhong = tenPhong;
        this.tinhTrang = tinhTrang;
    }

    public int getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(int maPhong) {
        this.maPhong = maPhong;
    }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }

    public Rap getRap() {
        return rap;
    }

    public void setRap(Rap rap) {
        this.rap = rap;
    }

    public LoaiPhong getLoaiPhong() {
        return loaiPhong;
    }

    public void setLoaiPhong(LoaiPhong loaiPhong) {
        this.loaiPhong = loaiPhong;
    }

    public boolean isTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(boolean tinhTrang) {
        this.tinhTrang = tinhTrang;
    }
    
    public Collection<Ghe> getGhes() {
        return ghes;
    }

    public void setGhes(Collection<Ghe> ghes) {
        this.ghes = ghes;
    }
    
    public void setCaChieus(Collection<CaChieu> caChieus) {
    	this.caChieus = caChieus;
    }
    
    public Collection<CaChieu> getCaChieus() {
    	return this.caChieus;
    }
    
}
