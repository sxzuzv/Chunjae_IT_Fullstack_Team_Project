<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>board example</title>

    <!--헤더 공통 css -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="../../css/headers.css" rel="stylesheet">
    <link href="../../css/main.css" rel="stylesheet">
    <link href="../../css/nav.css" rel="stylesheet">
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header>

    <jsp:include page="../common/top.jsp"></jsp:include>


</header>

<main>
    <div class="container">
        <h1 style="font-family: Namum">${catTargetName}</h1>
        <div style="border-bottom: 1px solid #bdbdbd42; margin:5px 20px 20px 20px"></div>
        <form id="frmSearch" method="post" name="search">
            <table class="pull-right">
                <tr>
                    <td>
                        <select class="form-control" name="searchId">
                            <option value="title">제목</option>
                            <option value="user_id">작성자</option>
                        </select>
                    </td>
                    <td><input type="text" class="form-control" placeholder="검색어 입력" name="searchText" maxlength="100"><input type="hidden" value="${katTargetNo}" name="katNo"></td>
                    <td><button type="button" id="search" class="btn btn-white btn-dark">검색</button></td>
                    <td>
                        <%-- <a href="${contextPath}/board/Form.do?katNo=${katTargetNo}" class="btn btn-success pull-right" data-toggle="modal" data-target="#myModal">모달 열기</a> --%>
                        <a href="#" data-toggle="modal" data-target="#myModal"  class="btn back-blue2 addbtn pull-right">글쓰기</a>
                    </td>
                </tr>
            </table>
        </form>
        <div id="baordList">
            <jsp:include page="../board/list.jsp"></jsp:include>
        </div>
</main>
<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->




    <!-- START THE FEATURETTES -->



            <hr class="featurette-divider">

            <!-- FOOTER -->
            <footer class="container">
                <p class="float-end"><a href="#">Back to top</a></p>
                <p>&copy; 2017–2023 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>


        </div>
    </div>
</body>
</html>

