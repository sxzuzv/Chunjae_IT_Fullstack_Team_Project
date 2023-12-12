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
    function validateForm(form) {  // 필수 항목 입력 확인
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
      if (form.pass.value == "") {
        alert("비밀번호를 입력하세요.");
        form.pass.focus();
        return false;
      }
    }
  </script>
</head>
<body>
<header>

  <jsp:include page="/view/common/header.jsp"></jsp:include>
  <link rel="stylesheet" href="${contextPath}/css/teachercommunity/write.css" />

</header>
<h2>게시글 작성</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data"
      action="${contextPath}/teachercommunity/write.do" onsubmit="return validateForm(this);">
  <table border="1" width="90%">
    <tr>
      <td>카테고리</td>
      <td align="center">
        <select name="cateSub">
          <option value="1">꿀팁 나눠요</option>
          <option value="2">고민 있어요</option>
          <option value="3">수업 질문</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>제목</td>
      <td>
        <input type="text" name="title" style="width:90%;">
      </td>
    </tr>
    <tr>
      <td>내용</td>
      <td>
        <textarea name="content" style="width:90%;height:100px;"></textarea>
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
        <button type="button" onclick="location.href='${contextPath}/teachercommunity/list.do';">
          목록 바로가기
        </button>
      </td>
    </tr>
  </table>
</form>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
