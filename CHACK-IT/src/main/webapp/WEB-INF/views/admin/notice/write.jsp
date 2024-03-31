<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <link rel="stylesheet" href="/resources/css/notice.css">
    <title>공지사항</title>
</head>
<body>
    <div class="notice_main_title">
        <h1>게시글 작성</h1>
    </div>
    <br>
    <form action="${contextPath}/admin/notice/noticeWrite.do" method="post">
        <table class="write_table">
            <tbody>
            <tr>
                <td class="write_list" align="center"><strong>제목</strong></td>
                <td class="write_content"><input type="text" name="title" autofocus required></td>
            </tr>
            <tr>
                <td class="write_list" align="center"><strong>내용</strong></td>
                <td class="write_content"><input type="text" name="content" required></td>
            </tr>
            </tbody>
        </table>
        <div class="clear" />
        <br><br>
        <section id="center">
        <input type="submit" value="작성 완료">
        <input type="reset" value="초기화">
        </section>
        <div align="right">
        <a href="${contextPath}/admin/notice/noticeList.do">
            <button class="move_notice">목록으로</button></a>
        </div>
    </form>
</body>
</html>
