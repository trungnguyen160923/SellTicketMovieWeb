package web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.model.HoaDon;

@Controller
@RequestMapping("/user/")
public class HoaDonCtrl {

    // Lưu danh sách hóa đơn tạm trong bộ nhớ
    private static List<HoaDon> danhSachHoaDon = new ArrayList<>();

    // Hiển thị form tạo mới hóa đơn
    @RequestMapping(value = "taoHoaDon", method = RequestMethod.GET)
    public String taoHoaDonForm(ModelMap model) {
        model.addAttribute("hoaDon", new HoaDon());
        return "user/taoHoaDon";
    }

    // Xử lý tạo mới hóa đơn
    @RequestMapping(value = "taoHoaDon", method = RequestMethod.POST)
    public String taoHoaDon(@ModelAttribute("hoaDon") HoaDon hoaDon, ModelMap model) {
        // Thực hiện lưu hóa đơn vào danh sách tạm
        hoaDon.setMaHoaDon(danhSachHoaDon.size() + 1); // Tạo mã hóa đơn tự động
        hoaDon.setNgayMua(new Date()); // Set ngày mua là ngày hiện tại
        hoaDon.setTrangThai(true); // Mặc định trạng thái là true
        danhSachHoaDon.add(hoaDon);
        return "redirect:listHoaDon";
    }
}


