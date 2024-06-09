package web.model;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "LOAIGHE")
public class LoaiGhe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MALOAIGHE")
	private int maLoaiGhe;
	
	@Column(name="TENLOAIGHE")
    private String tenLoaiGhe;
	
	@Column(name="TRANGTHAI")
    private boolean trangThai;

	@OneToMany(mappedBy ="loaiGhe"  ,fetch= FetchType.EAGER)
	private Collection<Ghe> ghes;
	
	@OneToMany(mappedBy = "loaiGhe", fetch = FetchType.EAGER)
	private Collection<Ve> ves;
	
    public LoaiGhe() {
    }

    public LoaiGhe(int maLoaiGhe, String tenLoaiGhe, boolean trangThai) {
        this.maLoaiGhe = maLoaiGhe;
        this.tenLoaiGhe = tenLoaiGhe;
        this.trangThai = trangThai;
    }

    public int getMaLoaiGhe() {
        return maLoaiGhe;
    }

    public void setMaLoaiGhe(int maLoaiGhe) {
        this.maLoaiGhe = maLoaiGhe;
    }

    public String getTenLoaiGhe() {
        return tenLoaiGhe;
    }

    public void setTenLoaiGhe(String tenLoaiGhe) {
        this.tenLoaiGhe = tenLoaiGhe;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }
    
    public Collection<Ghe> getGhes() {
        return ghes;
    }

    public void setGhes(Collection<Ghe> ghes) {
        this.ghes = ghes;
    }
    
    public Collection<Ve> getVes() {
        return ves;
    }

    public void setVes(Collection<Ve> ves) {
        this.ves =ves;
    }
}
