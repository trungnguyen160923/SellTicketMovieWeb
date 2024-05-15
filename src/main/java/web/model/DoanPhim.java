package web.model;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="DOANPHIM")
public class DoanPhim {
	@Id
	@Column(name="MADP")
	private int maDP;
	
	@Column(name="HOTEN")
    private String hoTen;
	
	@Column(name="NGAYSINH")
    private Date ngaySinh;
	
	@Column(name="QUEQUAN")
    private String queQuan;
	
	@Column(name="MIEUTA")
    private String mieuTa;
	
	@ManyToOne
	@JoinColumn(name="maVaiTro")
    private VaiTro vaiTro;
	
	@OneToMany(mappedBy = "doanPhim", fetch = FetchType.EAGER)
	private Collection<ThamGia> thamGias;

    public DoanPhim() {
    }

    public DoanPhim(int maDP, String hoTen, Date ngaySinh, String queQuan, String mieuTa, VaiTro vaiTro) {
        this.maDP = maDP;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.queQuan = queQuan;
        this.mieuTa = mieuTa;
        this.vaiTro = vaiTro;
    }

    public int getMaDP() {
        return maDP;
    }

    public void setMaDP(int maDP) {
        this.maDP = maDP;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getQueQuan() {
        return queQuan;
    }

    public void setQueQuan(String queQuan) {
        this.queQuan = queQuan;
    }

    public String getMieuTa() {
        return mieuTa;
    }

    public void setMieuTa(String mieuTa) {
        this.mieuTa = mieuTa;
    }

    public VaiTro getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(VaiTro vaiTro) {
        this.vaiTro = vaiTro;
    }
    
    public Collection<ThamGia> getThamGias() {
        return this.thamGias;
    }

    public void setThamGias(Collection<ThamGia> thamGias) {
        this.thamGias = thamGias;
    }
}
