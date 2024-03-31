package mybatis.mapper;

import dto.ReportCommentDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReportCommentMapper {
    //신수진


    //최경락


    //최영주
    int insertWriteComment(ReportCommentDTO dto);

    List<ReportCommentDTO> selectCommentList(Map<String, Object> map);

    int deleteComment(String comId);

    int updateComment(ReportCommentDTO dto);


    //최재혁



}
