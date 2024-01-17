<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
<div>
    <h1>게시글 수정</h1>
</div>
<form action="${contextPath}/admin/notice/noticeUpdate.do" method="post" name="updateNoticeForm">
    <table>
        <tr>
            <td><strong>번호</strong></td>
            <input type="hidden" name="brdId" value="${noticeDetail.brdId}">
            <td><input type="text" value="${noticeDetail.brdId}" disabled></td>
        </tr>
        <tr>
            <td><strong>제목</strong></td>
            <td><input type="text" name="title" value="${noticeDetail.title}"></td>
        </tr>
        <tr>
            <td><strong>작성자</strong></td>
            <input type="hidden" name="memberId" value="${noticeDetail.memberId}">
            <td><input type="text" value="${noticeDetail.memberId}" disabled></td>
        </tr>
        <tr>
            <td><strong>작성일</strong></td>
            <td><input type="text" name="regDate" value="${noticeDetail.regDate}" readonly></td>
        </tr>
        <tr>
            <td><strong>조회수</strong></td>
            <td><input type="text" name="viewCnt" value="${noticeDetail.viewCnt}" readonly></td>
        </tr>
        <tr>
            <td><strong>내용</strong></td>
            <td><input type="text" name="content" value="${noticeDetail.content}"></td>
        </tr>
        <input type="hidden" name="cate" value="1">
    </table>
    <input type="submit" value="저장" />
</form>
</body>
<script>
    // const update = () => {
    //     document.updateNoticeForm.submit();
    // }
</script>
</html>
