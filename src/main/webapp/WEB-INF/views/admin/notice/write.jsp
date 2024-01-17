<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <title>공지사항</title>
</head>
<body>
    <div>
        <h1>게시글 작성</h1>
    </div>
    <form action="${contextPath}/admin/notice/noticeWrite.do" method="post">
        <table>
            <tr>
                <td><strong>제목</strong></td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td><strong>내용</strong></td>
                <td><input type="text" name="content"></td>
            </tr>
        </table>
        <input type="submit" value="작성 완료">
        <input type="reset" value="초기화">
        <a href="${contextPath}/admin/notice/noticeList.do">
            <input type="button" value="목록으로"></a>
    </form>
</body>
</html>
