<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>공지사항</title>
</head>
<body>
<div>
    <h1>게시글 상세 보기</h1>
</div>
    <table>
        <tr>
            <td><strong>번호</strong></td>
            <td>${noticeDetail.brdId}</td>
        </tr>
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
    <button onclick="noticeUpdate()">수정</button>
    <button onclick="noticeDelete()">삭제</button>
    <button onclick="noticeList()">목록으로</button>
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
        location.href = "${contextPath}/admin/notice/noticeDelete.do?brd_id=" + brdId;

    }

    <%-- '목록으로' 버튼 클릭 시 직전에 보고 있던 페이지 화면으로 돌아간다. --%>
    const noticeList = () => {
        const page = '${page}';
        location.href = "${contextPath}/admin/notice/noticeList.do?page=" + page;
    }
</script>
</html>
