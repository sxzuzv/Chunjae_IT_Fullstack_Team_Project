package repository.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PurchaseClassMapper_sz {
     // student_class 테이블에 학생 아이디, 수업 아이디를 입력하는 INSERT 쿼리문을 실행한다.
     public void purchaseClass(@Param("student_id") int student_id, @Param("class_id") int class_id);

     public Double getRatingByClassIdx(@Param("classIdx") int classIdx);
}
