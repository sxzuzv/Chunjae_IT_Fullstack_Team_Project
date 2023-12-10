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

    <script type="text/javascript">
        function validateForm(form) {
            if (form.name.value == "") {
                alert("작성자를 입력하세요.");
                form.name.focus();
                return false;
            }
            if (form.title.value == "") {
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;
            }
            if (form.content.value == "") {
                alert("내용을 입력하세요.");
                form.content.focus();
                return false;
            }
        }
    </script>
</head>
<body>

<header>

    <jsp:include page="/view/common/header.jsp"></jsp:include>
    <link rel="stylesheet" href="${contextPath}/css/teachercommunity/edit.css" />

</header>
<h2>게시글 수정</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data" action="/cscenter/edit.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="brdId" value="${ dto.brdId }">
    <input type="hidden" name="prevOfile" value="${ dto.ofile }">
    <input type="hidden" name="prevSfile" value="${ dto.sfile }">
    <input type="hidden" name="cateSub" style="width:150px;" value="${ dto.cateSub }">

    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width:90%;" value="${ dto.title }">
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width:90%;height:100px;">${ dto.content }</textarea>
            </td>
        </tr>
        <tr>
            <td>첨부 파일</td>
            <td>
                <input type="file" name="ofile">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button class="btnlist" type="button" onclick="goBack()">
                    목록 바로가기
                </button>

                <script>
                    function goBack() {
                        history.go(-1);
                    }
                </script>
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
