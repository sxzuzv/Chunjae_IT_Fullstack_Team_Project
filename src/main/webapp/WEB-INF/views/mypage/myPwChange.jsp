<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>비밀번호변경</title>
  <script>
      function pwChange() {
          var form = document.passchangeForm;
          if (form.memberPw.value != form.memberPw2.value) {
              alert("비밀번호가 다릅니다")
              form.memberPw2.focus();
              return;
          }
          form.submit();
      }
  </script>
  <link rel="stylesheet" href="/resources/css/error.css">
  <link rel="stylesheet" href="/resources/css/admin.css">
</head>
<body>
<div class="message_container">
  <form name="passchangeForm" action="${contextPath}/mypage/pwChange.do" method="post">
    <input type="hidden" name="memberId" value="${memberInfo.memberId}">
    <div class="error_title">비밀번호 변경</div>
    <hr>
    <table class="error_message" width="100%">
      <tr>
        <td style="text-align: left; width: 8em"><label for="memberPw">기존 비밀번호</label></td>
        <td><input type="password" id="memberPw" name="memberPw" placeholder="비밀번호" maxlength="15"></td>
      </tr>
      <tr>
        <td align="left"><label for="memberPw2">변경할 비밀번호</label></td>
        <td><input type="password" id="memberPw2" name="memberPw2" placeholder="비밀번호 확인" maxlength="15"></td>
      </tr>
      
      <tr>
        <td colspan="2" align="center" style="padding-top: 1.2em"><input type="button" onclick="pwChange();" value="확인"></td>
      </tr>
</table>
</form>
</div>
</body>
</html>
