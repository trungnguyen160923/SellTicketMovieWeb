package web.controller;


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
import web.model.HoaDon;
import web.model.LoaiGhe;
import web.model.LoaiPhong;
import web.model.Phim;
import web.model.Phong;

@Transactional
@Controller
@RequestMapping("/admin/")
public class adminThongKeCtrl {
	@Autowired
    private SessionFactory factory;
	
	// Trang Thống Kê
	@RequestMapping("thongKe")
	public String thongKe(ModelMap model) {
		Session session = factory.openSession();
		// Phim
		String hql = "FROM HoaDon hd WHERE hd.trangThai = 1";
		// Hóa Đơn
		String hqlCaChieu = "FROM CaChieu";
		Query query = session.createQuery(hqlCaChieu);
		Query query1 = session.createQuery(hql);
		
		List<CaChieu> list = query.list();
		List<HoaDon> listHoaDon = query1.list();
		
		model.addAttribute("caChieus", list);
		model.addAttribute("hoaDons", listHoaDon);
		
		return "admin/thongKe";
	}
}
