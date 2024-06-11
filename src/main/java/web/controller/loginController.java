package web.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		Session hibernateSession = factory.openSession();
		try {
			String hql = "FROM TaiKhoan WHERE email = :username";
			Query query = hibernateSession.createQuery(hql);
			query.setParameter("username", taikhoan.getEmail());
			TaiKhoan user = (TaiKhoan) query.uniqueResult();

			if (user != null && MaHoa.verifyPassword(taikhoan.getMatKhau(), user.getMatKhau())) {
				session.setAttribute("user", user);
				hibernateSession.close();
				if (user.getVaiTro().getMaVaiTro() == 1) {
					return "redirect:/admin/index.htm";
				} else {
					return "redirect:/user/infor.htm";
				}
			} else {
				model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác.");
				hibernateSession.close();
				return "Login_SignUp_Forgetpass/Login";
			}
		} catch (Exception e) {
			hibernateSession.close();
			model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
			e.printStackTrace();
			return "redirect:/login.htm";
		}
	}

	@RequestMapping("/signup")
	public String signup(ModelMap model) {
		model.addAttribute("taikhoan", new TaiKhoan());
		return "Login_SignUp_Forgetpass/SignUp";
	}

	@RequestMapping(value = "/check-signup", method = RequestMethod.POST)
	public String checkSignup(ModelMap model, @ModelAttribute("taikhoan") TaiKhoan taikhoan) {
		Session hibernateSession = factory.openSession();
		Transaction t = hibernateSession.beginTransaction();
		try {
			String hql1 = "FROM TaiKhoan WHERE sdt = :sdt or email = :email";
			Query query1 = hibernateSession.createQuery(hql1);
			query1.setParameter("sdt", taikhoan.getSdt());
			query1.setParameter("email", taikhoan.getEmail());
			TaiKhoan user1 = (TaiKhoan) query1.uniqueResult();

			if (user1 != null) {
				model.addAttribute("error", "Số điện thoại hoặc email đã được sử dụng.");
				return "Login_SignUp_Forgetpass/SignUp";
			}
			taikhoan.setMatKhau(MaHoa.hashPassword(taikhoan.getMatKhau()));
			VaiTro vaiTro = new VaiTro();
			vaiTro.setMaVaiTro(3);
			taikhoan.setVaiTro(vaiTro);
			taikhoan.setTrangThai(true);
			taikhoan.setAnhDaiDien("avatar_default.jpg");
			hibernateSession.save(taikhoan);
			t.commit();
			model.addAttribute("message", "Đăng ký thành công!");
			return "Login_SignUp_Forgetpass/SignUp";
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
			e.printStackTrace();
			return "Login_SignUp_Forgetpass/SignUp";
		} finally {
			hibernateSession.close();
		}
	}

	@RequestMapping(value = "/forgot", method = RequestMethod.GET)
	public String showForgotPasswordForm(ModelMap model) {
		model.addAttribute("taikhoan", new TaiKhoan());
		return "Login_SignUp_Forgetpass/forgot";
	}

	@Autowired
	JavaMailSender mailer;

	@RequestMapping(value = "/check-forgot", method = RequestMethod.POST)
	public String checkForgot(ModelMap model, @ModelAttribute("taikhoan") TaiKhoan taikhoan) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		try {
			String hql = "FROM TaiKhoan WHERE email = :username";
			Query query = session.createQuery(hql);
			query.setParameter("username", taikhoan.getEmail());
			TaiKhoan user = (TaiKhoan) query.uniqueResult();

			if (user != null) {
				Random rd = new Random();
				int matkhaurd = rd.nextInt(9000000) + 1000000;
				String matkhaurandom = String.valueOf(matkhaurd);

				user.setMatKhau(MaHoa.hashPassword(matkhaurandom));
				session.update(user);
				tx.commit();
				String emailTo = taikhoan.getEmail();
				String emailSubj = "Cấp Lại Mật Khẩu Mới";
				String emailContent = "Mật khẩu mới của bạn là: " + matkhaurandom;

				try {
					SimpleMailMessage message = new SimpleMailMessage();
					message.setTo(emailTo);
					message.setSubject(emailSubj);
					message.setText(emailContent);
					mailer.send(message);
					model.addAttribute("message", "Gửi email thành công!");
				} catch (Exception ex) {
					model.addAttribute("error", "Gửi email thất bại!");
					ex.printStackTrace();
				}
				return "Login_SignUp_Forgetpass/forgot";
			} else {
				model.addAttribute("error", "Email không tồn tại!");
				return "Login_SignUp_Forgetpass/forgot";
			}
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
			e.printStackTrace();
			return "Login_SignUp_Forgetpass/forgot";
		} finally {
			session.close();
		}
	}
}
