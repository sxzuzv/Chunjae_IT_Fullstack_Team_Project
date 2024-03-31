<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>Title</title>
</head>
<body>
<div id="detail_table">
  <h3>아이디 찾기</h3>
  <form action="${contextPath}/member/idFind.do" method="post" class="frmLogin">
    <table>
      <tbody>
      <tr class="dot_line">
        <th class="fixed_join">이름</th>
        <td><input name="memberName" type="text" size="20"/></td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">휴대폰번호</th>
        <td><select name="memberHp1">
          <option>없음</option>
          <option selected value="010">010</option>
          <option value="011">011</option>
          <option value="016">016</option>
          <option value="017">017</option>
          <option value="018">018</option>
          <option value="019">019</option>
        </select> - <input size="10px" type="text" name="memberHp2"> - <input size="10px" type="text"
                                                                              name="memberHp3">
        </td>
      </tr>
      </tbody>
    </table>
    <div class="login_btns">
      <input type="submit" class="login_btn" value="아이디 찾기">
    </div>
  </form>
</div>
</body>
</html>
