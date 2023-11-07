package repository.mapper;

import dao.AnswerDAO;
import dao.ClassDAO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClassMapper_sz {
    // 수업 목록을 조회하는 SELECT 쿼리를 호출한다.
    // 여러 개의 수업을 List에 담아 반환한다.
    List<ClassDAO> viewAllClass();
}
