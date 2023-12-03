package dao;


import dto.BoardDTO;
import dto.UserDTO;
import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.BoardMapper;
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
   /* public int selectUser(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.selectUser(map);
        System.out.println("selectCount - 행 개수 = " + result);
        sqlSession.close();
        return result;
    }

    public List<UserDTO> selectUserList(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<UserDAO> result = mapper.selectUserList(map);
        sqlSession.close();
        return result;
    }*/

    //최영주

    //최재혁
    public boolean createUser(UserDTO userDTO) {

        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        boolean result = mapper.createUser(userDTO);
        sqlSession.commit();

        return result;
    }

    public boolean authenticateUser(String userId, String userPwd) {

        Map<String, String> map = new HashMap<>();
        map.put("user_id", userId);
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

    public String authenticateFind(String userName, String userEmail) {

        Map<String, String> map = new HashMap<>();
        map.put("user_name", userName);
        map.put("user_email", userEmail);
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String result = mapper.authenticateFind(map);
        return result;

    }

    public boolean authenticateFindPass(String userId, String userEmail, String userCp) {

        Map<String, String> map = new HashMap<>();
        map.put("user_id", userId);
        map.put("user_email", userEmail);
        map.put("user_cp", userCp);
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.authenticateFindPass(map);
        if(result == 1 ){
            return true;
        }else{
            return false;
        }

    }

    public int updatePass(UserDTO userDTO) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.updatePass(userDTO);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("업데이트중 오류 발생");
        }
        return result;
    }

    public boolean idCheck(String userId) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.idCheck(userId);
        if (result == 1) {
            return true;
        } else {
            return false;
        }

    }

    public String authenticateStatus(String userId){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String result = mapper.authenticateStatus(userId);
        return result;

    }

    public String authenticateAdmin(String userId){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String result = mapper.authenticateAdmin(userId);
        return result;

    }


}
