<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>home</title>

    <%--  슬라이드 CSS --%>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
    <link href="${contextPath}/css/carousel.css" rel="stylesheet">

</head>
<body>
<header>

    <jsp:include page="/view/common/header.jsp"></jsp:include>
    <link href="${contextPath}/css/main.css" rel="stylesheet">

</header>


<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${contextPath}/img/teacher2.jpg" class="bd-placeholder-img" width="100%" height="" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="true">
            <div class="container">
                <div class="carousel-caption text-start">
                    <h1>티처마켓의 중고거래</h1>
                    <p class="opacity-75">단종으로 어디서도 찾기 어려운 교구들, 지금 중고거래로 만나보세요.</p>
                    <p><a class="btn btn-lg btn-primary" href="${contextPath}/market/list.do">중고거래 둘러보기</a></p>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${contextPath}/img/teacher3.jpg" class="bd-placeholder-img" width="100%" height="" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="true">
            <div class="container">
                <div class="carousel-caption">
                    <h1>티처마켓에서는 선생님들과 커뮤니티도 가능</h1>
                    <p>선생님들만 공감할수 있는 이야기를 커뮤니티에서 나눠보세요</p>
                    <p><a class="btn btn-lg btn-primary" href="${contextPath}/teachercommunity/list.do">커뮤니티 둘러보기</a></p>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${contextPath}/img/teacher1.jpg" class="bd-placeholder-img" width="100%" height="" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="true">
            <div class="container">
                <div class="carousel-caption text-end">
                    <h1>선생님 인증으로 안전한 거래</h1>
                    <p>신뢰가 필요한 중고거래, 티쳐 마켓에서는 인증절차를 거친 회원만 거래할 수 있어요</p>
                    <p><a class="btn btn-lg btn-primary" href="${contextPath}/member/join.do">가입하기</a></p>
                </div>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
<hr class="layout">
<div id="wrap">
    <div id="container">
        <div id="contents">
            <style>
                #wrap {
                    overflow: hidden;
                }

                #quick {
                    top: 415px;
                }
            </style>
            <!-- 추천상품 -->
            <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                <div class="titleArea">
                    <h2>
                        오늘의 중고거래 인기글이에요!
                    </h2>
                    <p></p>
                </div>
            </div>
            <div class="xans-element- xans-product xans-produgitct-normalpackage"><!-- 정렬기준 외 -->
                <div class="xans-element- xans-product xans-product-normalmenu">
                    <div class="function" id="Product_ListMenu">
                        <button type="button" onclick="location.href='${contextPath}/market/list.do';" style="background-color: #0a53be">바로가기</button>
                    </div>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-body-secondary">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-body-secondary">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-body-secondary">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-body-secondary">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-body-secondary">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-body-secondary">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                <div class="titleArea">
                    <h2>
                        지금 가장 인기있는 게시글이에요!
                    </h2>
                    <p></p>
                </div>
            </div>
            <div class="xans-element- xans-product xans-product-normalpackage"><!-- 정렬기준 외 -->
                <div class="xans-element- xans-product xans-product-normalmenu">
                    <div class="function">
                        <button type="button" onclick="location.href='${contextPath}/market/list.do';" style="background-color: #0a53be">바로가기</button>
                    </div>
                </div>
            </div>
            <div class="my-3 p-3 bg-body rounded shadow-sm">
                <div class="d-flex text-body-secondary pt-3">
                    <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"></rect><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
                    <p class="pb-3 mb-0 small lh-sm border-bottom">
                        <strong class="d-block text-gray-dark">제목입니다</strong>
                        Some representative placeholder content, with some information about this user. Imagine this being some sort of status update, perhaps?
                    </p>
                </div>
                <div class="d-flex text-body-secondary pt-3">
                    <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"></rect><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>
                    <p class="pb-3 mb-0 small lh-sm border-bottom">
                        <strong class="d-block text-gray-dark">제목입니다</strong>
                        Some more representative placeholder content, related to this other user. Another status update, perhaps.
                    </p>
                </div>
                <div class="d-flex text-body-secondary pt-3">
                    <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"></rect><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
                    <p class="pb-3 mb-0 small lh-sm border-bottom">
                        <strong class="d-block text-gray-dark">제목입니다</strong>
                        This user also gets some representative placeholder content. Maybe they did something interesting, and you really want to highlight this in the recent updates.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${contextPath}/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>