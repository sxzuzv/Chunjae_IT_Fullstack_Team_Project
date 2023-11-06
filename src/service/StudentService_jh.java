package service;

import dao.StudentDAO;
import factory.MyBatisMapperFactory;
import repository.mapper.StudentMapper_jh;

import java.util.List;

public class StudentService_jh {

    public List<StudentDAO> getAllStudentList() {
        StudentMapper_jh mapper = MyBatisMapperFactory.getSqlSession().getMapper(StudentMapper_jh.class);
        return mapper.getAllStudent();
    }
}
