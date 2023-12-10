<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .container{
            max-width: 300px;
        }
    </style>

</head>
<body>

    <jsp:include page="/view/common/header.jsp"></jsp:include>

<div class="container">
            <div class="titleArea">
    <h1 class="mb-4">
        <font color="#555555">아이디 찾기
        </font>
    </h1>
        </div>
    <hr class="my-4">
    <div class="card p-4">
        <form action="${contextPath}/member/main.do">
            <div class="alert alert-info" role="alert">
                회원가입 시 사용한 아이디는 <strong>${memberId}</strong> 입니다.
            </div>
            <button type="submit" class="btn btn-primary mt-3" style="background-color:#114276; color: white; ">로그인 화면으로 돌아가기</button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
