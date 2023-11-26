package dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class ProductDTO {
    private int prdId;

    private int brdId;

    private String price;

    private String status;

    private String dealAddress;

    private String prdType;

    private String buyerId;
}
