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
    <style>
        body {
            background-color: #f7f7f7;
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



        input[type="submit"].fadeIn{
            background-color: #114276;
            color: white;
        }



    </style>
</head>

    <jsp:include page="/view/common/header.jsp"></jsp:include>


<div class="container custom-container">
    <div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
    <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
        <div class="titleArea">
    <h1>
        <font color="#555555">아이디/비밀번호 변경</font>
    </h1>
        </div>
    </div>
    </div>
    <hr class="my-4">
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
                                    <input type="text" id="userName" class="form-control form-control-lg fadeIn second"
                                           name="userName" placeholder="이름" style="width: 300px;"> <!-- Adjust width as needed -->
                                </div>
                                <div class="form-group">
                                    <input type="text" id="usermail" class="form-control form-control-lg fadeIn third"
                                           name="userEmail" placeholder="이메일" autocomplete="off" style="width: 300px;"> <!-- Adjust width as needed -->
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="fadeIn fourth btn custom-btn"
                                           value="아이디찾기">
                                </div>
                            </form>
                        </div>
                        <div class="col">
                            <h2 class="active">비밀번호 변경</h2>
                            <form action="${contextPath}/member/passFind.do">
                                <div class="form-group">
                                    <input type="text" id="userId" class="form-control form-control-lg fadeIn second" name="userId"
                                           placeholder="아이디" style="width: 300px;"> <!-- Adjust width as needed -->
                                </div>
                                <div class="form-group">
                                    <input type="text" id="userEmail" class="form-control form-control-lg fadeIn second"
                                           name="userEmail" placeholder="이메일" style="width: 300px;"> <!-- Adjust width as needed -->
                                </div>
                                <div class="form-group">
                                    <input type="text" id="userPw" class="form-control form-control-lg fadeIn third" name="userCp"
                                           placeholder="전화번호" autocomplete="off" style="width: 300px;"> <!-- Adjust width as needed -->
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="fadeIn fourth btn custom-btn"
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
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>

</html>
