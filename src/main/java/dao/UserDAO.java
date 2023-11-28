package dao;


import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import util.Encrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO {
    //신수진


    //최경락


    //최영주
    public boolean authenticateUser(String userId, String userPwd) {

      Map<String, String> map = new HashMap<>();
      map.put("user_id", Encrypt.getEncrypt(userId));
      map.put("user_pwd", userPwd);
      SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
      UserMapper mapper = sqlSession.getMapper(UserMapper.class);
      int result = mapper.authenticateUser(map);
      if (result == 1) {
        return true;
      } else {
        return false;
      }

    }
    //최재혁
}
