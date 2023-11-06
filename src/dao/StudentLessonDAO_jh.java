package dao;

import dto.StudentLessonDTO_jh;
import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.StudentLessonMapper_jh;

import java.util.List;
import java.util.Map;

public class StudentLessonDAO_jh {

    private SqlSession sqlSession;
    private StudentLessonMapper_jh mapper;

    public List<Map<String, Object>> getStudentCurrentlyTakingLessonInformationForPrint(int studentIdx,
                                                                                 List<Integer> lessonIdxList) {
        sqlSession = MyBatisMapperFactory.getSqlSession();
        mapper = sqlSession.getMapper(StudentLessonMapper_jh.class);

        List<Map<String, Object>> result =
                mapper.getStudentCurrentlyTakingLessonInformationForPrint(studentIdx, lessonIdxList);
        sqlSession.close();
        return result;
    }

    StudentLessonDTO_jh getStudentLessonInformation(int studentIdx, int userInputLessonIdx) {
        sqlSession = MyBatisMapperFactory.getSqlSession();
        mapper.getStudentLessonInformation(studentIdx, userInputLessonIdx);
        return null;
    }
}
