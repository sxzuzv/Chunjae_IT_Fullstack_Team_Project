package repository.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentLessonMapper_jh {

    int timeSpentPerClassByStudentIdx(Map<String, Object> param);

    List<Map<String, Object>> getStudentTakingLessonInformationForPrint(@Param("studentIdx") int studentIdx,
                                                   @Param("lessonIdxList") List<Integer> lessonIdxList);
}
