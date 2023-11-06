package service;

import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.LessonMapper_jh;

import java.util.List;
import java.util.Map;

public class LessonService_jh {

    private SqlSession sqlSession;
    private LessonMapper_jh lessonMapper;

    public List<Integer> getAllLessonIdxListByClassIdx(int classIdx) {
        sqlSession = MyBatisMapperFactory.getSqlSession();
        lessonMapper = sqlSession.getMapper(LessonMapper_jh.class);

        List<Integer> allLessonIdxByClassIdx = lessonMapper.getAllLessonIdxByClassIdx(classIdx);
        sqlSession.close();
        return allLessonIdxByClassIdx;
    }

    public List<Map<String, Object>> getStudentNotCurrentlyTakingLessonIdxInformation(int classIdx,
                                                                          List<Integer> currentlyTakingLessonIdxList) {
        sqlSession = MyBatisMapperFactory.getSqlSession();
        lessonMapper = sqlSession.getMapper(LessonMapper_jh.class);

        List<Map<String, Object>> result =
                lessonMapper.getStudentNotCurrentlyTakingLessonIdxInformation(classIdx, currentlyTakingLessonIdxList);
        sqlSession.close();
        return result;
    }
}
