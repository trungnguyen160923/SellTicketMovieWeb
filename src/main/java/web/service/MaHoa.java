package web.service;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class MaHoa {

    // Phương thức tĩnh để mã hóa mật khẩu
    public static String hashPassword(String password) {
        return BCrypt.withDefaults().hashToString(12, password.toCharArray());
    }

    // Phương thức tĩnh để xác minh mật khẩu
    public static boolean verifyPassword(String password, String hash) {
        BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), hash);
        return result.verified;
    }
}
