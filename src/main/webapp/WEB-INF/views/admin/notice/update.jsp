<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <link rel="stylesheet" href="/resources/css/notice.css">
    <title>게시글 수정</title>
</head>
<body>
<div class="notice_main_title">
    <h1>게시글 수정</h1>
</div>
<br><br>
<form action="${contextPath}/admin/notice/noticeUpdate.do" method="post" name="updateNoticeForm">
    <table class="update_table">
        <tbody>
            <tr>
                <input type="hidden" name="brdId" align="center" value="${noticeDetail.brdId}">
                <td class="update_list" align="center"><strong>번호</strong></td>
                <td class="update_content"><input type="text" value="${noticeDetail.brdId}" readonly></td>
                <td class="update_list" align="center"><strong>조회수</strong></td>
                <td class="update_content"><input type="text" name="viewCnt" align="center" value="${noticeDetail.viewCnt}" readonly></td>
            </tr>
            <tr>
                <input type="hidden" name="memberId" value="${noticeDetail.memberId}">
                <td class="update_list" align="center"><strong>작성자</strong></td>
                <td class="update_content"><input type="text" align="center" value="${noticeDetail.memberId}" readonly></td>
                <td class="update_list" align="center"><strong>작성일</strong></td>
                <td class="update_content"><input type="text" name="regDate" align="center" value="${noticeDetail.regDate}" readonly></td>
            </tr>
            <tr>
                <td id="update_title" align="center"><strong>제목</strong></td>
                <td colspan='3' id="title">
                    <input type="text" name="title" value="${noticeDetail.title}" autofocus>
                </td>
            </tr>
            <tr>
                <td class="update_list" id="update_content" align="center"><strong>내용</strong></td>
                <td colspan="3" class="update_content">
                    <input type="text" name="content" value="${noticeDetail.content}">
                </td>
            </tr>
            <input type="hidden" name="cate" value="1">
        </tbody>
    </table>
    <div class="clear" />
    <br><br>
    <section id="center">
        <input type="submit" class="notice_save" value="저장" />
        <input type="reset" class="notice_reset" value="초기화">
    </section>
    <div align="right">
        <a href="${contextPath}/admin/notice/noticeList.do"><button class="move_notice">목록으로</button></a>
    </div>
</form>
</body>
<script>
    // const update = () => {
    //     document.updateNoticeForm.submit();
    // }
</script>
</html>
