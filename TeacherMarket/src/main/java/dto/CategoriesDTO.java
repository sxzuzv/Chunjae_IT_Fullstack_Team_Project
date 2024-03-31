package dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CategoriesDTO {
    private int cateNo;
    private int cateMain;
    private int cateSub;
    private String cateName;
    private String userGrade;
}
