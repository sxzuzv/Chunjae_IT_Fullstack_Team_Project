<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <c:if test='${not empty message }'>
    <script>
        window.onload = function () {
            result();
        }

        function result() {
            alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
        }
    </script>
  </c:if>
</head>
<body>
<H3>회원 로그인 창</H3>
<h2><c:out value="${error}"/></h2>
<h2><c:out value="${logout}"/></h2>
<DIV id="detail_table">
  <form action="/login" method="post" class="frmLogin">
    <table>
      <tbody>
      <tr class="dot_line">
        <th class="fixed_join">아이디</th>
        <td><input name="memberId" type="text" value="${rememberId}"/></td>
      </tr>
      <tr class="solid_line">
        <th class="fixed_join">비밀번호</th>
        <td><input name="memberPw" type="password"/></td>
      </tr>
      <tr>
        <td>
          <input type="checkbox" id="rememberId" name="rememberId" ${rememberId != "" ? 'checked' : ''}/>
          <label for="rememberId">아이디 저장</label>
        </td>
      </tr>
      </tbody>
    </table>
    <div class="login_btns">
      <INPUT class="login_btn" type="submit" value="로그인">
      <INPUT class="reset_btn" type="reset" value="초기화">
    </div>
    <ul>
      <li><a href="${contextPath}/member/idFindForm.do">아이디 찾기</a></li>
      |
      <li><a href="${contextPath}/member/pwFindForm.do">비밀번호 찾기</a></li>
      |
      <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
      |
      <li><a href="#">고객 센터</a></li>
    </ul>
  </form>
</DIV>
</body>
</html>
