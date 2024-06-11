package web.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import web.model.TaiKhoan;

@Service
public class UserService {

    @Autowired
    private SessionFactory factory;

    @Transactional
    public String updateUserInformation(TaiKhoan userFromForm, TaiKhoan currentUser) {
        Session session = factory.getCurrentSession();

        if (!userFromForm.getSdt().equals(currentUser.getSdt())) {
            String hql1 = "FROM TaiKhoan WHERE sdt = :sdt";
            TaiKhoan user1 = (TaiKhoan) session.createQuery(hql1).setParameter("sdt", userFromForm.getSdt()).uniqueResult();
            if (user1 != null) {
                return "Số điện thoại đã được sử dụng.";
            }
        }

        if (!userFromForm.getEmail().equals(currentUser.getEmail())) {
            String hql2 = "FROM TaiKhoan WHERE email = :email";
            TaiKhoan user2 = (TaiKhoan) session.createQuery(hql2).setParameter("email", userFromForm.getEmail()).uniqueResult();
            if (user2 != null) {
                return "Email đã được sử dụng.";
            }
        }

        userFromForm.setMaTaiKhoan(currentUser.getMaTaiKhoan());
        userFromForm.setMatKhau(currentUser.getMatKhau());
        userFromForm.setTrangThai(currentUser.isTrangThai());
        userFromForm.setVaiTro(currentUser.getVaiTro());
        userFromForm.setAnhDaiDien(currentUser.getAnhDaiDien());

        session.update(userFromForm);
        return null;
    }

    @Transactional
    public String changePassword(TaiKhoan user, String oldPassword, String newPassword) {
        Session session = factory.getCurrentSession();

        if (MaHoa.verifyPassword(oldPassword, user.getMatKhau())) {
            user.setMatKhau(MaHoa.hashPassword(newPassword));
            session.update(user);
            return null;
        } else {
            return "Mật khẩu cũ không đúng.";
        }
    }
}
