package web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.model.CaChieu;
import web.model.Ghe;
import web.model.LoaiGhe;
import web.model.LoaiPhong;
import web.model.Phim;
import web.model.Phong;
import web.model.Ve;

@Transactional
@Controller
@RequestMapping("/admin/")
public class adminCaChieuCtrl {
	@Autowired
    private SessionFactory factory;
	
	@RequestMapping("caChieu")
	public String index(ModelMap model) {
		Session session = factory.openSession();
		String hql = "FROM Phong";
		String hqlLoaiPhong = "FROM LoaiPhong";
		String hqlLoaiGhe = "FROM LoaiGhe";
		String hqlCaChieu = "FROM CaChieu";
		
		Query query = session.createQuery(hql);
		Query query1 = session.createQuery(hqlLoaiPhong);
		Query query2 = session.createQuery(hqlLoaiGhe);
		Query query3 = session.createQuery(hqlCaChieu);
		
		List<Phong> list = query.list();
		List<LoaiPhong> listLoaiPhong = query1.list();
		List<LoaiGhe> listLoaiGhe = query2.list();
		List<CaChieu> listCaChieu = query3.list();
		
		model.addAttribute("phongs", list);
		model.addAttribute("loaiPhongs", listLoaiPhong);
		model.addAttribute("loaiGhes", listLoaiGhe);
		model.addAttribute("caChieus", listCaChieu);
		
		return "admin/caChieu";
	}
	
	@RequestMapping("themCaChieu")
	public String addCaChieu(ModelMap model) {
		Session session = factory.openSession();
		String hql = "FROM Phong";
		String hqlPhim = "FROM Phim";
		String hqlVe = "FROM Ve";
		String hqlCaChieu = "FROM CaChieu";
		String hqlLoaiGhe = "FROM CaChieu";
		
		Query query = session.createQuery(hql);
		Query query1 = session.createQuery(hqlPhim);
		Query query2 = session.createQuery(hqlVe);
		Query query3 = session.createQuery(hqlCaChieu);
		Query query4 = session.createQuery(hqlLoaiGhe);
		
		List<Phong> list = query.list();
		List<Phim> listPhim = query1.list();
		List<Ve> listVe = query2.list();
		List<CaChieu> listCaChieu = query3.list();
		List<LoaiGhe> listLoaiGhe = query4.list();
		
		model.addAttribute("phongs", list);
		model.addAttribute("phims", listPhim);
		model.addAttribute("loaiGhes", listVe);
		model.addAttribute("caChieus", listCaChieu);
		model.addAttribute("loaiGhes", listLoaiGhe);
		return "admin/themCaChieu";
	}
	@RequestMapping(value="taoCaChieu", method = RequestMethod.POST)
	public String taoCaChieu(ModelMap model,
			@RequestParam("maPhim") Integer maPhim,
			@RequestParam("maPhong") Integer maPhong,
			@RequestParam("ngayChieu") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayChieu,
			@RequestParam("gioBatDau") String gioBatDau,
			@RequestParam("gioKetThuc") String gioKetThuc) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
	        // Parse the time strings into Time objects

	        // Create a new CaChieu object
	        CaChieu newCaChieu = new CaChieu();
	        
	        Phim phim = new Phim();
	        phim.setMaPhim(maPhim);
	        newCaChieu.setPhim(phim);
	        
	        Phong phong = new Phong();
	        phong.setMaPhong(maPhong);
	        newCaChieu.setPhong(phong);
	        newCaChieu.setNgayChieu(ngayChieu);
	        newCaChieu.setGioBatDau(gioBatDau);
	        newCaChieu.setGioKetThuc(gioKetThuc);
	        newCaChieu.setTrangThai("Đang Chiếu");

	        // Save the new CaChieu object to the database
	        session.save(newCaChieu);
	        t.commit();
//            model.addAttribute("message", "Cập nhật thành công!");
	        // Redirect to the 'themCaChieu' page after successful creation
	    } catch (Exception e) {
	        t.rollback();
//	        model.addAttribute("message", "Error creating showtime: " + e.getMessage());
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }

		return "redirect:/admin/themCaChieu.htm";
	}
	// trang update Ca Chiếu
	@RequestMapping(value="updateCaChieu", method = RequestMethod.GET)
	public String homeUpdateCaChieu(@RequestParam("maCaChieu") Integer maCaChieu, ModelMap model) {
		Session session = factory.openSession();
		CaChieu cc = (CaChieu) session.get(CaChieu.class, maCaChieu);
		model.addAttribute("cc", cc);
		String hql = "FROM Phong";
		String hqlPhim = "FROM Phim";
		String hqlVe = "FROM Ve";
		String hqlCaChieu = "FROM CaChieu";
		String hqlLoaiGhe = "FROM CaChieu";
		
		Query query = session.createQuery(hql);
		Query query1 = session.createQuery(hqlPhim);
		Query query2 = session.createQuery(hqlVe);
		Query query3 = session.createQuery(hqlCaChieu);
		Query query4 = session.createQuery(hqlLoaiGhe);
		
		List<Phong> list = query.list();
		List<Phim> listPhim = query1.list();
		List<Ve> listVe = query2.list();
		List<CaChieu> listCaChieu = query3.list();
		List<LoaiGhe> listLoaiGhe = query4.list();
		
		model.addAttribute("phongs", list);
		model.addAttribute("phims", listPhim);
		model.addAttribute("loaiGhes", listVe);
		model.addAttribute("caChieus", listCaChieu);
		model.addAttribute("loaiGhes", listLoaiGhe);
		session.close();
		return "admin/updateCaChieu";
	}
	// cập nhật ca Chiếu
	@RequestMapping(value="updateCaChieu", method = RequestMethod.POST)
	public String updateCaChieu(ModelMap model,
			@RequestParam("maCaChieu") Integer maCaChieu,
			@RequestParam("maPhim") Integer maPhim,
			@RequestParam("maPhong") Integer maPhong,
			@RequestParam("ngayChieu") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayChieu,
			@RequestParam("gioBatDau") String gioBatDau,
			@RequestParam("gioKetThuc") String gioKetThuc
			) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
	        // Parse the time strings into Time objects

	        // Create a new CaChieu object
			CaChieu cc = (CaChieu) session.get(CaChieu.class, maCaChieu);
	        
	        Phim phim = new Phim();
	        phim.setMaPhim(maPhim);
	        cc.setPhim(phim);
	        
	        Phong phong = new Phong();
	        phong.setMaPhong(maPhong);
	        cc.setPhong(phong);
	        cc.setNgayChieu(ngayChieu);
	        cc.setGioBatDau(gioBatDau);
	        cc.setGioKetThuc(gioKetThuc);
	        cc.setTrangThai("Đang Chiếu");

	        // Save the new CaChieu object to the database
	        session.update(cc);
	        t.commit();
//            model.addAttribute("message", "Cập nhật thành công!");
	        // Redirect to the 'themCaChieu' page after successful creation
	    } catch (Exception e) {
	        t.rollback();
//	        model.addAttribute("message", "Error creating showtime: " + e.getMessage());
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
		return "redirect:/admin/updateCaChieu.htm?maCaChieu=" + maCaChieu;
	}
	// Xóa ca chiếu nếu tồn tại hoaDon có trangThai là 1( đã trả) và hoadon.ve.maCaChieu = maCaChieu
	@RequestMapping(value="deleteCaChieu", method = RequestMethod.POST)
	public String deleteCaChieu(ModelMap model,@RequestParam("maCaChieu") Integer maCaChieu) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	    	String hqlCheck = "SELECT COUNT(hd) FROM HoaDon hd JOIN hd.ve v WHERE hd.trangThai = 1 AND v.caChieu.maCaChieu = :maCaChieu";
	    	Long count = (Long) session.createQuery(hqlCheck)
	    	                           .setParameter("maCaChieu", maCaChieu)
	    	                           .uniqueResult();
	    	if (count == 0) {
	    	    // Nếu không tồn tại hóa đơn nào có trạng thái đã trả và mã ca chiếu trùng khớp
	    	    // Thì xóa ca chiếu
	    	    String hqlDelete = "DELETE FROM CaChieu cc WHERE cc.maCaChieu = :maCaChieu";
	    	    session.createQuery(hqlDelete)
	    	           .setParameter("maCaChieu", maCaChieu)
	    	           .executeUpdate();
	    	    t.commit();
	    	}
	        
	        // Thông báo thành công
	        // model.addAttribute("message", "Xóa ca chiếu thành công!");
	    } catch (Exception e) {
	        // Xảy ra lỗi, rollback transaction
	        t.rollback();
	        // Thông báo lỗi
	        // model.addAttribute("message", "Xóa ca chiếu thất bại: " + e.getMessage());
	    } finally {
	        // Đóng session
	        session.close();
	    }
	    // Điều hướng về trang danh sách ca chiếu
	    return "redirect:/admin/caChieu.htm";
	}
}
