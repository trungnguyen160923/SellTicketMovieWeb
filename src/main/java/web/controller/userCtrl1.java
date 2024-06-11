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


@Transactional
@Controller
@RequestMapping("/user/")
public class userCtrl1 {
	@Autowired
    private SessionFactory factory;
	
	//Trang chủ usser
	@RequestMapping("home")
	public String home(ModelMap model) {
		Session session = factory.openSession();
		String hqlCaChieu = "FROM CaChieu";
		Query query = session.createQuery(hqlCaChieu);
		List<CaChieu> list = query.list();
		model.addAttribute("caChieus", list);
		return "user/home";
	}
}
