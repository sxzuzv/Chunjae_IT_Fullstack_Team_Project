package service;

import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.LessonMapper_jh;

import java.util.List;

public class LessonService_jh {

    public List<Integer> getAllLessonIdxListByClassIdx(int classIdx) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();
        LessonMapper_jh lessonMapper_jh = sqlSession.getMapper(LessonMapper_jh.class);

        List<Integer> allLessonIdxByClassIdx = lessonMapper_jh.getAllLessonIdxByClassIdx(classIdx);
        return allLessonIdxByClassIdx;
    }
}
