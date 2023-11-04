package repository.mapper;

import dao.StudentDAO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StudentMapper {

    List<StudentDAO> getAllStudent();
}
