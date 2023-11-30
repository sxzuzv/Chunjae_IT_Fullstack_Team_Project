package mybatis.mapper;

import dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapper {
    //신수진


    //최경락


    //최영주
    int selectCount(Map<String, Object> map);

    List<BoardDTO> selectListPage(Map<String, Object> map);

    int insertWrite(BoardDTO dto);
    int insertWritePdt(BoardDTO dto);

    List<BoardDTO> selectListPageWithPaging(Map<String, Object> map);

    BoardDTO selectView(String idx);

    int updateVisitCount(String idx);

    int downCountPlus(String idx);

    int confirmPassword(Map<String, String> map);

    int deletePost(String idx);

    int updatePost(BoardDTO dto);

    //최재혁

}
