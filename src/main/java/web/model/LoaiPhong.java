package web.model;
import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="LOAIPHONG")
public class LoaiPhong {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MALOAIPHONG")
	private int maLoaiPhong;
	
	@Column(name="TENLOAIPHONG")
    private String tenLoaiPhong;
	
	@Column(name="TRANGTHAI")
    private boolean trangThai;
	
	@OneToMany(mappedBy = "loaiPhong",fetch = FetchType.EAGER)
	private Collection<Phong> phongs;
	

    public LoaiPhong() {
    }

    public LoaiPhong(int maLoaiPhong, String tenLoaiPhong, boolean trangThai) {
        this.maLoaiPhong = maLoaiPhong;
        this.tenLoaiPhong = tenLoaiPhong;
        this.trangThai = trangThai;
    }

    public int getMaLoaiPhong() {
        return maLoaiPhong;
    }

    public void setMaLoaiPhong(int maLoaiPhong) {
        this.maLoaiPhong = maLoaiPhong;
    }

    public String getTenLoaiPhong() {
        return tenLoaiPhong;
    }

    public void setTenLoaiPhong(String tenLoaiPhong) {
        this.tenLoaiPhong = tenLoaiPhong;
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
