package repository.mapper;

import java.util.Map;

public interface StudentLessonMapper {

    int timeSpentPerClassByStudentIdx(Map<String, Object> param);
}
