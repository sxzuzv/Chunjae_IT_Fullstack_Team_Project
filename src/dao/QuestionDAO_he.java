package dao;

import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class QuestionDAO_he {

    private int questionIdx;
    private String title;
    private String contents;
    private int studentId;
    private int classId;
    private LocalDateTime questionDate;
}
