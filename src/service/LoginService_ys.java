package service;

import dto.StudentDTO_ys;
import dto.TeacherDTO_ys;
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

    // 로그인한 학생 회원의 정보 갖고 오기
    public StudentDTO_ys getLoginStudent(String studentEmail) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();
        StudentMapper_ys mapper = sqlSession.getMapper(StudentMapper_ys.class);
        StudentDTO_ys studentDTO = mapper.getLoginStudent(studentEmail);

        return studentDTO;
    }

    public TeacherDTO_ys getLoginTeacher(String teacherEmail) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();
        TeacherMapper_ys mapper = sqlSession.getMapper(TeacherMapper_ys.class);
        TeacherDTO_ys teacherDTO = mapper.getLoginTeacher(teacherEmail);

        return teacherDTO;
    }
}



