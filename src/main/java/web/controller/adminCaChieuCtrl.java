package web.controller;

import java.util.ArrayList;
import java.util.Date;
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
}