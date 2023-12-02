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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!--헤더 공통 css -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">


    <link href="../../css/headers.css" rel="stylesheet">
    <link href="../../css/main.css" rel="stylesheet">


    <!-- 슬라이드 css-->
    <link href="../../css/carousel.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
        }
        .wrapper {
            margin-top: 80px;
        }
        #formContent {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }
        .custom-container {
            width: 1500px;
            height:1000px;
        }
        .form-group {
            margin-bottom: 10px;
        }

        h2.active {
            font-size: 24px;
        }

    </style>
</head>


<body>
<header>
    <jsp:include page="../common/top.jsp"></jsp:include>
</header>
<div class="container custom-container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="wrapper fadeInDown">
                <div id="formContent">
                    <!-- Tabs Titles -->

                    <!-- Login Form -->
                    <div class="row">
                        <div class="col">
                            <h2 class="active">아이디 찾기</h2>
                            <form action="${contextPath}/member/idFind.do">
                                <div class="form-group">
                                    <input type="text" id="userName" class="form-control fadeIn second"
                                           name="userName" placeholder="이름">
                                </div>
                                <div class="form-group">
                                    <input type="text" id="usermail" class="form-control fadeIn third"
                                           name="userEmail" placeholder="이메일" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="fadeIn fourth btn btn-primary btn-block"
                                           value="아이디찾기">
                                </div>
                            </form>
                        </div>
                        <div class="col">
                            <h2 class="active">비밀번호 변경</h2>
                            <form action="${contextPath}/member/passFind.do">
                                <div class="form-group">
                                    <input type="text" id="userId" class="form-control fadeIn second" name="userId"
                                           placeholder="아이디">
                                </div>
                                <div class="form-group">
                                    <input type="text" id="userEmail" class="form-control fadeIn second"
                                           name="userEmail" placeholder="이메일">
                                </div>
                                <div class="form-group">
                                    <input type="text" id="userPw" class="form-control fadeIn third" name="userCp"
                                           placeholder="전화번호" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="fadeIn fourth btn btn-primary btn-block"
                                           value="비밀번호변경">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS, jQuery, Popper.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</body>

</html>
