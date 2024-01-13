<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
    <title>비밀번호찾기</title>
<script>
  document.addEventListener('DOMContentLoaded', function() {//페이지로드후 실행
    const domainListEl = document.querySelector('#domainlist');//도메인 리스트 정의
    const domainInputEl = document.querySelector('#domaintxt');//직접입력 도메인 정의

    domainListEl.addEventListener('change', (event) => {
      if (event.target.value !== "type") {//직접입력 도메인 선택 안했을때
        domainInputEl.value = event.target.value;//선택한 도메인을 input 에 입력
        domainInputEl.readOnly = true;
      } else {//직접입력 도메인 선택시
        domainInputEl.value = "";//input 내용 초기화
        domainInputEl.readonly = false;
      }
    });
  });
</script>
</head>
<body>
<h1>비밀번호 찾기</h1>
<form action="${contextPath}/member/pwFind.do" method="post">
<table>
  <tr class="dot_line">
    <td class="fixed_join">아이디</td>
    <td><input name="memberId" type="text" size="20" /></td>
  </tr>
  <tr class="dot_line">
    <td class="fixed_join">이름</td>
    <td><input name="memberName" type="text" size="20" /></td>
  </tr>
<tr class="dot_line">
  <td class="fixed_join">이메일<br>(e-mail)</td>
  <td><input size="10px"   type="text" name="memberEmail1" /> @ <input  size="10px"  type="text"name="memberEmail2" id="domaintxt"/>
    <select id="domainlist" title="직접입력">
      <option value="type">직접입력</option>
      <option value="hanmail.net">hanmail.net</option>
      <option value="naver.com">naver.com</option>
      <option value="yahoo.co.kr">yahoo.co.kr</option>
      <option value="hotmail.com">hotmail.com</option>
      <option value="paran.com">paran.com</option>
      <option value="nate.com">nate.com</option>
      <option value="google.com">google.com</option>
      <option value="gmail.com">gmail.com</option>
      <option value="empal.com">empal.com</option>
      <option value="korea.com">korea.com</option>
      <option value="freechal.com">freechal.com</option>
    </select><br><br>
  </td>
</tr>
  <tr>
    <td><input type="submit" value="비밀번호찾기"/></td>
  </tr>
    </table>
</form>
</body>
</html>
