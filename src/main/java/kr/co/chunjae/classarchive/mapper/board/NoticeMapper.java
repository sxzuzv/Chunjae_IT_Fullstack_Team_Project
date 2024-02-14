package kr.co.chunjae.classarchive.mapper.board;

import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.util.page.PageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Mapper
public interface NoticeMapper {
    public List<NoticeDTO> listAll();  // 전체 조회

    public List<NoticeDTO> paging(Map<String, Integer> pagingParams);  // 전체 조회 (페이징)

    public int noticeCount();  // 공지글 수 카운트

    public NoticeDTO detail(Long id);  // 상세 조회

    public void noticeWrite(NoticeDTO noticeDTO);  // 글 작성

    public void updateNotice(NoticeDTO noticeDTO);  // 글 수정

    List<NoticeDTO> searchAndPaging(@Param("searchOption") String searchOption,
                                    @Param("searchWord") String searchWord,
                                    @Param("pagingParams") Map<String, Integer> pagingParams,
                                    @Param("startDate") LocalDate startDate,
                                    @Param("endDate") LocalDate endDate);

    int searchNoticeCount(@Param("searchOption") String searchOption,
                          @Param("searchWord") String searchWord,
                          @Param("startDate") LocalDate startDate,
                          @Param("endDate") LocalDate endDate);

    void delete(Long id);
}
