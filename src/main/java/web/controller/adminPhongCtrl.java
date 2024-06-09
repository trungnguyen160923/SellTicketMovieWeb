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
@RequestMapping("/admin/")
public class adminPhongCtrl {
	@Autowired
    private SessionFactory factory;
	
	//Phòng Xem Phim
	@RequestMapping("phong")
	public String index(ModelMap model) {
		Session session = factory.openSession();
		String hql = "FROM Phong";
		String hqlLoaiPhong = "FROM LoaiPhong";
		String hqlLoaiGhe = "FROM LoaiGhe";
		
		Query query = session.createQuery(hql);
		Query query1 = session.createQuery(hqlLoaiPhong);
		Query query2 = session.createQuery(hqlLoaiGhe);
		
		List<Phong> list = query.list();
		List<LoaiPhong> listLoaiPhong = query1.list();
		List<LoaiGhe> listLoaiGhe = query2.list();
		
		model.addAttribute("phongs", list);
		model.addAttribute("loaiPhongs", listLoaiPhong);
		model.addAttribute("loaiGhes", listLoaiGhe);
		
		return "admin/phong";
	}
	
	// Thêm Phòng
	@RequestMapping("addPhong")
	public String themPhong(ModelMap model,@ModelAttribute("phong") Phong phong,@ModelAttribute("maLoaiPhong") Integer maLoaiPhong) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
				LoaiPhong lp = new LoaiPhong();
				lp.setMaLoaiPhong(maLoaiPhong);
//				phong.getRap().setMaRap(1);;
				phong.setTinhTrang(true);
				phong.setLoaiPhong(lp);
				
				session.save(phong);
				t.commit();
//			model.addAttribute("message","Chỉnh sửa thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
//			model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
		}
		finally {
			session.close();
		}
		return "redirect:/admin/phong.htm";
	}
	
	// Cập nhật phòng
	@RequestMapping("updatePhong")
	public String updatePhong(ModelMap model, @ModelAttribute("phong") Phong phong,
			@ModelAttribute("maLoaiPhong") Integer maLoaiPhong,
			@ModelAttribute("tinhTrang") Integer trinhTrang) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			LoaiPhong lp = new LoaiPhong();
			lp.setMaLoaiPhong(maLoaiPhong);
//			phong.getRap().setMaRap(1);;
			phong.setTinhTrang(true);
			phong.setLoaiPhong(lp);
			if(trinhTrang == 1) {
				phong.setTinhTrang(true);
			}else {
				phong.setTinhTrang(false);
			}
			
			session.update(phong);
			t.commit();
//		model.addAttribute("message","Chỉnh sửa thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
	//		model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
		}
		finally {
			session.close();
		}
		return "redirect:/admin/phong.htm";
	}
	// Xóa Phòng
	@RequestMapping("deletePhong")
	public String deletePhong(ModelMap model, @ModelAttribute("maPhong") Integer maPhong) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		// Kiểm tra xem phong có đang được chiếu/ sắp lịch không
		String hql = "SELECT COUNT(c) FROM CaChieu c WHERE c.phong.maPhong = :maPhong";
		Query query = session.createQuery(hql);
        query.setParameter("maPhong", maPhong);
        Long count = (Long) query.uniqueResult();
        boolean exists = count > 0;
        if(!exists) {
        	Phong phong = (Phong) session.get(Phong.class, maPhong);
        	try {
    			session.delete(phong);
    			t.commit();
				/* model.addAttribute("message","Xóa thành công!"); */
    		} catch (Exception e) {
    			t.rollback();
				/* model.addAttribute("message", "Xóa thất bại!" + e); */
    		}
        }else {
        	// Thông báo không được xóa;
        }
        session.close();
		return "redirect:/admin/phong.htm";
	}
	
	// Chi tiết Phòng
	@RequestMapping("chiTietPhong")
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
		
		return "admin/chiTietPhong";
	}
	// Đặt trạng thái Ghế = -1 = Xóa Ghế
	@RequestMapping("deleteGhe")
	public String deleteGhe(@RequestParam("maGhe") Integer maGhe,@RequestParam("maPhong") Integer maPhong, ModelMap model) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Ghe ghe = (Ghe) session.get(Ghe.class, maGhe);
		try {
			if (ghe != null && ghe.getTrangThai() != 1) {
				ghe.setTrangThai(-1);
				session.update(ghe);
				t.commit();
				/* model.addAttribute("message","Xóa thành công!"); */
			}
			/* model.addAttribute("message","Không được xóa!"); */
		} catch (Exception e) {
			t.rollback();
			/* model.addAttribute("message", "Xóa thất bại!" + e); */
		}finally {
			session.close();
		}
		return "redirect:/admin/chiTietPhong.htm?maPhong="+maPhong;
	}
	// Xóa tất cả ghế trong phòng
	@RequestMapping("deleteAllGhe")
	public String deleteAllGhe(@RequestParam("maPhong") Integer maPhong, ModelMap model) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	        // Đếm số ghế có trangThai = 1 trong phòng này
	        String hqlCheck = "SELECT COUNT(*) FROM Ghe g WHERE g.phong.maPhong = :maPhong AND g.trangThai = 1";
	        Long count = (Long) session.createQuery(hqlCheck)
	                                   .setParameter("maPhong", maPhong)
	                                   .uniqueResult();

	        if (count > 0) {
	            // Có ghế có trangThai = 1, không thể xóa
	            //model.addAttribute("message", "Không thể xóa ghế. Có ghế đã được đặt.");
	        } else {
	            // Xóa tất cả các ghế trong phòng này
	            String hqlDelete = "DELETE FROM Ghe WHERE phong.maPhong = :maPhong";
	            session.createQuery(hqlDelete)
	                   .setParameter("maPhong", maPhong)
	                   .executeUpdate();
	            t.commit();
	            //model.addAttribute("message", "Xóa tất cả ghế thành công.");
	        }
	    } catch (Exception e) {
	        t.rollback();
	       // model.addAttribute("message", "Có lỗi xảy ra khi xóa ghế.");
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
		return "redirect:/admin/chiTietPhong.htm?maPhong="+maPhong;
	}
	// Cập nhật ghế
	@RequestMapping("updateGhe")
	public String updateGhe(@RequestParam("ghes") List<Integer> ghes
			,@RequestParam("maPhong") Integer maPhong,
			ModelMap model,
			@RequestParam("maLoaiGhe") Integer maLoaiGhe,
			@RequestParam("trangThai") Integer trangThai
			) {
		 Session session = factory.openSession();
	        Transaction t = session.beginTransaction();
	        try {
	        	for (Integer maGhe : ghes) {
	                Ghe ghe = (Ghe) session.get(Ghe.class, maGhe);
	                if (ghe != null && ghe.getTrangThai() != 1) { // Check if the seat is not booked (trangThai != 1)
	                    LoaiGhe loaiGhe = new LoaiGhe();
	                    loaiGhe.setMaLoaiGhe(maLoaiGhe);
	                    ghe.setLoaiGhe(loaiGhe);
	                    ghe.setTrangThai(trangThai);
	                    session.update(ghe);
	                }
	            }
	            t.commit();
//	            model.addAttribute("message", "Cập nhật thành công!");
	        } catch (Exception e) {
	            t.rollback();
//	            model.addAttribute("message", "Cập nhật thất bại!");
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }

	        return "redirect:/admin/chiTietPhong.htm?maPhong="+maPhong;
	}
	// Thêm Ghế
	@RequestMapping("addGhe")
	public String addGhe(
			@RequestParam("maPhong") Integer maPhong,
			ModelMap model,
			@RequestParam("maLoaiGhe") Integer maLoaiGhe,
			@RequestParam("trangThai") Integer trangThai,
			@RequestParam("hang") Integer soHang,
			@RequestParam("cot") Integer soCot
			) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	        for (int i = 0; i < soHang; i++) {
	            char hang = (char) ('A' + i);
	            for (int j = 1; j <= soCot; j++) {
	                Ghe ghe = new Ghe();
	                ghe.setHang(String.valueOf(hang));
	                ghe.setCot(String.valueOf(j));
	                ghe.setTrangThai(trangThai);

	                Phong phong = new Phong();
	                phong.setMaPhong(maPhong);
	                ghe.setPhong(phong);

	                LoaiGhe loaiGhe = new LoaiGhe();
	                loaiGhe.setMaLoaiGhe(maLoaiGhe);
	                ghe.setLoaiGhe(loaiGhe);

					session.save(ghe);
	            }
	            
	        }
			t.commit();
//            model.addAttribute("message", "Cập nhật thành công!");
	    } catch (Exception e) {
	        t.rollback();
	        e.printStackTrace();
//            model.addAttribute("message", "Cập nhật thất bại!");
	    } finally {
	        session.close();
	    }
		return "redirect:/admin/chiTietPhong.htm?maPhong="+maPhong;
	}
	
	// Thêm Loại Phòng
	@RequestMapping("addLoaiPhong")
	public String addLoaiPhong(
			@RequestParam("tenLoaiPhong") String tenLoaiPhong,
			ModelMap model
			) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    LoaiPhong loaiPhong = new LoaiPhong();
	    loaiPhong.setTenLoaiPhong(tenLoaiPhong);
	    loaiPhong.setTrangThai(true);
	    try {			
				session.save(loaiPhong);
				t.commit();
	//		model.addAttribute("message","Chỉnh sửa thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
	//		model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
		}
		finally {
			session.close();
		}
		return "redirect:/admin/phong.htm";
	}
	// Update Loại Phòng
	@RequestMapping("updateLoaiPhong")
	public String updateLoaiPhong(@RequestParam("maLoaiPhong") Integer maLoaiPhong,
			@RequestParam("trangThai") Integer trangThai,
			@RequestParam("tenLoaiPhong") String tenLoaiPhong) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	    	LoaiPhong loaiPhong = (LoaiPhong) session.get(LoaiPhong.class, maLoaiPhong);
	    	if(loaiPhong!=null) {
	    		if(trangThai == 1) {
		    		loaiPhong.setTrangThai(true);
		    	}else {
		    		loaiPhong.setTrangThai(false);
		    	}
		    	loaiPhong.setTenLoaiPhong(tenLoaiPhong);
				session.update(loaiPhong);
				t.commit();
//				model.addAttribute("message","Chỉnh sửa thành công!");
	    	}else {
//	    		model.addAttribute("message","Chỉnh sửa thất bại!");
	    	}

	} catch (Exception e) {
		t.rollback();
		System.out.println(e);
//		model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
	}
	finally {
		session.close();
	}
		return "redirect:/admin/phong.htm";
	}
	// Xóa Loại Phòng
	@RequestMapping("deleteLoaiPhong")
	public String deleteLoaiPhong(@RequestParam("maLoaiPhong") Integer maLoaiPhong) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	    	String hqlDelete = "DELETE FROM LoaiPhong lp WHERE lp.maLoaiPhong = :maLoaiPhong";
            session.createQuery(hqlDelete)
                   .setParameter("maLoaiPhong", maLoaiPhong)
                   .executeUpdate();
            t.commit();
//			model.addAttribute("message","Chỉnh sửa thành công!");
		} catch (Exception e) {
//			model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
			// TODO: handle exception
			t.rollback();
		}
		return "redirect:/admin/phong.htm";
	}
	// Thêm Loại Ghế
	@RequestMapping("addLoaiGhe")
	public String addLoaiGhe(@RequestParam("tenLoaiGhe") String tenLoaiGhe,
			ModelMap model) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    LoaiGhe loaiGhe = new LoaiGhe();
	    loaiGhe.setTenLoaiGhe(tenLoaiGhe);
	    loaiGhe.setTrangThai(true);
	    try {			
				session.save(loaiGhe);
				t.commit();
	//		model.addAttribute("message","Chỉnh sửa thành công!");
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
	//		model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
		}
		finally {
			session.close();
		}
		return "redirect:/admin/phong.htm";
	}
	// Update Loại Ghế
	@RequestMapping("updateLoaiGhe")
	public String updateLoaiGhe(@RequestParam("maLoaiGhe") Integer maLoaiGhe,
			@RequestParam("trangThai") Integer trangThai,
			@RequestParam("tenLoaiGhe") String tenLoaiGhe) {
		Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
		try {
	    	LoaiGhe loaiGhe = (LoaiGhe) session.get(LoaiGhe.class, maLoaiGhe);
	    	if(loaiGhe!=null) {
	    		if(trangThai == 1) {
		    		loaiGhe.setTrangThai(true);
		    	}else {
		    		loaiGhe.setTrangThai(false);
		    	}
		    	loaiGhe.setTenLoaiGhe(tenLoaiGhe);
				session.update(loaiGhe);
				t.commit();
//				model.addAttribute("message","Chỉnh sửa thành công!");
	    	}else {
//	    		model.addAttribute("message","Chỉnh sửa thất bại!");
	    	}

	} catch (Exception e) {
		t.rollback();
		System.out.println(e);
//		model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
	}
	finally {
		session.close();
	}
		return "redirect:/admin/phong.htm";
	}
	// Xóa Loại Ghế
		@RequestMapping("deleteLoaiGhe")
		public String deleteLoaiGhe(@RequestParam("maLoaiGhe") Integer maLoaiGhe) {
			Session session = factory.openSession();
		    Transaction t = session.beginTransaction();
		    try {
		    	String hqlDelete = "DELETE FROM LoaiGhe lp WHERE lp.maLoaiGhe = :maLoaiGhe";
	            session.createQuery(hqlDelete)
	                   .setParameter("maLoaiGhe", maLoaiGhe)
	                   .executeUpdate();
	            t.commit();
//				model.addAttribute("message","Chỉnh sửa thành công!");
			} catch (Exception e) {
//				model.addAttribute("message" + e, "Chỉnh sửa thất bại!");
				// TODO: handle exception
				t.rollback();
			}
			return "redirect:/admin/phong.htm";
		}
}
