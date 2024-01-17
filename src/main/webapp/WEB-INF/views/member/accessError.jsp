<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>Access Denied Page</h1>


<h1><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h1>

<h1><c:out value="${msg}"/></h1>
<div>
    <button type="button" onclick="location.href='/main/main.do'">홈으로 돌아가기</button>
</div>
</ul>
</body>
</html>