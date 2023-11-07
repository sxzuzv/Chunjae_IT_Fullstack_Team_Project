package dto;

import java.time.LocalDateTime;

public class StudentDTO_ys {

    private int studentIdx;
    private String studentEmail;
    private String studentNickname;
    private String studentPassword;
    private LocalDateTime studentJoined;
    private int studentPoints;

    public StudentDTO_ys(String studentEmail, String studentPassword, String studentNickname) {
        this.studentEmail = studentEmail;
        this.studentPassword = studentPassword;
        this.studentNickname = studentNickname;
    }

    public StudentDTO_ys(String studentEmail, String studentPassword) {
        this.studentEmail = studentEmail;
        this.studentPassword = studentPassword;
    }

    public StudentDTO_ys() {
    }

    public int getStudentIdx() {
        return studentIdx;
    }

    public void setStudentIdx(int studentIdx) {
        this.studentIdx = studentIdx;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getStudentNickname() {
        return studentNickname;
    }

    public void setStudentNickname(String studentNickname) {
        this.studentNickname = studentNickname;
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    public LocalDateTime getStudentJoined() {
        return studentJoined;
    }

    public void setStudentJoined(LocalDateTime studentJoined) {
        this.studentJoined = studentJoined;
    }

    public int getStudentPoints() {
        return studentPoints;
    }

    public void setStudentPoints(int studentPoints) {
        this.studentPoints = studentPoints;
    }
}
