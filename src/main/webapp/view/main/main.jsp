<%--
  Created by IntelliJ IDEA.
  User: cyj
  Date: 2023-11-26
  Time: 오후 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>home</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../css/headers.css" rel="stylesheet">
    <link href="../../css/carousel.css" rel="stylesheet">
    <link href="../../css/main.css" rel="stylesheet">
    <link href="../../css/nav.css" rel="stylesheet">

</head>
<body>
<header>


    <jsp:include page="../common/top.jsp"></jsp:include>
    <div>
        <nav class="d-flex justify-content-center py-3">
            <ul class="nav nav-pills menu">
                <li class="nav-item">
                    <a href="#" class="nav-link">중고 거래</a>
                    <ul class="submenu" id = "submenu01">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                        <li><a href="#">submenu03</a></li>
                        <li><a href="#">submenu04</a></li>
                        <li><a href="#">submenu05</a></li>
                        <li><a href="#">submenu06</a></li>
                        <li><a href="#">submenu06</a></li>
                        <li><a href="#">submenu06</a></li>
                        <li><a href="#">submenu06</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">선생님 요모조모</a>
                    <ul class="submenu" id = "submenu02">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                        <li><a href="#">submenu03</a></li>
                        <li><a href="#">submenu04</a></li>
                        <li><a href="#">submenu05</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">내 상점</a>
                    <ul class="submenu" id = "submenu03">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                        <li><a href="#">submenu03</a></li>
                        <li><a href="#">submenu04</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">고객지원</a>
                    <ul class="submenu" id = "submenu04">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                        <li><a href="#">submenu03</a></li>
                        <li><a href="#">submenu04</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>

</header>

<main>
    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg>
                <div class="container">
                    <div class="carousel-caption text-start">
                        <h1>개쩌는 쌤마켓의 중고거래</h1>
                        <p class="opacity-75">Some representative placeholder content for the first slide of the carousel.</p>
                        <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg>
                <div class="container">
                    <div class="carousel-caption">
                        <h1>쌤마켓에서는 선생님들과 커뮤니티도 쌉가능.</h1>
                        <p>Some representative placeholder content for the second slide of the carousel.</p>
                        <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg>
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>문의글이 있다면 진실의 방으로</h1>
                        <p>Some representative placeholder content for the third slide of this carousel.</p>
                        <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
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
</main>
<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">


    <!-- START THE FEATURETTES -->

        <div class="album py-5 bg-body-tertiary">
            <div class="container">
                <h2>오늘의 인기 중고거래</h2>
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
                <small class="d-block text-end mt-3">
                    <a href="#">모든 중고거래 확인하기</a>
                </small>

                <hr class="featurette-divider">

                <h2>선생님 요모조모 오늘의 인기글</h2>
                <div class="my-3 p-3 bg-body rounded shadow-sm">
                    <h6 class="border-bottom pb-2 mb-0">Recent updates</h6>
                    <div class="d-flex text-body-secondary pt-3">
                        <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"></rect><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
                        <p class="pb-3 mb-0 small lh-sm border-bottom">
                            <strong class="d-block text-gray-dark">제목입니다졸려요</strong>
                            Some representative placeholder content, with some information about this user. Imagine this being some sort of status update, perhaps?
                        </p>
                    </div>
                    <div class="d-flex text-body-secondary pt-3">
                        <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"></rect><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>
                        <p class="pb-3 mb-0 small lh-sm border-bottom">
                            <strong class="d-block text-gray-dark">제목입니다졸려요</strong>
                            Some more representative placeholder content, related to this other user. Another status update, perhaps.
                        </p>
                    </div>
                    <div class="d-flex text-body-secondary pt-3">
                        <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"></rect><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
                        <p class="pb-3 mb-0 small lh-sm border-bottom">
                            <strong class="d-block text-gray-dark">제목입니다졸려요</strong>
                            This user also gets some representative placeholder content. Maybe they did something interesting, and you really want to highlight this in the recent updates.
                        </p>
                    </div>
                    <small class="d-block text-end mt-3">
                        <a href="#">모든 게시물 확인하기</a>
                    </small>
                </div>
            </div>

            <hr class="featurette-divider">

            <!-- FOOTER -->
            <footer class="container">
                <p class="float-end"><a href="#">Back to top</a></p>
                <p>&copy; 2017–2023 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>

            <script src="../../js/bootstrap.bundle.min.js"></script>
        </div>
    </div>
</body>
</html>

