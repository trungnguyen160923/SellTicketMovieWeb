package web.service;

import java.util.Random;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.model.TaiKhoan;
import web.model.VaiTro;

@Service
public class LoginService {

    @Autowired
    private SessionFactory factory;

    @Transactional
    public TaiKhoan checkLogin(TaiKhoan taikhoan) {
        Session session = factory.getCurrentSession();
        String hql = "FROM TaiKhoan WHERE email = :username";
        Query query = session.createQuery(hql);
        query.setParameter("username", taikhoan.getEmail());
        TaiKhoan user = (TaiKhoan) query.uniqueResult();

        if (user != null && MaHoa.verifyPassword(taikhoan.getMatKhau(), user.getMatKhau())) {
            return user;
        }
        return null;
    }

    @Transactional
    public String signup(TaiKhoan taikhoan) {
        Session session = factory.getCurrentSession();
        String hql1 = "FROM TaiKhoan WHERE sdt = :sdt or email = :email";
        Query query1 = session.createQuery(hql1);
        query1.setParameter("sdt", taikhoan.getSdt());
        query1.setParameter("email", taikhoan.getEmail());
        TaiKhoan user1 = (TaiKhoan) query1.uniqueResult();

        if (user1 != null) {
            return "Số điện thoại hoặc email đã được sử dụng.";
        }
        taikhoan.setMatKhau(MaHoa.hashPassword(taikhoan.getMatKhau()));
        VaiTro vaiTro = new VaiTro();
        vaiTro.setMaVaiTro(3);
        taikhoan.setVaiTro(vaiTro);
        taikhoan.setTrangThai(true);
        taikhoan.setAnhDaiDien("avatar_default.jpg");
        session.save(taikhoan);
        return null;
    }

    @Transactional
    public String resetPassword(String email) {
        Session session = factory.getCurrentSession();
        String hql = "FROM TaiKhoan WHERE email = :username";
        Query query = session.createQuery(hql);
        query.setParameter("username", email);
        TaiKhoan user = (TaiKhoan) query.uniqueResult();

        if (user != null) {
            Random rd = new Random();
            int matkhaurd = rd.nextInt(9000000) + 1000000;
            String matkhaurandom = String.valueOf(matkhaurd);

            user.setMatKhau(MaHoa.hashPassword(matkhaurandom));
            session.update(user);
            return matkhaurandom;
        }
        return null;
    }
}
