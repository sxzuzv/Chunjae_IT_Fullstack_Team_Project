package service;

import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.StudentMapper_ys;
import repository.mapper.TeacherMapper_ys;

public class LoginService_ys {
    public int studentLogin(String studentEmail, String studentPassword){
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession(); // 마이바티스 연동 확인 코드
        StudentMapper_ys mapper = sqlSession.getMapper(StudentMapper_ys.class); // 인터페이스에 객체 생성 후 마이바티스 연동
        int studentDAO = mapper.studentLogin(studentEmail, studentPassword);

        return studentDAO;
    }

    public int teacherLogin(String teacherEmail, String teacherPassword) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();
        TeacherMapper_ys mapper = sqlSession.getMapper(TeacherMapper_ys.class);
        int teacherDao = mapper.teacherLogin(teacherEmail, teacherPassword);

        return teacherDao;
    }
}



