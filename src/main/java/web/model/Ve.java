package web.model;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="VE")
public class Ve {
	@Id
	@Column(name="MAVE")
	private int maVe;
	
	@ManyToOne
	@JoinColumn(name="maCaChieu")
    private CaChieu caChieu;
	
	
	@ManyToOne
	@JoinColumn(name="maLoaiGhe")
    private LoaiGhe loaiGhe;
	
	@OneToMany(mappedBy = "ve", fetch = FetchType.EAGER)
	private Collection<HoaDon> hoaDons;

    public Ve() {
    }

    public Ve(int maVe, CaChieu caChieu, double giaVe) {
        this.maVe = maVe;
        this.caChieu = caChieu;
    }

    public int getMaVe() {
        return maVe;
    }

    public void setMaVe(int maVe) {
        this.maVe = maVe;
    }

    public CaChieu getCaChieu() {
        return caChieu;
    }

    public void setCaChieu(CaChieu caChieu) {
        this.caChieu = caChieu;
    }
    
    public LoaiGhe getLoaiGhe() {
        return loaiGhe;
    }

    public void setLoaiGhe(LoaiGhe loaiGhe) {
        this.loaiGhe = loaiGhe;
    }

    
    public Collection<HoaDon> getHoaDons() {
        return this.hoaDons;
    }

    public void setHoaDons(Collection<HoaDon> hoaDons) {
        this.hoaDons = hoaDons;
    }
}
