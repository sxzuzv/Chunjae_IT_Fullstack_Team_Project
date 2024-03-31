package kr.co.chunjae.classarchive.dto.example;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * Mapper Interface 활용 예제 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class ExampleDTO {
     private String name;
     private String date;
}
