package kr.co.chunjae.classarchive;

import kr.co.chunjae.classarchive.dto.example.ExampleDTO;
import kr.co.chunjae.classarchive.service.ExampleService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ClassArchiveApplicationTests {

    @Autowired
    ExampleService exampleService;

    @Test
    void listAll() {
        List<ExampleDTO> list = exampleService.listAll();
        for (ExampleDTO exampleDTO : list) {
            System.out.println("============================================================");
            System.out.println("Example : " + exampleDTO.toString());
            System.out.println("============================================================");
        }
    }
}
