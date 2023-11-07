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

    public TeacherDAO() {
    }

    public int getTeacherIdx() {
        return teacherIdx;
    }

    public void setTeacherIdx(int teacherIdx) {
        this.teacherIdx = teacherIdx;
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    public LocalDateTime getTeacherJoined() {
        return teacherJoined;
    }

    public void setTeacherJoined(LocalDateTime teacherJoined) {
        this.teacherJoined = teacherJoined;
    }

    public int getTeacherPoints() {
        return teacherPoints;
    }

    public void setTeacherPoints(int teacherPoints) {
        this.teacherPoints = teacherPoints;
    }

    public int getClassCnt() {
        return classCnt;
    }

    public void setClassCnt(int classCnt) {
        this.classCnt = classCnt;
    }
}
