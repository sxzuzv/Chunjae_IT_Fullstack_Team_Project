<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
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
    <form name="writeFrm" method="post" enctype="multipart/form-data" action="${contextPath}/market/edit.do" onsubmit="return validateForm(this);">
        <input type="hidden" name="brdId" value="${ dto.brdId }">
        <input type="hidden" name="prevOfile" value="${ dto.ofile }">
        <input type="hidden" name="prevSfile" value="${ dto.sfile }">

        <table border="1" width="90%">
            <tr>
                <td>카테고리</td>
                <td><input type="text" name="cateSub" style="width:150px;" value="${ dto.cateSub }"></td>
            </tr>
            <tr>
                <td>상태</td>
                <td>
                <select name="status">
                    <option value="거래중">거래중</option>
                    <option value="판매완료">판매완료</option>
                </select>
                </td>
            </tr>
            <tr>
                <td>구매자</td>
                <td>
                    <input type="text" name="buyerId" style="width:150px;" value="${ dto.buyerId }"></td>
            </tr>
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
                <td>지역</td>
                <td>
                    <input type="text" name="dealAddress" style="width:150px;" value="${ dto.dealAddress }"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td>
                    <input type="text" name="price" style="width:150px;" value="${ dto.price }"></td>
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
                    <button type="button" onclick="location.href='${contextPath}/market/list.do';">
                        목록 바로가기
                    </button>
                </td>
            </tr>
        </table>
    </form>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
