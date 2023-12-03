package util;

public class BoardPage {
    public static String pagingStr(int totalCount, int pageSize, int blockPage,
                                   int pageNum, String searchField, String searchWord, String addOther, String reqUrl) {
        String pagingStr = "";

        // 단계 3 : 전체 페이지 수 계산
        int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
        System.out.println(totalPages);

        // 단계 4 : '이전 페이지 블록 바로가기' 출력
        int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
        if (pageTemp != 1) {
            pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
            pagingStr += "&nbsp;";
            if(searchField != null){
                pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
                        + "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord + "'>[이전 블록]</a>";
            } else{
                pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
                        + "'>[이전 블록]</a>";
            }
        }

        // 단계 5 : 각 페이지 번호 출력
        int blockCount = 1;
        while (blockCount <= blockPage && pageTemp <= totalPages) {
            pagingStr += "<li class='xans-record-'>"; //css 적용을 위한 li 태그
            if (pageTemp == pageNum) {
                // 현재 페이지는 링크를 걸지 않음
                pagingStr += "&nbsp;<a href='#'  class='this'>" + pageTemp + "</a>&nbsp;";
            } else if(searchField != null){
                pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp
                        + "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord + addOther + "'  class='other'>" + pageTemp + "</a>&nbsp;";
            } else {
                pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + addOther
                        + "' class='other'>" + pageTemp + "</a>&nbsp;";
            }
            pagingStr += "</li>"; //css 적용을 위한 li 태그
            pageTemp++;
            blockCount++;

        }

        // 단계 6 : '다음 페이지 블록 바로가기' 출력
        if (pageTemp <= totalPages) {
            if(searchField != null){
                pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
                        + "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord
                        + "' class='other'>[다음 블록]</a>";
                pagingStr += "&nbsp;";
                pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
                        + "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord
                        + "'>[마지막 페이지]</a>";
            }else{
                pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
                        + "' class='other'>[다음 블록]</a>";
                pagingStr += "&nbsp;";
                pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
                        + "'>[마지막 페이지]</a>";
            }

        }
        return pagingStr;
    }
}