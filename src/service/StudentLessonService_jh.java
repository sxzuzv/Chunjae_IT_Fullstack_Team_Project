package service;

import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.StudentLessonMapper_jh;

import java.util.List;
import java.util.Map;

public class StudentLessonService_jh {
    public List<Map<String, Object>> getStudentTakingLessonInformationForPrint(int studentIdx, List<Integer> lessonIdxList) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();
        StudentLessonMapper_jh mapper = sqlSession.getMapper(StudentLessonMapper_jh.class);
        List<Map<String, Object>> result =
                mapper.getStudentTakingLessonInformationForPrint(studentIdx, lessonIdxList);
        return result;
    }
}
