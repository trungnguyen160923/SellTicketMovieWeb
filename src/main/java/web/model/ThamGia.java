package web.model;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="THAMGIA")
public class ThamGia implements Serializable{
	@Id
	@ManyToOne
	@JoinColumn(name="maPhim")
	private Phim phim;
	
	@Id
	@ManyToOne
	@JoinColumn(name="maDP")
    private DoanPhim doanPhim;

    public ThamGia() {
    }

    public ThamGia(Phim phim, DoanPhim doanPhim) {
        this.doanPhim = doanPhim;
        this.phim = phim;
    }

    public Phim getPhim() {
        return phim;
    }

    public void setPhim(Phim phim) {
        this.phim = phim;
    }

    public DoanPhim getDoanPhim() {
        return doanPhim;
    }

    public void setDoanPhim(DoanPhim doanPhim) {
        this.doanPhim = doanPhim;
    }
}
