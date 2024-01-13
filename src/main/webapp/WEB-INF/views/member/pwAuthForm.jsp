<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
    <title>인증번호입력</title>
</head>
<body>
<h1>인증번호 입력</h1>
    <form action="${contextPath}/member/pwAuth.do" method="post">
        <table>
            <tr>
                <input type="hidden" name ="num" value="${num}">
                <td>인증번호</td>
                <td><input type="text" name="emailAuth" placeholder="인증번호를 입력하세요"></td>
            </tr>
            <tr>
            <td><input type="submit" value="확인"></td>
            </tr>
        </div>
        </table>
    </form>





</body>
</html>
