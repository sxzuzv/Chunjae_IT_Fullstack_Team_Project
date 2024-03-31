package repository.mapper;

import dao.TeacherDAO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TeacherMapper_sz {
    // 수업 목록 출력에 사용, 선생님 아이디(idx)에 해당하는 선생님 이름을 가져온다.
    // MyBatis에서 제공하는 Mapper를 사용하므로, 반환값은 사용하고자 하는 DAO로 맞춰준다. (반환값 디폴트가 DAO)
    TeacherDAO teacherName(@Param("teacher_idx") int teacher_idx);
}
