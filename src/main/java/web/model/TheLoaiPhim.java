package web.model;
import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="THELOAIPHIM")
public class TheLoaiPhim {
	
	@Id
	@Column(name="MATHELOAI")
	private int maTheLoai;
	
	@Column(name="TENTHELOAI")
    private String tenTheLoai;
	
	@Column(name="TRANGTHAI")
    private boolean trangThai;
	
	@OneToMany(mappedBy = "theLoaiPhim", fetch = FetchType.EAGER)
	private Collection<Phim_TheLoai> phim_TheLoais;

    public TheLoaiPhim() {
    	
    }

    public TheLoaiPhim(int maTheLoai, String tenTheLoai, boolean trangThai) {
        this.maTheLoai = maTheLoai;
        this.tenTheLoai = tenTheLoai;
        this.trangThai = trangThai;
    }

    public int getMaTheLoai() {
        return maTheLoai;
    }

    public void setMaTheLoai(int maTheLoai) {
        this.maTheLoai = maTheLoai;
    }

    public String getTenTheLoai() {
        return tenTheLoai;
    }

    public void setTenTheLoai(String tenTheLoai) {
        this.tenTheLoai = tenTheLoai;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }
    
    public Collection<Phim_TheLoai> getPhim_TheLoais(){
    	return this.phim_TheLoais;
    }
    
    public void setPhim_TheLoais(Collection<Phim_TheLoai >phim_TheLoais) {
    	this.phim_TheLoais = phim_TheLoais;
    }
}
