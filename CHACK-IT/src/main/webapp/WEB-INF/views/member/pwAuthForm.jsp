<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<head>
  <title>인증번호입력</title>
</head>
<body>
<h3>인증번호 입력</h3>
<div id="detail_table">
  <form action="${contextPath}/member/pwAuth.do" method="post" class="frmLogin">
    <table>
      <tbody>
      <tr>
        <input type="hidden" name="num" value="${num}">
        <th class="fixed_join">인증번호</th>
        <td><input type="text" name="emailAuth" placeholder="인증번호를 입력하세요"></td>
      </tr>
      </tbody>
    </table>
    <div class="login_btns">
      <input type="submit" value="확인" class="login_btn">
    </div>
  </form>
</div>


</body>
</html>
