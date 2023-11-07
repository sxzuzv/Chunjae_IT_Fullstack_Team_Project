package repository.mapper;

import dto.TeacherDTO_ys;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TeacherMapper_ys {
    void teacherSignUp(TeacherDTO_ys teacherDAO);
    int teacherLogin(@Param("teacherEmail") String teacherEmail,
                     @Param("teacherPassword")String teacherPassword);
    int teacherEmailDuplicationCheck(String teacherEmail);
    TeacherDTO_ys getLoginTeacher(String teacherEmail);
}
