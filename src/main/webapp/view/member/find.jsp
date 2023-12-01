<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html><title>아이디 찾기</title>
</html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>home</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../../css/main.css" rel="stylesheet">
<link href="../../css/nav.css" rel="stylesheet">
<link rel="stylesheet" href="../../css/find.css">

    <link href="../../css/carousel.css" rel="stylesheet">


</head>


<body>
<header>
    <jsp:include page="../common/top.jsp"></jsp:include>
</header>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->
        <h2 class="active">아이디 찾기</h2>
        <!-- Login Form -->
        <div>
        <form action="${contextPath}/member/idFind.do">
            <input type="text" id="userName" class="fadeIn second" name="userName" placeholder="이름">
            <input type="text" id="usermail" class="fadeIn third" name="userEmail" placeholder="이메일" autocomplete="off">
            <input type="submit" class="fadeIn fourth" value="아이디찾기">
        </form>
        </div>
        <div>
        <form action="${contextPath}/member/passFind.do">
            <input type="text" id="userId" class="fadeIn second" name="userId" placeholder="아이디">
            <input type="text" id="userEmail" class="fadeIn second" name="userEmail" placeholder="이메일">
            <input type="text" id="userPw" class="fadeIn third" name="userCp" placeholder="전화번호" autocomplete="off">
            <input type="submit" class="fadeIn fourth" value="비밀번호변경">
        </form>
        </div>
    </div>
</div>
</body>
</html>
