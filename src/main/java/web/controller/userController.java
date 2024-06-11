package web.controller;

import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.model.TaiKhoan;
import web.service.MaHoa;

@Controller
public class userController {

    @Autowired
    private SessionFactory factory;

    @RequestMapping("/user/infor")
    public String userIn4(ModelMap model, HttpSession session) {
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login.htm";
        }
        model.addAttribute("user", user);       
        return "user/AccountIn4";
    }

    @RequestMapping(value = "/update-in4", method = RequestMethod.POST)
    public String updateIn4(ModelMap model, @ModelAttribute("user") TaiKhoan userFromForm, HttpSession session) {
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");
        Session hibernateSession = factory.openSession();
        try {
            if (!userFromForm.getSdt().equals(user.getSdt())) {
                String hql1 = "FROM TaiKhoan WHERE sdt = :sdt";
                Query query1 = hibernateSession.createQuery(hql1);
                query1.setParameter("sdt", userFromForm.getSdt());
                TaiKhoan user1 = (TaiKhoan) query1.uniqueResult();
                if (user1 != null) {
                    session.setAttribute("error", "Số điện thoại đã được sử dụng.");
                    return "user/AccountIn4";
                }
            }
            if (!userFromForm.getEmail().equals(user.getEmail())) {
                String hql2 = "FROM TaiKhoan WHERE email = :email";
                Query query2 = hibernateSession.createQuery(hql2);
                query2.setParameter("email", userFromForm.getEmail());
                TaiKhoan user2 = (TaiKhoan) query2.uniqueResult();
                if (user2 != null) {
                    session.setAttribute("error", "Email đã được sử dụng.");
                    return "user/AccountIn4";
                }
            }
        } catch (Exception e) {
            session.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "user/AccountIn4";
        }

        try {
            hibernateSession.beginTransaction();
            userFromForm.setMaTaiKhoan(user.getMaTaiKhoan());
            userFromForm.setMatKhau(user.getMatKhau());
            userFromForm.setTrangThai(user.isTrangThai());
            userFromForm.setVaiTro(user.getVaiTro());
            userFromForm.setAnhDaiDien(user.getAnhDaiDien());
            hibernateSession.update(userFromForm);
            hibernateSession.getTransaction().commit();
            session.setAttribute("user", userFromForm);
            session.setAttribute("message", "Lưu thông tin thành công!");
            return "user/AccountIn4";
        } catch (Exception e) {
            hibernateSession.getTransaction().rollback();
            session.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "user/AccountIn4";
        } finally {
            hibernateSession.close();
        }
    }

    @RequestMapping(value = "/Change-pass", method = RequestMethod.POST)
    public String changePass(ModelMap model, @RequestParam("oldPassword") String oldPassword,
                             @RequestParam("newPassword") String newPassword, HttpSession session) {
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");
        Session hibernateSession = factory.openSession();
        Transaction tx = null;

        try {
            // Kiểm tra mật khẩu cũ
            if (MaHoa.verifyPassword(oldPassword, user.getMatKhau())) {
                // Mã hóa mật khẩu mới và cập nhật vào cơ sở dữ liệu
                tx = hibernateSession.beginTransaction();
                user.setMatKhau(MaHoa.hashPassword(newPassword));
                hibernateSession.update(user);
                tx.commit();

                // Cập nhật session
                session.setAttribute("user", user);
                session.setAttribute("message", "Lưu thông tin thành công!");
                return "user/AccountIn4";
            } else {
                session.setAttribute("error", "Mật khẩu cũ không đúng.");
                return "user/AccountIn4";
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            session.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "user/AccountIn4";
        } finally {
            hibernateSession.close();
        }
    }
}
