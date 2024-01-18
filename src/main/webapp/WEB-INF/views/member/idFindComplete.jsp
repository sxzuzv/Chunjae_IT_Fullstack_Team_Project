<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>아이디 찾기</title>
  <link rel="stylesheet" href="/resources/css/error.css">
</head>
<body>
<div class="message_container">
  
  <div class="error_title">아이디 찾기</div>
  <hr>
  <div class="error_message">
    <p style="font-weight: normal; font-size: 1.2em">
      고객님의 아이디는
      <strong style="font-size: 1.4em">${memberId}</strong> 입니다.
    </p>
  </div>
  <input type="button" value="로그인화면으로 돌아가기" onclick="location.href='${contextPath}/member/loginForm.do'"/>
  </table>
</div>
</body>
</html>
