package mybatis.mapper;


import dto.BoardDTO;
import dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper {
    //신수진


    //최경락
    // 5(고객문의), 6(신고) 카테고리 글 만 불러오기
    List<BoardDTO> selectBoardCate(HashMap<String, String> categories);

    // 모든 사용자를 누적 신고 횟수(reportCnt) 기준으로 내림차순으로 정렬
    List<UserDTO> selectUser();

    // 아이디로 사용자 검색
    List<UserDTO> selectUserById(String userId);

    // 사용자의 가입 승인 상태를 변경하는 메서드
    void approveUser(String userId);

    // 댓글 수정
    void updateComment(Map<String, Object> commentInfo);

    // 댓글 삭제
    void deleteComment(String comId);

    //최영주


    //최재혁

}
