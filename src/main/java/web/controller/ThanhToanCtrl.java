package web.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.Query;
import web.model.HoaDon;
import web.model.TaiKhoan;

@Controller
@Transactional
@RequestMapping("/user/")
public class ThanhToanCtrl {

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "thanhToan", method = RequestMethod.GET)
    public String hienThiThanhToan(ModelMap model, HttpSession httpSession) {
        // Kiểm tra xem đã đăng nhập chưa
        TaiKhoan taiKhoan = (TaiKhoan) httpSession.getAttribute("user");
        if (taiKhoan == null) {
            model.addAttribute("message", "Bạn phải đăng nhập để xem hóa đơn.");
            return "user/thanhToan";
        }

        // Lấy mã tài khoản của tài khoản đăng nhập
        int maTaiKhoan = taiKhoan.getMaTaiKhoan();

        // Lấy danh sách hóa đơn từ cơ sở dữ liệu dựa trên mã tài khoản
        Session session = factory.openSession();
        String hql = "FROM HoaDon WHERE taiKhoan.maTaiKhoan = :maTaiKhoan";
        Query query = session.createQuery(hql);
        query.setParameter("maTaiKhoan", maTaiKhoan);
        List<HoaDon> danhSachHoaDon = query.list();
        session.close();

        // Truyền danh sách hóa đơn sang view để hiển thị
        model.addAttribute("danhSachHoaDon", danhSachHoaDon);

        return "user/thanhToan";
    }
    @RequestMapping(value = "thanhToan", method = RequestMethod.POST)
    public String thanhToan(ModelMap model, HttpSession httpSession) {
        Session session = factory.openSession();
        Transaction tx = null;
        TaiKhoan taiKhoan = (TaiKhoan) httpSession.getAttribute("user");
        
        try {
            tx = session.beginTransaction();
            
            // Truy vấn các hóa đơn có trạng thái là false và thuộc về maTaiKhoan
            String hql = "FROM HoaDon WHERE taiKhoan.maTaiKhoan = :maTaiKhoan AND trangThai = false";
            Query query = session.createQuery(hql);
            query.setParameter("maTaiKhoan", taiKhoan.getMaTaiKhoan());
            
            List<HoaDon> hoaDons = query.list();
            
            // Cập nhật trạng thái của từng hóa đơn
            for (HoaDon hoaDon : hoaDons) {
                hoaDon.setTrangThai(true);
                session.update(hoaDon);
            }
            
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return "redirect:/user/thanhToan.htm";
    }

}



