package repository.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LessonMapper {
    List<Integer> getAllLessonIdxByClassIdx(@Param("classIdx") int classIdx);
}
