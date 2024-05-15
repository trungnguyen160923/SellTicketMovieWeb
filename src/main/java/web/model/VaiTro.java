package web.model;
import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="VAITRO")
public class VaiTro {
	@Id
	@Column(name="MAVAITRO")
	private int maVaiTro;
	
	@Column(name="TENVAITRO")
    private String tenVaiTro;
	
	@OneToMany(mappedBy = "vaiTro", fetch = FetchType.EAGER)
	private Collection<DoanPhim> doanPhims;
	
	@OneToMany(mappedBy = "vaiTro", fetch = FetchType.EAGER)
	private Collection<TaiKhoan> taiKhoans;

    public VaiTro() {
    }

    public VaiTro(int maVaiTro, String tenVaiTro) {
        this.maVaiTro = maVaiTro;
        this.tenVaiTro = tenVaiTro;
    }

    public int getMaVaiTro() {
        return maVaiTro;
    }

    public void setMaVaiTro(int maVaiTro) {
        this.maVaiTro = maVaiTro;
    }

    public String getTenVaiTro() {
        return tenVaiTro;
    }

    public void setTenVaiTro(String tenVaiTro) {
        this.tenVaiTro = tenVaiTro;
    }
    
    public Collection<DoanPhim> getDoanPhims() {
        return this.doanPhims;
    }

    public void setDoanPhims(Collection<DoanPhim> doanPhims) {
        this.doanPhims = doanPhims;
    }
    
    public Collection<TaiKhoan> getTaiKhoans() {
        return this.taiKhoans;
    }

    public void setTaiKhoans(Collection<TaiKhoan> taiKhoans) {
        this.taiKhoans = taiKhoans;
    }
}
