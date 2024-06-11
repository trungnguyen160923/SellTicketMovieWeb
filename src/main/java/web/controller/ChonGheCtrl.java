package web.controller;

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

import web.model.Ghe;
import web.model.LoaiGhe;
import web.model.Phong;

@Transactional
@Controller
@RequestMapping("/user/")
public class ChonGheCtrl {

	@Autowired
	private SessionFactory factory;
	@RequestMapping("/chonghe")
	public String chiTietPhong(@RequestParam("maPhong") Integer maPhong, ModelMap model,HttpSession httpSession) {
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

		return "user/ChonGhe";
	}
}
