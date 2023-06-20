package login;

import com.wen.dao.db.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class loginUtil {
    public static boolean check(String userName,String pw) throws SQLException {
        if(userName.equals("admin")) {
            if(pw.equals("123456")) return true;
            System.out.println("密码错误！");
            return false;
        }//admin为管理员

        //判断userName，即手机号格式是否正确
        String regex = "^1[3-9]\\d{9}$";

        // 创建Pattern对象，并编译正则表达式规则
        Pattern pattern = Pattern.compile(regex);
        // 创建Matcher对象，用于匹配手机号是否符合正则表达式规则
        Matcher matcher = pattern.matcher(userName);
        if (matcher.matches()==false){
            System.out.println("手机号格式不正确");
            return false;
        }

        //判断密码格式是否正确
        if(pw.length()<8||pw.length()>14){
            System.out.println("密码格式不正确");
            return false;
        }

        //连接数据库查询1.是否存在该用户 2.密码是否正确
        Connection db= DBUtil.getConnection();
        String sql = "SELECT * FROM user WHERE uid = ? AND upassword = ?";
        PreparedStatement pstmt =db.prepareStatement(sql);
        pstmt.setString(1, userName);
        pstmt.setString(2, pw);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            System.out.println("成功登录");
            db.close();
            return true;
        }
        System.out.println("用户不存在或者密码错误！");
        db.close();//关闭数据库
        return false;
    }
}
