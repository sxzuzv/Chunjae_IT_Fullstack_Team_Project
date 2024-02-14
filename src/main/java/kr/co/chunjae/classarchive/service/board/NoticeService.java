package kr.co.chunjae.classarchive.service.board;

import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.mapper.board.NoticeMapper;
import kr.co.chunjae.classarchive.util.page.PageCalc;
import kr.co.chunjae.classarchive.util.page.PageDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeMapper noticeMapper;
    private final PageCalc pageCalc;

    // 전체 조회
    public List<NoticeDTO> listAll() {
        return noticeMapper.listAll();
    }

    /**
     * 전체 조회 (페이징)
     */
    // 특정 페이지에 해당하는 게시글 목록만 출력
    public List<NoticeDTO> paging(int page) {

        Map<String, Integer> pagingParams = pageCalc.pagingList(page);
        return noticeMapper.paging(pagingParams);

    }

    // 전체 게시글 수
    public int noticeCount() {
        return noticeMapper.noticeCount();  // 전체 게시글 수
    }

    // 전체 게시글 수에 따른 전체 페이지 수 계산
    public PageDTO pagingParam(int page) {

        int noticeCount = noticeMapper.noticeCount();
        return pageCalc.pagingParam(page, noticeCount);

    }

    // 상세 조회
    public NoticeDTO detail(Long id) {
        return noticeMapper.detail(id);
    }

    // 글 작성
    public void noticeWrite(NoticeDTO noticeDTO) {
        noticeMapper.noticeWrite(noticeDTO);
    }

    // 글 수정
    public void updateNotice(NoticeDTO noticeDTO) {
        noticeMapper.updateNotice(noticeDTO);
    }

    // 검색 필터
    public List<NoticeDTO> searchAndPaging(String searchOption, String searchWord, int page, LocalDate startDate, LocalDate endDate) {

        Map<String, Integer> pagingParams = pageCalc.pagingList(page);

            return noticeMapper.searchAndPaging(searchOption, searchWord, pagingParams, startDate, endDate);

    }

    public PageDTO searchPagingParam(int page, String searchOption, String searchWord, LocalDate startDate, LocalDate endDate) {

        int noticeCount = noticeMapper.searchNoticeCount(searchOption, searchWord, startDate, endDate);

        return pageCalc.pagingParam(page, noticeCount);
    }

    public int searchNoticeCount(String searchOption, String searchWord, LocalDate startDate, LocalDate endDate) {

            return noticeMapper.searchNoticeCount(searchOption, searchWord, startDate, endDate);

    }

    // 논리적 삭제
    public void delete(Long id) {
        noticeMapper.delete(id);
    }

}
