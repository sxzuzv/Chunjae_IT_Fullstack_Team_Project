<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <title>공지사항</title>
</head>
<body>
<div>
    <h1>게시글 상세 보기</h1>
</div>
    <table>
        <tr>
            <td><strong>제목</strong></td>
            <td>${noticeDetail.title}</td>
        </tr>
        <tr>
            <td><strong>작성자</strong></td>
            <td>${noticeDetail.memberId}</td>
        </tr>
        <tr>
            <td><strong>작성일</strong></td>
            <td>${noticeDetail.regDate}</td>
        </tr>
        <tr>
            <td><strong>조회수</strong></td>
            <td>${noticeDetail.viewCnt}</td>
        </tr>
        <tr>
            <td><strong>내용</strong></td>
            <td>${noticeDetail.content}</td>
        </tr>
    </table>
    <a href="${contextPath}/admin/notice/noticeUpdate.do">
        <input type="button" value="수정">
    </a>
    <a href="${contextPath}/admin/notice/noticeList.do?page=${page}">
        <input type="button" value="목록으로"></a>
</body>
</html>
