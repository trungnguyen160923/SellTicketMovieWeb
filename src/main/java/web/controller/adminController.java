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


import web.model.Phim;

@Transactional
@Controller
@RequestMapping("/admin/")
public class adminController {
	@Autowired
    private SessionFactory factory;
	
	
	// Trang Chủ Admin
	@RequestMapping("index")
	public String index(ModelMap model,@ModelAttribute("message") String message) {
		Session session = factory.openSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		model.addAttribute("phims", list);
		model.addAttribute("message", message);
		return "admin/index";
	}
	
	// Thêm Bộ Phim
	@RequestMapping("addPhim")
	public String addPhim(ModelMap model,@ModelAttribute("phim") Phim phim) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			String newUrl = getUrlYoutube(phim.getTrailer());
			if(newUrl !=  null) {
				phim.setTrailer(newUrl);
				session.save(phim);
				t.commit();
			}else {
				t.rollback();
			}
			
			model.addAttribute("message","Thêm bộ phim thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
			model.addAttribute("message", "Thêm bộ phim thất bại! Lỗi:" + e);
		}
		finally {
			session.close();
		}
		return "redirect:/admin/index.htm";
	}
	
	// Cập Nhật Phim
	@RequestMapping(value="updatePhim",method = RequestMethod.POST)
	public String updatePhim(ModelMap model,@ModelAttribute("phim") Phim phim) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			String newUrl = getUrlYoutube(phim.getTrailer());
			phim.setTrailer(newUrl);
			session.update(phim);
			t.commit();
			model.addAttribute("message","Cập nhật thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
			model.addAttribute("message" , "Chỉnh sửa thất bại! Lỗi " + e);
		}
		finally {
			session.close();
		}
		return "redirect:/admin/index.htm";
	}
	// xoá phim
	@RequestMapping(value = "delete")
	public String deletePhim(ModelMap model,@ModelAttribute("maPhim") Integer maPhim) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		// Kiểm tra xem phim có đang được chiếu/ sắp lịch không
		String hql = "SELECT COUNT(c) FROM CaChieu c WHERE c.phim.maPhim = :maPhim";
		Query query = session.createQuery(hql);
        query.setParameter("maPhim", maPhim);
        Long count = (Long) query.uniqueResult();
        boolean exists = count > 0;
        if(!exists) {
        	Phim phim = (Phim) session.get(Phim.class, maPhim);
        	try {
    			session.delete(phim);
    			t.commit();
				model.addAttribute("message","Xóa thành công!");
    		} catch (Exception e) {
    			t.rollback();
				model.addAttribute("message", "Xóa thất bại! Lỗi: " + e);
    		}
        }else {
        	model.addAttribute("message", "Không được xóa phim này do đã sắp lịch chiếu: ");
        }
        session.close();
		return "redirect:/admin/index.htm";
	}
	
	private String getUrlYoutube(String youtubeUrl) {
		// Kiểm tra xem đường dẫn đầu vào có phù hợp không
		if(youtubeUrl.startsWith("//www.youtube.com/embed/")) {
			return youtubeUrl;
		}
        if (youtubeUrl == null || !youtubeUrl.startsWith("https://www.youtube.com/watch?v=")) {
            return null;
        }

        // Tách mã video từ đường dẫn
        String[] parts = youtubeUrl.split("=");
        String videoId = parts[1];

        // Tạo đường dẫn mới
        String embedUrl = "//www.youtube.com/embed/" + videoId;
        
        return embedUrl;
	}
}
