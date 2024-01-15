<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <title>아이디 찾기</title>
</head>
<body>
<table>
    <h1>아이디 찾기</h1>
<tr>
    <td><h2>고객님의 아이디는</h2></td>
</tr>
    <tr>
        <td><strong>${memberId}</strong> 입니다.</td>
    </tr>
    <tr>
        <td><input type="button" value="로그인화면으로 돌아가기" onclick="location.href='${contextPath}/member/loginForm.do'"/></td>
    </tr>
</table>
</body>
</html>
