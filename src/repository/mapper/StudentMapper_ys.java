package repository.mapper;

import dto.StudentDTO_ys;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface StudentMapper_ys {
    void studentSignUp(StudentDTO_ys studentDTO);
    int studentLogin(@Param("studentEmail") String studentEmail,
                     @Param("studentPassword")String studentPassword);
    int studentEmailDuplicationCheck(String studentEmail);
    int studentNicknameDuplicationCheck(String studentNickname);
    StudentDTO_ys getLoginStudent(String studentEmail);
}
