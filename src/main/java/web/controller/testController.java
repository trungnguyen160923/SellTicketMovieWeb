package web.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import web.model.Ghe;
import web.model.LoaiGhe;
import web.model.LoaiPhong;
import web.model.Phong;
import web.model.Rap;

@Controller
public class testController {
	@Autowired
    private SessionFactory factory;
	
	@RequestMapping("/test")
	public String testFunc(ModelMap model) {
		Session session = factory.openSession();
		String hql = "FROM Ghe";
		String hql1 = "FROM LoaiGhe";
		String hql2 = "FROM Phong";
		String hql3 = "FROM LoaiPhong";
		String hql4 = "FROM Rap";
		String hql5 = "FROM CaChieu";
		String hql6 = "FROM Phim";
		String hql7 = "FROM Phim_TheLoai";
		String hql8 = "FROM TheLoaiPhim";
		String hql9 = "FROM ThamGia";
		String hql10 = "FROM DoanPhim";
		String hql11 = "FROM VaiTro";
		String hql12 = "FROM TaiKhoan";
		String hql13 = "FROM HoaDon";
		String hql14 = "FROM Ve";
		Query query = session.createQuery(hql);
		List<Ghe> list = query.list();
		
		Query query1 = session.createQuery(hql1);
		List<LoaiGhe> list1 = query1.list();
		
		Query query2 = session.createQuery(hql2);
		List<Phong> list2 = query2.list();
		
		Query query3 = session.createQuery(hql3);
		List<LoaiPhong> list3 = query3.list();
		
		Query query4 = session.createQuery(hql4);
		List<Rap> list4 = query4.list();
		
		Query query5 = session.createQuery(hql5);
		List<Rap> list5 = query5.list();
		
		Query query6 = session.createQuery(hql6);
		List<Rap> list6 = query6.list();
		
		Query query7 = session.createQuery(hql7);
		List<Rap> list7 = query7.list();
		
		Query query8 = session.createQuery(hql8);
		List<Rap> list8 = query8.list();
		
		Query query9 = session.createQuery(hql9);
		List<Rap> list9 = query9.list();
		
		Query query10 = session.createQuery(hql10);
		List<Rap> list10 = query10.list();
		
		Query query11 = session.createQuery(hql11);
		List<Rap> list11 = query11.list();
		
		Query query12 = session.createQuery(hql12);
		List<Rap> list12 = query12.list();
		
		Query query13 = session.createQuery(hql13);
		List<Rap> list13 = query13.list();
		
		Query query14 = session.createQuery(hql14);
		List<Rap> list14 = query14.list();
		
		model.addAttribute("ghes", list);
		model.addAttribute("loaiGhes", list1);
		model.addAttribute("phongs", list2);
		model.addAttribute("loaiPhongs", list3);
		model.addAttribute("raps", list4);
		model.addAttribute("caChieus", list5);
		model.addAttribute("phims", list6);
		model.addAttribute("phim_TheLoais", list7);
		model.addAttribute("TheLoaiPhims", list8);
		model.addAttribute("thamGias", list9);
		model.addAttribute("doanPhims", list10);
		model.addAttribute("vaiTros", list11);
		model.addAttribute("taiKhoans", list12);
		model.addAttribute("hoaDons", list13);
		model.addAttribute("ves", list14);
		return "/test";
	}
}
