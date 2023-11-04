package repository.mapper;

import dao.StudentDAO_jh;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StudentMapper_jh {

    List<StudentDAO_jh> getAllStudent();
}
