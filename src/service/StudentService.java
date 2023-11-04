package service;

import dao.StudentDAO;
import factory.MyBatisMapperFactory;
import repository.mapper.StudentMapper;

import java.util.List;

public class StudentService {

    public List<StudentDAO> getAllStudentList() {
        StudentMapper mapper = MyBatisMapperFactory.getSqlSession().getMapper(StudentMapper.class);
        return mapper.getAllStudent();
    }
}
