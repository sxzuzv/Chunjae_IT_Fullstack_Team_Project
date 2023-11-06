package repository.mapper;

import dao.StudentLessonDAO_jh;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentLessonMapper_jh {

    Integer timeSpentPerClassByStudentIdx(Map<String, Object> param);

    List<Map<String, Object>> getStudentCurrentlyTakingLessonInformationForPrint(@Param("studentIdx") int studentIdx,
                                                                 @Param("lessonIdxList") List<Integer> lessonIdxList);
    StudentLessonDAO_jh getStudentLessonInformation(@Param("studentIdx") int studentIdx,
                                                    @Param("lessonIdx") int lessonIdx);

    int updateStudentLessonProgressInformation(@Param("studentIdx") int studentIdx,
                                               @Param("lessonIdx") int userInputLessonIdx,
                                               @Param("studyTime") int tempStudentStudyTime);

    int insertStudentLessonProgressInformation(@Param("studentIdx") int studentIdx,
                                               @Param("lessonIdx") int userInputLessonIdx,
                                               @Param("studyTime") int tempStudentStudyTime);
}
