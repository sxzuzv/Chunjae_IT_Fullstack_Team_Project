package kr.co.chunjae.classarchive.mapper.example;

import kr.co.chunjae.classarchive.dto.example.ExampleDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExampleMapper {
    public List<ExampleDTO> listAll();
}
