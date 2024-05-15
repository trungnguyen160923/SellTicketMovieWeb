package web.model;

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
	@JoinColumn(name="maGhe")
    private Ghe ghe;
	
	@Column(name="GIAVE")
    private double giaVe;
	
	@ManyToOne
	@JoinColumn(name="maHoaDon")
    private HoaDon hoaDon;

    public Ve() {
    }

    public Ve(int maVe, CaChieu caChieu, Ghe ghe, double giaVe, HoaDon hoaDon) {
        this.maVe = maVe;
        this.caChieu = caChieu;
        this.ghe = ghe;
        this.giaVe = giaVe;
        this.hoaDon = hoaDon;
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

    public Ghe getGhe() {
        return ghe;
    }

    public void setGhe(Ghe ghe) {
        this.ghe = ghe;
    }

    public double getGiaVe() {
        return giaVe;
    }

    public void setGiaVe(double giaVe) {
        this.giaVe = giaVe;
    }

    public HoaDon getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(HoaDon hoaDon) {
        this.hoaDon = hoaDon;
    }
}
