package service;

import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.ClassMapper_jh;
import repository.mapper.LessonMapper_jh;
import repository.mapper.StudentClassMapper_jh;
import repository.mapper.StudentLessonMapper_jh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class StudentClassService_jh {

    public Map<Integer, Map<String, Object>> printListForStudentMainMenuMyClass(int studentIdx) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession();

        // 학생이 수강하고 있는 모든 Class의 PK를 Integer 리스트로 받아오기
        StudentClassMapper_jh studentClassMapperJh = sqlSession.getMapper(StudentClassMapper_jh.class);
        List<Integer> allMyClassIdxList = studentClassMapperJh.getAllMyClass(studentIdx);

        Map<Integer, Map<String, Object>> resultMap = new HashMap<>();
        allMyClassIdxList.forEach(e -> resultMap.put(e, new HashMap<>()));

        // 각 수업 당 총 시간
        ClassMapper_jh classMapperJh = sqlSession.getMapper(ClassMapper_jh.class);
        List<Map<Integer, Integer>> totalTimePerClassList = classMapperJh.getTotalTimePerClass(allMyClassIdxList);
        Map<Integer, Integer> totalTimePerClassMap = new HashMap<>();
        for (Map<Integer, Integer> integerIntegerMap : totalTimePerClassList) {
            int classIdx = integerIntegerMap.get("class_idx");
            int seconds = integerIntegerMap.get("seconds");
            totalTimePerClassMap.put(classIdx, seconds);
        }

        // 각 수업에 대한 학습 아이디 갖고오기
        Map<Integer, List<Integer>> lessonIdxPerClassMap = new HashMap<>();
        LessonMapper_jh lessonMapperJh = sqlSession.getMapper(LessonMapper_jh.class);
        for (int classIdx : allMyClassIdxList) {
            List<Integer> lessonIdxList = lessonMapperJh.getAllLessonIdxByClassIdx(classIdx);
            lessonIdxPerClassMap.put(classIdx, lessonIdxList);
        }

        // 각 수업별로 학생이 수강한 총 시간 구하기
        Set<Integer> keySet = lessonIdxPerClassMap.keySet();
        Map<Integer, Integer> timeSpentByClassMap = new HashMap<>();
        StudentLessonMapper_jh studentLessonMapperJh = sqlSession.getMapper(StudentLessonMapper_jh.class);
        for (int classIdx : keySet) {
            Map<String, Object> param = new HashMap<>();
            param.put("studentIdx", studentIdx);
            param.put("lessonIdList", lessonIdxPerClassMap.get(classIdx));
            int timeSpent = studentLessonMapperJh.timeSpentPerClassByStudentIdx(param);
            timeSpentByClassMap.put(classIdx, timeSpent);
        }

        // 각 강의에 대한 선생님 가져오기
        List<Map<String, Object>> teacherNameByClass = classMapperJh.getTeacherNamePerClass(allMyClassIdxList);
        Map<Integer, String> teacherNameByClassMap = new HashMap<>();
        for (Map<String, Object> nameByClass : teacherNameByClass) {
            int classIdx = (Integer) nameByClass.get("class_idx");
            String teacherName = (String) nameByClass.get("teacher_name");
            teacherNameByClassMap.put(classIdx, teacherName);
        }
        System.out.println();

        // 각 강의에 대한 수업제목 가져오기
        List<Map<String, Object>> classNameList = classMapperJh.getClassName(allMyClassIdxList);
        Map<Integer, String> classNameMap = new HashMap<>();
        for (Map<String, Object> stringObjectMap : classNameList) {
            int classIdx = (Integer) stringObjectMap.get("class_idx");
            String className = (String) stringObjectMap.get("class_name");
            classNameMap.put(classIdx, className);
        }
        for (int classIdx : allMyClassIdxList) {
            Map<String, Object> tempMap = new HashMap<>();
            tempMap.put("className", classNameMap.get(classIdx));
            tempMap.put("teacherName", teacherNameByClassMap.get(classIdx));
            tempMap.put("status", ((((double) timeSpentByClassMap.get(classIdx)) / totalTimePerClassMap.get(classIdx)) * 100));
            resultMap.put(classIdx, tempMap);
        }
        return resultMap;
    }
}
