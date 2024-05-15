package web.model;
import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="Rap")
public class Rap {
	@Id
	@Column(name="MARAP")
	private int maRap;
	
	@Column(name="TENRAP")
    private String tenRap;
	
	@Column(name="TRANGTHAI")
    private boolean trangThai;
	
	@OneToMany(mappedBy = "rap",fetch = FetchType.EAGER)
	private Collection<Phong> phongs;
	

    public Rap() {
    }

    public Rap(int maRap, String tenRap, boolean trangThai) {
        this.maRap = maRap;
        this.tenRap = tenRap;
        this.trangThai = trangThai;
    }

    public int getMaRap() {
        return maRap;
    }

    public void setMaRap(int maRap) {
        this.maRap = maRap;
    }

    public String getTenRap() {
        return tenRap;
    }

    public void setTenRap(String tenRap) {
        this.tenRap = tenRap;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }
    
    public Collection<Phong> getPhongs() {
        return phongs;
    }

    public void setPhongs(Collection<Phong> phongs) {
        this.phongs = phongs;
    }
}
