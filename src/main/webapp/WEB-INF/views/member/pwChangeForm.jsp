<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호변경</title>
    <script>
        function pwChange(){
            var form = document.passchangeForm;
            if(form.memberPw.value != form.memberPw2.value){
                alert("비밀번호가 다릅니다")
                form.memberPw2.focus();
                return;
            }
            form.submit();
        }
    </script>
</head>
<body>
<form name="passchangeForm" action="${contextPath}/member/pwChange.do" method="post">
    <table>
        <tr>
            <input type="hidden" name ="memberId" value="${memberId}">
            <td>비밀번호</td>
            <td><input type="password" name="memberPw"  placeholder="비밀번호" maxlength="15"></td>
            <td><input type="password" name="memberPw2"  placeholder="비밀번호 확인" maxlength="15"></td>
        </tr>
        <tr>
            <td><input type="button" onclick="pwChange();" value="확인"></td>
        </tr>
        </div>
    </table>

</body>
</html>
