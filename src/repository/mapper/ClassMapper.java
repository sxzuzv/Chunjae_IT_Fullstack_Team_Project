package repository.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ClassMapper {
    List<Map<Integer, Integer>> getTotalTimePerClass(@Param("classIdxList") List<Integer> classIdxList);

    List<Map<String, Object>> getTeacherNamePerClass(@Param("allMyClassIdxList") List<Integer> allMyClassIdxList);

    List<Map<String, Object>> getClassName(@Param("allMyClassIdxList") List<Integer> allMyClassIdxList);
}
