package dao;

import java.time.LocalDateTime;

public class StudentDAO {

    private int studentIdx;
    private String studentEmail;
    private String studentNickname;
    private String studentPassword;
    private LocalDateTime studentJoined;
    private int studentPoints;

    public StudentDAO(String studentEmail, String studentPassword, String studentNickname) {
        this.studentEmail = studentEmail;
        this.studentPassword = studentPassword;
        this.studentNickname = studentNickname;
    }

    public StudentDAO(String studentEmail, String studentPassword) {
        this.studentEmail = studentEmail;
        this.studentPassword = studentPassword;
    }
}
