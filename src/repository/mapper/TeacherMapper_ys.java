package repository.mapper;

import dao.TeacherDAO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TeacherMapper_ys {
    void teacherSignUp(TeacherDAO teacherDAO);
    int teacherLogin(@Param("teacherEmail") String teacherEmail,
                     @Param("teacherPassword")String teacherPassword);
    int teacherEmailDuplicationCheck(String teacherEmail);
    TeacherDAO getLoginTeacher(String teacherEmail);
}
