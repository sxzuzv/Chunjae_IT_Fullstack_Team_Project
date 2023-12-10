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
    내 신고 글 상세 보기
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
        <td>신고한 게시물번호</td> <td>${ dto.brdId }</td>

    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ dto.reportTitle }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">
            ${ dto.reportContent }
        </td>
    </tr>

</table>

<br />
<div style="text-align: center;"> <!-- Wrap the content in a div and align it to the right -->
    <c:set var="userId" value="${ userId }" />
    <c:set var="dtouserId" value="${ dto.userId }" />

    <c:choose>
        <c:when test="${ dtouserId eq userId }">
            <button class="btnlist" type="button" onclick="goBack()">
                목록 바로가기
            </button>

            <script>
                function goBack() {
                    history.go(-1);
                }
            </script>
        </c:when>
    </c:choose>
</div>
<jsp:include page="/view/board/cscenter/comment.jsp"></jsp:include>
</body>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</html>


