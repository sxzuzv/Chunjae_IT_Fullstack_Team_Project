package dao;


import dto.BoardDTO;
import dto.UserDTO;
import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.BoardMapper;
import mybatis.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.jni.User;
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
    public int updateUserRptCnt(String userId) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.updateUserRptCnt(userId);
        System.out.println("update query result val = " + result);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("신고횟수 증가 중 오류 발생");
        }
        sqlSession.close();
        return result;
    }





    //최재혁
    public int createUser(UserDTO userDTO) {
        //회원가입
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.createUser(userDTO);
        if(result==1) {
            sqlSession.commit();
        }else{
            System.out.println("저장실패");

        }
        sqlSession.close();
        return result;
    }

    public boolean authenticateUser(String userId, String userPwd) {
        //로그인시 id, pwd 체크
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

    public String authenticateStatus(String userId){
        //유저를 pass reject로 체크
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String result = mapper.authenticateStatus(userId);
        return result;

    }

    public String authenticateAdmin(String userId){
        //관리자를 status는 pass는 user_grade는 A로 확인
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String result = mapper.authenticateAdmin(userId);
        return result;

    }

    public String authenticateFind(String userName, String userEmail) {
        //name이랑 email을 가져와서 아이디 찾기전 권한 확인
        Map<String, String> map = new HashMap<>();
        map.put("user_name", userName);
        map.put("user_email", userEmail);
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String result = mapper.authenticateFind(map);
        return result;

    }

    public boolean authenticateFindPass(String userId, String userEmail, String userCp) {
        //id, email, cp가져와서 비밀번호 변경전 권한 확인
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
        //비밀번호 찾기 -> 비밀번호 변경 실행
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

    public int updateUserInfo(UserDTO userDTO) {
        //내 정보 수정
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.updateUserInfo(userDTO);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("업데이트중 오류 발생");
        }
        return result;
    }

    public boolean idCheck(String userId) {
        //아이디 중복 체크
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.idCheck(userId);
        if (result == 1) {
            return true;
        } else {
            return false;
        }

    }


    public UserDTO userSelectView(String userId) {
        //유저의 정보를 가져옴
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        UserDTO userDTO = mapper.userSelectView(userId);
        sqlSession.close();
        return userDTO;
    }

    public int userSelfDelete(String userId) {
        //유저의 회원탈퇴
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.userSelfDelete(userId);
        if(result == 1){
            sqlSession.commit();
        }else{
            System.out.println("저장실패");
        }
        return result;

    }



    public int userSelectNonPassCount(Map<String, Object> map){
        //status가 reject인 사람들 불러오기
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.userSelectNonPassCount(map);
        sqlSession.close();
        return result;
    }

    public List<UserDTO> userSelectNonPassPage(Map<String, Object> map){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<UserDTO> result = mapper.userSelectNonPassPage(map);
        sqlSession.close();
        return result;
    }

    public int userSelectReportCount(Map<String, Object> map){
        //유저의 신고횟수가 5회가 넘을때 가져옴
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result =mapper.userSelectReportCount(map);
        sqlSession.close();
        return result;
    }

    public List<UserDTO> userSelectReportPage(Map<String, Object> map){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<UserDTO> result = mapper.userSelectReportPage(map);
        sqlSession.close();
        return result;
    }

    public int updateUserPass(String userId) {
        //유저의 status pass로 업데이트
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.updateUserPass(userId);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("업데이트중 오류 발생");
        }
        return result;
    }

    public int updateUserPending(String userId){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.updateUserPending(userId);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("업데이트중 오류 발생");
        }
        return result;
    }
    public int updateUserDrop(String userId) {
        //유저의 status를 reject로 바꿔서 회원강퇴
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int result = mapper.updateUserDrop(userId);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("업데이트중 오류 발생");
        }
        return result;
    }



}
