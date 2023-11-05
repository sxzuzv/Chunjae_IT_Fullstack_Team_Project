package dao;

import java.time.LocalDateTime;

public class TeacherDAO {

    private int teacherIdx;
    private String teacherEmail;
    private String teacherName;
    private String teacherPassword;
    private LocalDateTime teacherJoined;
    private int teacherPoints;
    private int classCnt;

    public TeacherDAO(String teacherEmail, String teacherPassword, String teacherName) {
        this.teacherEmail = teacherEmail;
        this.teacherName = teacherName;
        this.teacherPassword = teacherPassword;
    }
}
