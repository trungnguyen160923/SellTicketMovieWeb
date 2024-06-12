package web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.model.CaChieu;
import web.model.Ghe;
import web.model.HoaDon;
import web.model.LoaiGhe;
import web.model.Phong;
import web.model.TaiKhoan;
import web.model.Ve;

@Transactional
@Controller
@RequestMapping("/user/")
public class ChonGheCtrl {

	@Autowired
	private SessionFactory factory;
	@RequestMapping("/chonghe")
	public String chiTietPhong(@RequestParam("maPhong") Integer maPhong,@RequestParam("maCaChieu") Integer maCaChieu, ModelMap model,HttpSession httpSession) {
		Session session = factory.openSession();
		String hql = "FROM Phong p WHERE p.maPhong = :maPhong";
		String hqlGhe = "FROM Ghe g WHERE g.phong.maPhong = :maPhong";
		String hqlLoaiGhe = "FROM LoaiGhe";

		Query query2 = session.createQuery(hqlLoaiGhe);
		Query query = session.createQuery(hql);
		query.setParameter("maPhong", maPhong);

		Query query1 = session.createQuery(hqlGhe);
		query1.setParameter("maPhong", maPhong);
		List<LoaiGhe> listLoaiGhe = query2.list();

		Phong phong = (Phong) query.uniqueResult();
		List<Ghe> listGhes = query1.list();

		model.addAttribute("phong", phong);
		model.addAttribute("ghes", listGhes);
		model.addAttribute("loaiGhes", listLoaiGhe);
		model.addAttribute("maCaChieu", maCaChieu);
		session.close();

		return "user/ChonGhe";
	}
	@RequestMapping(value="chonGhe", method = RequestMethod.POST)
	public String chonGhe(@RequestParam("ghes") List<Integer> ghes,
	                      @RequestParam("maCaChieu") Integer maCaChieu,
	                      ModelMap model, HttpSession session1) {
	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    Date d = new Date();
	    boolean allSeatsUpdated = true;
	    
	    try {
	        for (Integer maGhe : ghes) {
	            Ghe ghe = (Ghe) session.get(Ghe.class, maGhe);
	            if (ghe != null && ghe.getTrangThai() != -1) { // Check if the seat is available (trangThai != -1)
	                ghe.setTrangThai(1);
	                session.update(ghe);
	                
	                CaChieu cc = new CaChieu();
	                cc.setMaCaChieu(maCaChieu);
	                HoaDon hd = new HoaDon();
	                TaiKhoan u = (TaiKhoan) session1.getAttribute("user");
	                hd.setTaiKhoan(u);
	                hd.setSoLuong(1);
	                hd.setTongGia(ghe.getLoaiGhe().getGiaGhe());
	                hd.setNgayMua(d);
	                hd.setTrangThai(false);
	                hd.setGhe(ghe);
	                hd.setCaChieu(cc);
	                session.save(hd);
	            } else {
	                allSeatsUpdated = false;
	                break;
	            }
	        }

	        if (allSeatsUpdated) {
	            t.commit();
	            model.addAttribute("message", "Mua vé thành công!");
	        } else {
	            t.rollback();
	            model.addAttribute("message", "Lỗi Mua Vé. Vui lòng thử lại.");
	        }
	    } catch (Exception e) {
	        t.rollback();
	        model.addAttribute("message", "Có lỗi! Lỗi: " + e);
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }

	    return "redirect:/user/thanhToan.htm";
	}

}
