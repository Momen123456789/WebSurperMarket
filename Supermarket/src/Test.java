import login.loginUtil;

import java.sql.SQLException;

public class Test {
    public static void main(String[] args) throws SQLException {
        loginUtil.check("admin","123456");
        loginUtil.check("admin","999999");
        loginUtil.check("123546879","1234564879");
        loginUtil.check("19861556283","123");
        loginUtil.check("19861556283","12345678");
        loginUtil.check("19861556283","123546789");
    }
}
