package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.model.TaiKhoan;
import web.service.LoginService;

@Controller
public class loginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    JavaMailSender mailer;

    @RequestMapping("/login")
    public String login(ModelMap model) {
        return "Login_SignUp_Forgetpass/Login";
    }

    @RequestMapping(value = "/check-login", method = RequestMethod.POST)
    public String checkLogin(ModelMap model, @ModelAttribute("taikhoan") TaiKhoan taikhoan, HttpSession session) {
        try {
            TaiKhoan user = loginService.checkLogin(taikhoan);
            if (user != null) {
                session.setAttribute("user", user);
                if (user.getVaiTro().getMaVaiTro() == 1) {
                    return "redirect:/admin/index.htm";
                } else {
                    return "redirect:/user/home.htm";
                }
            } else {
                model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác.");
                return "Login_SignUp_Forgetpass/Login";
            }
        } catch (Exception e) {
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
        try {
            String errorMessage = loginService.signup(taikhoan);
            if (errorMessage != null) {
                model.addAttribute("error", errorMessage);
                return "Login_SignUp_Forgetpass/SignUp";
            }
            model.addAttribute("message", "Đăng ký thành công!");
            return "Login_SignUp_Forgetpass/SignUp";
        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "Login_SignUp_Forgetpass/SignUp";
        }
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String showForgotPasswordForm(ModelMap model) {
        model.addAttribute("taikhoan", new TaiKhoan());
        return "Login_SignUp_Forgetpass/forgot";
    }

    @RequestMapping(value = "/check-forgot", method = RequestMethod.POST)
    public String checkForgot(ModelMap model, @ModelAttribute("taikhoan") TaiKhoan taikhoan) {
        try {
            String newPassword = loginService.resetPassword(taikhoan.getEmail());
            if (newPassword != null) {
                String emailTo = taikhoan.getEmail();
                String emailSubj = "Cấp Lại Mật Khẩu Mới";
                String emailContent = "Mật khẩu mới của bạn là: " + newPassword;

                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(emailTo);
                message.setSubject(emailSubj);
                message.setText(emailContent);
                mailer.send(message);
                model.addAttribute("message", "Gửi email thành công!");
            } else {
                model.addAttribute("error", "Email không tồn tại!");
            }
            return "Login_SignUp_Forgetpass/forgot";
        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "Login_SignUp_Forgetpass/forgot";
        }
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/login.htm";
    }

}
