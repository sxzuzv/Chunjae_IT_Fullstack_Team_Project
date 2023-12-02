<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>home</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">

    <!--헤더 공통 css -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">


    <link href="../../css/headers.css" rel="stylesheet">
    <link href="../../css/main.css" rel="stylesheet">


    <!-- 슬라이드 css-->
    <link href="../../css/carousel.css" rel="stylesheet">
</head>
<body>
<header>
    <jsp:include page="../common/top.jsp"></jsp:include>
</header>
<div class="container-fluid d-flex align-items-center justify-content-center" style="height: 100vh;">
    <div class="card p-5">
        <form action="${contextPath}/member/login.do">
            <h1 class="mb-4">아이디 찾기</h1>
            <div class="alert alert-info" role="alert">
                회원가입 시 사용한 아이디는 <strong>${userId}</strong> 입니다.
            </div>
            <button type="submit" class="btn btn-primary mt-3">로그인 화면으로 돌아가기</button>
        </form>
    </div>
</div>
</body>
</html>
