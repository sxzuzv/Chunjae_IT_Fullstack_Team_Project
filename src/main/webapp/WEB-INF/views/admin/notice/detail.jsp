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
                <td class="detail_content" align="center">${noticeDetail.brdId}</td>
                <td class="detail_list" id="detail_view_cnt" align="center"><strong>조회수</strong></td>
                <td class="detail_content" align="center">${noticeDetail.viewCnt}</td>
            </tr>
            <tr>
                <td class="detail_list" id="detail_member_id" align="center"><strong>작성자</strong></td>
                <td class="detail_content" align="center">${noticeDetail.memberId}</td>
                <td class="detail_list" id="detail_reg_date" align="center"><strong>작성일</strong></td>
                <td class="detail_content" align="center">${noticeDetail.regDate}</td>
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
<section id="center">
        <button class="notice_update" onclick="noticeUpdate()">수정</button>
        <button class="notice_delete" onclick="noticeDelete()">삭제</button>
</section>
<div align="right">
    <button class="move_notice" onclick="noticeList()">목록으로</button>
</div>
</body>
<script>
    <%-- '수정' 버튼 클릭 시 실행된다. --%>
    const noticeUpdate = () => {
        const brdId = ${noticeDetail.brdId};
        location.href = "${contextPath}/admin/notice/noticeUpdate.do?brd_id=" + brdId;
    }

    <%-- '삭제' 버튼 클릭 시 실행된다. --%>
    const noticeDelete = () => {
        const brdId = ${noticeDetail.brdId};

        if (confirm("게시글을 삭제하시겠습니까?")) {
            alert("게시글이 삭제되었습니다.");
            location.href = "${contextPath}/admin/notice/noticeDelete.do?brd_id=" + brdId;
        } else {
            alert("게시글 삭제를 취소합니다.");
            location.href = "${contextPath}/admin/notice/noticeDetail.do?brd_id=${noticeDetail.brdId}"
        }
    }

    <%-- '목록으로' 버튼 클릭 시 직전에 보고 있던 페이지 화면으로 돌아간다. --%>
    const noticeList = () => {
        const changePage = '${page}';
        location.href = "${contextPath}/admin/notice/noticeList.do?page=" + changePage;
    }
</script>
</html>
