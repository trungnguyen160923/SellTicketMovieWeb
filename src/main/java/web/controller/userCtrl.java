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

import web.model.Ghe;
import web.model.LoaiGhe;
import web.model.LoaiPhong;
import web.model.Phim;
import web.model.Phong;

@Transactional
@Controller
@RequestMapping("/user/")
public class userCtrl {
	@Autowired
	private SessionFactory factory;

	// Trang Chủ Admin
	@RequestMapping("index")
	public String indexx(ModelMap model) {
		Session session = factory.openSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		model.addAttribute("phims", list);
		return "user/indexUser";
	}

	// Phòng Xem Phim
	@RequestMapping("phong")
	public String index(ModelMap model) {
		Session session = factory.openSession();
		String hql = "FROM Phong";

		Query query = session.createQuery(hql);

		List<Phong> list = query.list();

		model.addAttribute("phongs", list);

		return "user/phong";
	}

	// DatVe
	@RequestMapping("DatVe")
	public String chiTietPhong(@RequestParam("maPhong") Integer maPhong, ModelMap model) {
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
		session.close();

		return "user/DatVe";
	}
}