<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호변경</title>
</head>
<body>
<form action="${contextPath}/member/pwChange.do" method="post">
    <table>
        <tr>
            <input type="hidden" name ="memberId" value="${memberId}">
            <td>비밀번호</td>
            <td><input type="password" name="memberPw" placeholder="비밀번호를 입력하세요."></td>
        </tr>
        <tr>
            <td><input type="submit" value="확인"></td>
        </tr>
        </div>
    </table>

</body>
</html>
