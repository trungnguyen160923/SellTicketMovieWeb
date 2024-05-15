package web.model;
import java.io.Serializable;


import javax.persistence.*;

@Entity
@Table(name="PHIM_THELOAI")
public class Phim_TheLoai implements Serializable{
	@Id
	@ManyToOne
	@JoinColumn(name = "maPhim")
	private Phim phim;
	
	@Id
	@ManyToOne
	@JoinColumn(name="maTheLoai")
    private TheLoaiPhim theLoaiPhim;

    public Phim_TheLoai() {
    }

    public Phim_TheLoai(Phim phim, TheLoaiPhim theLoaiPhim) {
        this.phim = phim;
        this.theLoaiPhim = theLoaiPhim;
    }

    public Phim getPhim() {
        return phim;
    }

    public void setPhim(Phim phim) {
        this.phim = phim;
    }

    public TheLoaiPhim getTheLoaiPhim() {
        return theLoaiPhim;
    }

    public void setTheLoaiPhim(TheLoaiPhim theLoaiPhim) {
        this.theLoaiPhim = theLoaiPhim;
    }
}
