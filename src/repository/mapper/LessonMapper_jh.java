package repository.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface LessonMapper_jh {
    List<Integer> getAllLessonIdxByClassIdx(@Param("classIdx") int classIdx);

    List<Map<String, Object>> getStudentNotCurrentlyTakingLessonIdxInformation(@Param("classIdx") int classIdx,
                                                   @Param("lessonIdxList") List<Integer> currentlyTakingLessonIdxList);
}
