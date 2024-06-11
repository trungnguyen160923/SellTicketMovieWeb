package web.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.model.CaChieu;
import web.model.Ghe;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class DatVeCtrl {

    @Autowired
    private SessionFactory sessionFactory;

    @RequestMapping("/datve")
    public String datVe(ModelMap model, HttpSession httpSession, @RequestParam("maPhim") int maPhim) {
        // Lấy danh sách thông tin ngày chiếu và ca chiếu từ bảng CaChieu dựa vào maPhim
        Session session = sessionFactory.openSession();
        String hql = "FROM CaChieu WHERE phim.maPhim = :maPhim";
        Query query = session.createQuery(hql);
        query.setParameter("maPhim", maPhim);
        List<CaChieu> danhSachCaChieu = query.list();
        session.close();

        // Lấy danh sách thông tin ghế từ bảng Ghe
        session = sessionFactory.openSession();
        hql = "FROM Ghe";
        query = session.createQuery(hql);
        List<Ghe> danhSachGhe = query.list();
        session.close();

        // Thêm danh sách thông tin ngày chiếu và ca chiếu, danh sách ghế vào model để hiển thị trong view
        model.addAttribute("danhSachCaChieu", danhSachCaChieu);
        model.addAttribute("danhSachGhe", danhSachGhe);

        // Trả về tên của view để hiển thị
        return "user/DatVe";
    }
}
