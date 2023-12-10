<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TEACHER MARKET</title>
    <!-- bootstrap 5.3.2 cdn 추가 -->
    <script type="text/javascript">
        function validateForm(form) {  // 필수 항목 입력 확인
            if (form.name.value == "") {
                alert("작성자를 입력하세요.");
                form.name.focus();
                return false;
            }
            if (form.title.value == "") {
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;
            }
            if (form.content.value == "") {
                alert("내용을 입력하세요.");
                form.content.focus();
                return false;
            }
            if (form.pass.value == "") {
                alert("비밀번호를 입력하세요.");
                form.pass.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<header>

    <jsp:include page="/view/common/header.jsp"></jsp:include>
</header>
<div id="wrap">
    <div id="container">
        <div id="contents">
            <div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
                <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                    <div class="titleArea">
                        <h2>
                            <font color="#555555">문의글 작성</font>
                        </h2>
                        <p>글 작성 페이지</p>
                    </div>
                </div>
                <form name="writeFrm" method="post" enctype="multipart/form-data"
                      action="/cscenter/write.do" onsubmit="return validateForm(this);">
                    <!-- table 대신 bootstrap grid system 사용 -->
                    <div class="container">
                        <div class="row">
                            <div class="col-3">문의카테고리</div>
                            <div class="col-9">
                                <select name="cateSub" class="form-select form-control-lg">
                                    <option value="1">고객문의</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">제목</div>
                            <div class="col-9">
                                <input type="text" name="title" class="form-control form-control-lg">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">내용</div>
                            <div class="col-9">
                                <textarea name="content" class="form-control form-control-lg" style="height:400px;"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">첨부 파일</div>
                            <div class="col-9">
                                <input type="file" name="ofile" class="form-control form-control-lg">
                            </div>
                        </div>
                        <div class="btn-zone mt-4">
                            <div class="col-12 text-center">
                                <button class="btn btn-info" type="button" onclick="goBack()">
                                    목록 바로가기
                                </button>
                                <script>
                                    function goBack() {
                                        history.go(-1);
                                    }
                                </script>
                                <button type="reset" class="btn btn-secondary">RESET</button>
                                <button type="submit" class="btn btn-primary">작성 완료</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
