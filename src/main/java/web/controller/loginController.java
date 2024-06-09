package web.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import web.service.MaHoa;
import web.model.TaiKhoan;
import web.model.VaiTro;

@Controller
public class loginController {
    @Autowired
    private SessionFactory factory;
    
    @RequestMapping("/login")
    public String login(ModelMap model) {
        return "Login_SignUp_Forgetpass/Login"; 
    }
    
    @RequestMapping(value = "/check-login", method = RequestMethod.POST)
    public String checkLogin(ModelMap model, @ModelAttribute("taikhoan") TaiKhoan taikhoan, HttpSession session) {
    	System.out.println(">>>"+taikhoan.getEmail());
        Session hibernateSession  = factory.openSession();
        try {
            String hql = "FROM TaiKhoan WHERE email = :username AND matKhau = :password";
            Query query = hibernateSession .createQuery(hql);
            query.setParameter("username", taikhoan.getEmail());
            query.setParameter("password", MaHoa.toSHA1(taikhoan.getMatKhau()));
            TaiKhoan user = (TaiKhoan) query.uniqueResult();
            if (user != null) {
            	 session.setAttribute("user", user); 
            	if (user.getVaiTro().getMaVaiTro() == 1) {
            		return "redirect:/admin/home";
            	}else return "redirect:/customer/home";
            } else {
                model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác.");
                return "Login_SignUp_Forgetpass/Login";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "Login_SignUp_Forgetpass/Login";
        } finally {
        	hibernateSession .close();
        }
    }
    
    @RequestMapping("/signup")
    public String signup(ModelMap model) {
    	 model.addAttribute("taikhoan", new TaiKhoan());
        return "Login_SignUp_Forgetpass/SignUp";
    }

    @RequestMapping(value = "/check-signup", method = RequestMethod.POST)
    public String checksignup(ModelMap model, @ModelAttribute("taikhoan") TaiKhoan taikhoan) {
        Session session = factory.openSession();
        try {
        	String hql1 = "FROM TaiKhoan WHERE sdt = :sdt ";
            Query query1 = session.createQuery(hql1);
            query1.setParameter("sdt", taikhoan.getSdt());
            TaiKhoan user1 = (TaiKhoan) query1.uniqueResult();
            if (user1 != null) {
                model.addAttribute("error", "Số điện thoại đã được sử dụng.");
                return "Login_SignUp_Forgetpass/SignUp";
            }
        	String hql = "FROM TaiKhoan WHERE email = :email ";
            Query query = session.createQuery(hql);
            query.setParameter("email", taikhoan.getEmail());
            TaiKhoan user = (TaiKhoan) query.uniqueResult();
            if (user != null) {
                model.addAttribute("error", "Email đã được sử dụng.");
                return "Login_SignUp_Forgetpass/SignUp";
            }
            System.out.println("Pass");
            taikhoan.setMatKhau(MaHoa.toSHA1(taikhoan.getMatKhau()));
            VaiTro vaiTro = new VaiTro();
            vaiTro.setMaVaiTro(3);
            taikhoan.setVaiTro(vaiTro);
            taikhoan.setTrangThai(true);
            taikhoan.setAnhDaiDien("avatar_default.jpg");
            session.beginTransaction();
            session.save(taikhoan);
            session.getTransaction().commit();

            model.addAttribute("message", "Đăng ký thành công!");
            return "Login_SignUp_Forgetpass/Login";
        } catch (Exception e) {
            session.getTransaction().rollback();
            model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "Login_SignUp_Forgetpass/SignUp";
        } finally {
            session.close();
        }

    }
    
    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String showForgotPasswordForm(ModelMap model) {
        model.addAttribute("taikhoan", new TaiKhoan());
        return "Login_SignUp_Forgetpass/forgot";
    }
    
    @Autowired JavaMailSender mailer;
    @RequestMapping(value = "/check-forgot", method = RequestMethod.POST)
    public String checkforgot(ModelMap model, @ModelAttribute("taikhoan") TaiKhoan taikhoan) {
        Session session = factory.openSession();
        try {
            String hql = "FROM TaiKhoan WHERE email = :username";
            Query query = session.createQuery(hql);
            query.setParameter("username", taikhoan.getEmail());
            TaiKhoan user = (TaiKhoan) query.uniqueResult();
            if (user != null) {
            	  Random rd = new Random();
                  int matkhaurd = rd.nextInt(1000000, 10000000);
                  String matkhaurandom = String.valueOf(matkhaurd);
                
                session.beginTransaction();
                user.setMatKhau(MaHoa.toSHA1(matkhaurandom));
                session.update(user);
                session.getTransaction().commit();
                
                String emailTo = taikhoan.getEmail();
                String emailSubj = "Cấp Lại Mật Khẩu Mới";
                String emailContent = "Mật khẩu mới của bạn là: " + matkhaurandom;

                try {
                    SimpleMailMessage message = new SimpleMailMessage();
//                    message.setFrom("Rạp Chiếu Phim Số 1 Việt Nam");
                    message.setTo(emailTo);
                    message.setSubject(emailSubj);
                    message.setText(emailContent);
                    mailer.send(message);
                    model.addAttribute("message", "Gửi email thành công!");
                } catch (Exception ex) {
                    model.addAttribute("message", "Gửi email thất bại!");
                }
                return "Login_SignUp_Forgetpass/forgot";
            } else {
                model.addAttribute("error", "Email không tồn tại!");
                return "Login_SignUp_Forgetpass/forgot";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "Login_SignUp_Forgetpass/forgot";
        } finally {
            session.close();
        }
    }
}
