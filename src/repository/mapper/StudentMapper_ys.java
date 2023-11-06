package repository.mapper;

import dao.StudentDAO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface StudentMapper_ys {
    void studentSignUp(StudentDAO studentDAO);
    int studentLogin(@Param("studentEmail") String studentEmail,
                     @Param("studentPassword")String studentPassword);
    int studentEmailDuplicationCheck(String studentEmail);
    int studentNicknameDuplicationCheck(String studentNickname);
    StudentDAO getLoginStudent(String studentEmail);
}
