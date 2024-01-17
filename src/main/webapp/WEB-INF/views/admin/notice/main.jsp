<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <title>공지사항</title>
</head>
<body>
    <div>
        <h1>공지사항</h1>
    </div>
    <br><br>

    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:choose>
            <c:when test="${empty noticeList}">
                <tr>
                    <td colspan=5 class="fixed">
                        <strong>작성된 게시글이 없습니다.</strong>
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="noticeList" items="${noticeList}">
                    <tr>
                        <td width="20%" align="center">
                            <a href="${pageContext}/admin/notice/detailNotice?brd_id=${noticeList.brdId}">
                                <strong>${noticeList.brdId}</strong>
                            </a>
                        </td>
                        <td width="40%">
                            <strong>${noticeList.title}</strong>
                        </td>
                        <td width="20%" align="center">
                            <strong>${noticeList.memberId}</strong>
                        </td>
                        <td width="10%" align="center">
                            <strong>${noticeList.regDate}</strong>
                        </td>
                        <td width="20%" align="center">
                            <strong>${noticeList.viewCnt}</strong>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <div class="clear" />
    </table>
    <%-- 페이지 번호 표시 --%>
    <div>
        <c:choose>
            <%-- 현재 페이지가 첫 번째 페이지면 [이전]을 텍스트 처리한다. ([이전]은 링크되지 않는 단순 텍스트이다.) --%>
            <c:when test="${paging.page <= 1}">
                <span>[이전]</span>
            </c:when>
            <%-- 첫 번째 페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지에서 1만큼 작은 페이지를 요청한다. --%>
            <c:otherwise>
                <a href="${contextPath}/admin/notice/noticeList.do?page=${paging.page-1}">[이전]</a>
            </c:otherwise>
        </c:choose>

        <%--  for (int i = startPage; i <= endPage; i++) --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이도록 처리한다. (텍스트이므로 클릭이 불가하다.) --%>
                <c:when test="${i eq paging.page}">
                    <span>${i}</span>
                </c:when>

                <%-- 요청한 페이지가 아닌 번호의 경우, 클릭 시 해당하는 페이지로 이동 가능하도록 링크 처리한다. --%>
                <c:otherwise>
                    <a href="${contextPath}/admin/notice/noticeList.do?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <%-- 현재 페이지가 마지막 페이지(표현 가능 최대 페이지)이면 [다음]을 텍스트 처리한다. ([다음]은 링크되지 않는 단순 텍스트이다.) --%>
            <%-- 현재 페이지 >= 전체 페이지 --%>
            <c:when test="${paging.page>=paging.maxPage}">
                <span>[다음]</span>
            </c:when>
            <%-- 현재 페이지가 전체 페이지 보다 작을 경우, [다음]을 클릭할 시 현재 페이지에서 1만큼 큰 페이지를 요청한다. --%>
            <c:otherwise>
                <a href="${contextPath}/admin/notice/noticeList.do?page=${paging.page+1}">[다음]</a>
            </c:otherwise>
        </c:choose>
    </div>
    <div>
        <a href="${contextPath}/admin/notice/noticeWrite.do"><input type="button" value="글쓰기"></a>
    </div>
</body>
</html>
