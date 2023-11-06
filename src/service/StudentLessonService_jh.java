package service;

import dao.StudentLessonDAO_jh;
import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.StudentLessonMapper_jh;

import java.util.List;
import java.util.Map;

public class StudentLessonService_jh {
    public List<Map<String, Object>> getStudentCurrentlyTakingLessonInformationForPrint(int studentIdx,
                                                                                        List<Integer> lessonIdxList) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();
        StudentLessonMapper_jh mapper = sqlSession.getMapper(StudentLessonMapper_jh.class);
        List<Map<String, Object>> result =
                mapper.getStudentCurrentlyTakingLessonInformationForPrint(studentIdx, lessonIdxList);
        return result;
    }

    public boolean saveStudentLessonProgressUpdate(int studentIdx, int userInputLessonIdx, int tempStudentStudyTime) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();
        StudentLessonMapper_jh studentLessonMapper_jh = sqlSession.getMapper(StudentLessonMapper_jh.class);
        StudentLessonDAO_jh studentLessonInformation
                                = studentLessonMapper_jh.getStudentLessonInformation(studentIdx, userInputLessonIdx);
        int result = -1;
        if (studentLessonInformation != null) {
            // 이미 DB에 해당 사용자 idx와 lesson idx로 저장되어 있는 경우
            // update query
            result = studentLessonMapper_jh.updateStudentLessonProgressInformation(studentIdx, userInputLessonIdx,
                                                                                                tempStudentStudyTime);
        } else {
            // 아직 한 번도 학습하지 않았는데, 시청 기록을 새롭게 저장하는 경우
            result = studentLessonMapper_jh.insertStudentLessonProgressInformation(studentIdx, userInputLessonIdx,
                                                                                                tempStudentStudyTime);
        }
        if (result == 1) {
            sqlSession.commit(true);
            return true;
        } else {
            return false;
        }
    }
}
