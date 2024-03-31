package repository.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentClassMapper_jh {

    List<Integer> getAllMyClass(@Param("studentIdx") int studentIdx);
}
