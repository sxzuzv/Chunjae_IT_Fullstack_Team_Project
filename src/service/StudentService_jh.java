package service;

import dao.StudentDAO_jh;
import factory.MyBatisMapperFactory;
import repository.mapper.StudentMapper_jh;

import java.util.List;

public class StudentService_jh {

    public List<StudentDAO_jh> getAllStudentList() {
        StudentMapper_jh mapper = MyBatisMapperFactory.getSqlSession().getMapper(StudentMapper_jh.class);
        return mapper.getAllStudent();
    }
}
