package repository.mapper;

import dao.StudentClassDAO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StudentClassMapper_sz {
    // student_class 테이블에서 학생 아이디에 해당하는 필드를 모두 가져오는 SELECT 쿼리문을 실행한다.
    List<StudentClassDAO> existClass(@Param("student_id") int student_id);
}
