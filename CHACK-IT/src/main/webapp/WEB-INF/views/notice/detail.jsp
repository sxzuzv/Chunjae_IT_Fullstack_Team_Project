<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
    <link rel="stylesheet" href="/resources/css/notice.css">
    <title>공지사항</title>
</head>
<body>
<div class="notice_main_title">
    <h1>게시글 상세</h1>
</div>
<br>
    <table class="detail_table">
        <tbody>
            <tr>
                <td class="detail_list" id="detail_brd_id" align="center"><strong>번호</strong></td>
                <td class="detail_content">${noticeDetail.brdId}</td>
                <td class="detail_list" id="detail_view_cnt" align="center"><strong>조회수</strong></td>
                <td class="detail_content">${noticeDetail.viewCnt}</td>
            </tr>
            <tr>
                <td class="detail_list" id="detail_member_id" align="center"><strong>작성자</strong></td>
                <td class="detail_content">${noticeDetail.memberId}</td>
                <td class="detail_list" id="detail_reg_date" align="center"><strong>작성일</strong></td>
                <td class="detail_content">${noticeDetail.regDate}</td>
            </tr>
            <tr>
                <td id="detail_title" align="center"><strong>제목</strong></td>
                <td colspan='3' id="title">${noticeDetail.title}</td>
            </tr>
            <tr>
                <td class="detail_list" id="detail_content" align="center"><strong>내용</strong></td>
                <td colspan='3'><textarea id="content" readonly>${noticeDetail.content}</textarea></td>
            </tr>
        </tbody>
    </table>
    <div class="clear" />
<div align="right">
    <button class="move_notice" onclick="noticeList()">목록으로</button>
</div>
</body>
<script>
    <%-- '목록으로' 버튼 클릭 시 직전에 보고 있던 페이지 화면으로 돌아간다. --%>
    const noticeList = () => {
        const changePage = '${page}';
        location.href = "${contextPath}/notice/noticeList.do?page=" + changePage;
    }
</script>
</html>
