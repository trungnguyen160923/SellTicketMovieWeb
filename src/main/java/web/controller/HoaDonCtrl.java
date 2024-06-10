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
import org.hibernate.Session;
import org.hibernate.Query;
import web.model.HoaDon;
import web.model.TaiKhoan;

@Controller
@Transactional
@RequestMapping("/user/")
public class HoaDonCtrl {

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "thanhToan", method = RequestMethod.GET)
    public String hienThiThanhToan(ModelMap model, HttpSession httpSession) {
        // Kiểm tra xem đã đăng nhập chưa
        TaiKhoan taiKhoan = (TaiKhoan) httpSession.getAttribute("taiKhoan");
        if (taiKhoan == null) {
            model.addAttribute("message", "Bạn phải đăng nhập để thanh toán.");
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
}



