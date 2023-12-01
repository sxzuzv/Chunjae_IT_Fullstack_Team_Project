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
    int marketSelectCount(Map<String, Object> map);

    List<BoardDTO> marketSelectListPage(Map<String, Object> map);

    int marketInsertWrite(BoardDTO dto);
    int marketInsertWritePdt(BoardDTO dto);

    BoardDTO marketSelectView(String brdId);

    int updateVisitCount(String brdId);

    int deletePost(String brdId);
    int deletePdtPost(String brdId);


    int marketUpdatePost(BoardDTO dto);

    int confirmPassword(Map<String, String> map);

    //최재혁

}
