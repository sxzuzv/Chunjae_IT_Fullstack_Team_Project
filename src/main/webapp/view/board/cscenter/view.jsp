<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TEACHER MARKET</title>
</head>
<header>
    <jsp:include page="/view/common/header.jsp"></jsp:include>
    <link rel="stylesheet" href="${contextPath}/css/teachercommunity/view.css" />
</header>
<body>
<h2>
    내 문의 글 상세 보기
</h2>
<table class="detailView" border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>작성자</td> <td colspan="3">${ dto.userId }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ dto.regDate }</td>
        <td>문의유형</td> <td><c:choose>
        <c:when test="${dto.cateSub eq 1}"> 문의사항 </c:when>
        <c:when test="${dto.cateSub eq 2}"> 신고 </c:when>
        </c:choose></td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">
            ${ dto.content }
            <c:if test="${ not empty dto.ofile and isImage eq true }">
                <br><img src="../Uploads/${ dto.sfile }" style="max-width:100%;"/>
            </c:if>
        </td>
    </tr>

    <!-- 첨부파일 -->
    <tr>
        <td>첨부 파일</td>
        <td>
            <c:if test="${ not empty dto.ofile }">
                ${ dto.ofile }
                <%--                <a href="/teachercommunity/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.brdId }">--%>
                <%--                  [다운로드]--%>
                <%--                </a>--%>
            </c:if>
        </td>
    </tr>
</table>

<!-- 하단 메뉴(버튼) -->
<%--  <tr>--%>
<%--    <td colspan="4" align="center">--%>
<br />
<div>
    <c:set var="userId" value="${ userId }" />
    <c:set var="dtouserId" value="${ dto.userId }" />
    <c:set var="cateSub" value="${ cateSub }" />
<%--    <c:set var="cateSub" value="${param.cateSub}" />
    <c:set var="userId" value="${sessionScope.userId}" />--%>
    <c:choose>
        <c:when test="${ dtouserId eq userId }">
            <button class="btnedit" type="button" onclick="location.href='${contextPath}/cscenter/pass.do?mode=edit&brdId=${ param.brdId }';">
                수정하기
            </button>
            <button class="btndel" type="button" onclick="location.href='${contextPath}/cscenter/pass.do?mode=delete&brdId=${ param.brdId }';">
                삭제하기
            </button>
            <button class="btnlist" type="button" onclick="goBack()">
                목록 바로가기
            </button>

            <script>
                function goBack() {
                    history.go(-1);
                }
            </script>
        </c:when>
        <c:otherwise>

            <button class="btnlist" type="button" onclick="goBack()">
                목록 바로가기
            </button>

            <script>
                function goBack() {
                    history.go(-1);
                }
            </script>
        </c:otherwise>
    </c:choose>
    <%--    </td>--%>
    <%--  </tr>--%>

</div>
<jsp:include page="/view/board/cscenter/comment.jsp"></jsp:include>
</body>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</html>

