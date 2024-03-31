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
    <jsp:include page="/view/common/headerAdmin.jsp"></jsp:include>
    <link rel="stylesheet" href="${contextPath}/css/teachercommunity/view.css" />
</header>
<body>
<h2>
    게시글 상세 보기
</h2>
<table class="detailView" border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>신고자</td> <td colspan="3">${ dto.userId }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ dto.regDate }</td>
        <td>신고한 게시물 아이디</td><td>${ dto.brdId }</td>
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
<div>
    <button class="btnlist" type="button" onclick="location.href='${contextPath}/admin/list.do?cateSub=${ cateSub }';">
        목록 바로가기
    </button>
    <div>
        <jsp:include page="/view/admin/reportComment.jsp"></jsp:include>
    </div>
</div>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>

