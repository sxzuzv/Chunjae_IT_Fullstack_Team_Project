<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>TEACHER MARKET</title>
</head>
<body>
<header>

    <jsp:include page="/view/common/headerAdmin.jsp"></jsp:include>

    <link rel="stylesheet" href="${contextPath}/css/teachercommunity/list.css" />

</header>
<div id="wrap">
    <div id="container">
        <div id="contents">
            <div
                    class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
                <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                    <div class="titleArea">
                        <h2>
                            <c:choose>
                                <c:when test="${ map.cateSub eq '1'}">문의</c:when>
                                <c:when test="${ map.cateSub eq '2'}">신고사항</c:when>

                            </c:choose>
                        </h2>
                            <br /><br />
                            <form id="boardSearchForm" name="" method="get">
                                <fieldset class="boardSearch">
                                    <legend>선생님 요조모조 검색</legend>
                                    <select name="searchField">
                                        <option value="title" selected>제목</option>
                                        <option value="content">내용</option>
                                    </select>
                                    <input type="hidden" name="cateSub" value=${ map.cateSub }>
                                    <input type="text" id="search" name="searchWord">
                                    <input id="submit" type="submit" value="검색">
                                </fieldset>
                            </form>

                            <div class="boardSort">
							<span
                                    class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
                            </div>
                            <br /><br />

                            <!-- 목록 테이블 -->
                            <div class="ec-base-table typeList gBorder">
                                <table border="1" width="90%">
                                    <caption>전체 게시글</caption>
                                    <colgroup
                                            class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                                        <col style="width:95px;">
                                        <col style="width:auto;">
                                        <col style="width:134px;">
                                        <col style="width:134px;">
                                        <col style="width:134px;">
                                    </colgroup>
                                    <thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">

                                    <tr style=" ">
                                        <th scope="col">번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">답변상태</th>
                                        <th scope="col">게시일</th>
                                    </tr>
                                    </thead>
                                    <tbody
                                            class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
                                    <c:choose>
                                    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
                                    <tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
                                        <td colspan="6" align="center">
                                            등록된 게시물이 없습니다.
                                        </td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>  <!-- 게시물이 있을 때 -->
                                    <c:forEach items="${ boardLists }" var="row" varStatus="loop">
                                    <tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
                                        <td>  <!-- 번호 -->
                                                ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
                                        </td>
                                        <td align="left">  <!-- 제목(링크) -->
                                            <a href="${contextPath}/admin/view.do?brdId=${ row.brdId }">${ row.title }</a>
                                        </td>
                                        <td>${ row.userId }</td>  <!-- 작성자 -->
                                        <c:choose>
                                            <c:when test="${commentStatus == 1}">
                                                <td>답변완료</td>  <!-- 조회수 -->
                                            </c:when>
                                            <c:otherwise>
                                                <td>답변중</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${ row.regDate }</td>  <!-- 작성일 -->
                                    </tr>
                                    </c:forEach>
                                    </c:otherwise>
                                    </c:choose>
                                </table>
                                <p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone ">
                                </p>
                            </div>



                            <div
                                    class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
                                <ol>
                                    ${ map.pagingImg }
                                </ol>
                            </div>
                        </div>
                        <hr class="layout">
                    </div>
                    <div>
                        <hr class="layout">
                    </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
