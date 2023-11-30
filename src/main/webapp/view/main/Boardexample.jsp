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
        <form method="get">
            <table border="1" width="90%">
                <tr>
                    <td align="center">
                        <select name="searchField">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" name="searchWord" />
                        <input type="submit" value="검색하기" />
                    </td>
                </tr>
            </table>
        </form>
        <div id="baordList">
            <a href="${pageContext.request.contextPath}/view/board/list.do">게시판 목록 바로가기</a>
        </div>
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

