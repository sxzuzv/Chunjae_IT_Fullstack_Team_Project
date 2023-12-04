package mybatis.mapper;

import dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapper {
    //신수진
    int tcselectCount(Map<String, Object> map);
    List<BoardDTO> tcselectListPage(Map<String, Object> map);
    List<BoardDTO> tcselectListPageWithPaging(Map<String, Object> map);
    BoardDTO tcselectView(String idx);
    List<BoardDTO> tcselectTopList(Map<String, Object> map);
    int tcUpdatePost(BoardDTO dto);
    int tcinsertWrite(BoardDTO dto);

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
    int marketUpdatePostPdt(BoardDTO dto);

    int confirmPassword(Map<String, String> map);

    //최재혁

}
