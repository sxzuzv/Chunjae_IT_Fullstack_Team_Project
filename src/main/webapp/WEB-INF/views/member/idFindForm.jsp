<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>아이디 찾기</h1>
<form action="${contextPath}/member/idFind.do" method="post">
    <table>
        <tr class="dot_line">
            <td class="fixed_join">이름</td>
            <td><input name="memberName" type="text" size="20" /></td>
        </tr>
        <tr class="dot_line">
            <td class="fixed_join">휴대폰번호</td>
            <td><select  name="memberHp1">
                <option>없음</option>
                <option selected value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select> - <input size="10px"  type="text" name="memberHp2"> - <input size="10px"  type="text" name="memberHp3"><br> <br>
                <input type="submit" value="아이디 찾기">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
