package dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;


@Getter
@Setter
@ToString
public class UserDTO {
    private int userIdx;

    private String userId;

    private String userPwd;

    private String userName;

    private String user_nick;

    private String userEmail;

    private String userCp;

    private String userAddr;

    private String userDaddr;

    private String userSchool;

    private LocalDate lastLogin;

    private LocalDate joinDate;

    private String userGrade;

    private String userStatus;

    private int reportCnt;
}
