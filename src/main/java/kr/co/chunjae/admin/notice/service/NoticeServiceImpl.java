package kr.co.chunjae.admin.notice.service;

import kr.co.chunjae.admin.notice.dao.NoticeDAO;
import kr.co.chunjae.admin.notice.vo.NoticeVO;
import kr.co.chunjae.page.pageVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeDAO noticeDAO;

    @Override
    public void noticeWrite(NoticeVO noticeVO) {
        noticeDAO.noticeWrite(noticeVO);
    }

    // 페이징 : 특정 페이지에 해당하는 게시글 목록만을 출력한다.
    int pageLimit = 10; // 한 페이지당 보여주는 글 개수
    int blockLimit = 3; // 페이지 하단에 보여주는 페이지 번호의 개수

    public List<NoticeVO> paging(int page) {
        /*
        한 페이지당 보여주는 글 개수 : 10개
        1 page => INDEX 0부터 시작
        2 page => INDEX 10부터 시작
        3 page => INDEX 20부터 시작
         */

        // INDEX의 시작(0)을 고려하여, 받아온 페이지 번호에서 1을 빼준다.
        int pagingStart = (page - 1) * pageLimit;

        Map<String, Integer> pagingParams = new HashMap<>();

        // 게시글 번호를 내림차순하여, 요청된 페이지에서 출력할 게시글 범위를 지정한다.
        //  예시) start = 0, pageLimit = 10일 경우 게시글 번호 15~5가 출력된다.
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);

        // 범위에 해당하는 게시글 데이터를 추출하여 저장한다.
        List<NoticeVO> noticePageList = noticeDAO.paging(pagingParams);

        return noticePageList;
    }

    public pageVO pagingParam(int page) {
        // 전체 게시글 개수를 저장한다.
        int noticeCount = noticeDAO.noticeCount();

        // 1. 전체 게시글 개수에 따른 전체 페이지 개수를 계산한다.
        // '전체 게시글 개수 / 한 페이지당 출력할 게시글 개수(10개)'를 계산 후, 무조건 반올림(ceil)한다.
        // 예시) 전체 게시글 개수가 21개일 시, 총 페이지 개수는 21/10을 반올림한 3개가 된다.
        int maxPage = (int) Math.ceil((double) noticeCount / pageLimit);

        // 2. 현재 페이지 기준 시작 페이지 값(하단의 번호)을 계산한다. (1, 4, 7, 10 ...)
        // blockLimit : 페이지 하단에 보여줄 페이지 번호 개수 (한 페이지당 3개의 페이지 번호를 보여준다.)
        // 매개변수로 받아온 page : 사용자가 선택한 page
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;

        // 3. 현재 페이지 기준 마지막 페이지 값(하단의 번호)를 계산한다. (3, 6, 9, 12 ...)
        int endPage = startPage + blockLimit - 1;

        if (endPage > maxPage) { // 마지막 페이지 번호가 전체 페이지 개수보다 클 경우
            endPage = maxPage; // 최대 페이지 개수를 마지막 페이지로 번호로 표시한다.
        }

        // pageVO에 계산한 값들을 저장한다.
        pageVO pageVO = new pageVO();
        pageVO.setPage(page);
        pageVO.setMaxPage(maxPage);
        pageVO.setStartPage(startPage);
        pageVO.setEndPage(endPage);

        return pageVO;
    }
}
