package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.model.TaiKhoan;
import web.service.UserService;

@Controller
@RequestMapping("/user/")
public class userController {

	@Autowired
	private UserService userService;

	@RequestMapping("infor")
	public String userIn4(ModelMap model, HttpSession session) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");
		model.addAttribute("user", user);
		return "user/AccountIn4";
	}

	@RequestMapping("update-form")
	public String userUpdate(ModelMap model, HttpSession session) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");
		model.addAttribute("user", user);
		return "user/Update";
	}

	@RequestMapping(value = "update-in4", method = RequestMethod.POST)
	public String updateIn4(ModelMap model, @ModelAttribute("user") TaiKhoan userFromForm, HttpSession session) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");

		try {
			String errorMessage = userService.updateUserInformation(userFromForm, user);
			if (errorMessage != null) {
				model.addAttribute("error", errorMessage);
				return "user/Update";
			}
			session.setAttribute("user", userFromForm);
			model.addAttribute("user", userFromForm);
			model.addAttribute("message", "Lưu thông tin thành công!");
			return "user/Update";
		} catch (Exception e) {
			model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
			e.printStackTrace();
			return "user/Update";
		}
	}

	@RequestMapping("change-password")
	public String changePass(ModelMap model, HttpSession session) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");
		model.addAttribute("user", user);
		return "user/ChangePass";
	}

	@RequestMapping(value = "Change-pass", method = RequestMethod.POST)
    public String changePass(ModelMap model, @RequestParam("oldPassword") String oldPassword,
                             @RequestParam("newPassword") String newPassword, HttpSession session) {
       TaiKhoan user = (TaiKhoan) session.getAttribute("user");

        try {
            String errorMessage = userService.changePassword(user, oldPassword, newPassword);
            if (errorMessage != null) {
                model.addAttribute("error", errorMessage);
                return "user/ChangePass";
            }
            session.setAttribute("user", user);
            model.addAttribute("user", user);
            model.addAttribute("message", "Đổi mật khẩu thành công!");
            return "user/ChangePass";
        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
            e.printStackTrace();
            return "user/ChangePass";
        }
    }
}
