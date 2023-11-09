package repository.mapper;

import dao.ReviewDAO;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface ReviewMapper_he {

    // 수강평 하나를 테이블에 추가하는 메소드
    public void insertReview (ReviewDAO reviewDAO);

    int alreadyInsertedReview(@Param("studentIdx") int studentIdx,
                              @Param("classIdx") int classIdx);
}
