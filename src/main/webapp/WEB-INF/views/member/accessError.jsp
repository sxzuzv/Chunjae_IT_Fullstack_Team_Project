<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="/resources/css/error.css">
</head>
<body>
<div class="message_container">
  <div class="error_title">Access Denied Page</div>
  <hr>
  <div class="error_message">
    <p><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></p>
    <p><c:out value="${msg}"/></p>
  </div>
  <button type="button" onclick="location.href='/main/main.do'">홈으로 돌아가기</button>
</div>
</body>
</html>
