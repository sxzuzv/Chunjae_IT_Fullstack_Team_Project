package repository.mapper;

import dao.AnswerDAO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AnswerMapper_jh {

    List<AnswerDAO> getAllAnswer();
}
