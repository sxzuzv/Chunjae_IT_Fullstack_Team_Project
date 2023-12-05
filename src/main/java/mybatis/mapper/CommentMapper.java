package mybatis.mapper;

import dto.BoardCommentDTO;
import dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommentMapper {
    //신수진


    //최경락


    //최영주
    int insertWriteComment(BoardCommentDTO dto);

    List<BoardCommentDTO> selectCommentList(Map<String, Object> map);

    int deleteComment(String comId);

    int updateComment(BoardCommentDTO dto);


    //최재혁

}
