<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
  <title>TEACHER MARKET</title>
</head>
<body>
<header>

  <jsp:include page="/view/common/header.jsp"></jsp:include>

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
              <c:when test="${ map.cateSub eq '1'}">꿀팁 나눠요</c:when>
              <c:when test="${ map.cateSub eq '2'}">고민 있어요</c:when>
              <c:when test="${ map.cateSub eq '3'}">수업 질문</c:when>
            </c:choose>
          </h2>

            <h3>지금 가장 인기있는 게시글이에요!</h3>
          <div class="boardSort">
                          <span
                                  class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
          </div>
          <div class="ec-base-table typeList gBorder">
            <table border="1" summary="">
              <caption>지금 가장 인기있는 게시글</caption>
              <br />
              <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                <col style="width:auto;">
                <col style="width:134px;">
                <col style="width:134px;">
              </colgroup>
              <thead
                      class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
              <tr style=" ">
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">조회수</th>
              </tr>
              </thead>

            <tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
            <c:choose>
              <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
                <tr>
                  <td colspan="6" align="center">
                    인기 게시글이 없습니다.
                  </td>
                </tr>
              </c:when>
              <c:otherwise>  <!-- 게시물이  있을 때 -->
                <c:forEach items="${ topLists }" var="row" varStatus="loop">
                  <tr align="center">
                    <td align="center">  <!-- 제목(링크) -->
                      <a href="${contextPath}/teachercommunity/view.do?brdId=${ row.brdId }">${ row.title }</a>
                    </td>
                    <td>${ row.userId }</td>  <!-- 작성자 -->
                    <td>${ row.viewCnt }</td>  <!-- 조회수 -->
                  </tr>
                </c:forEach>
              </c:otherwise>
            </c:choose>
            </tbody>

            </table>

<%--          <!-- 검색 폼 -->--%>
<%--          <form id="tcboardSearchForm" method="get">--%>
<%--            <div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">--%>
<%--                  <select name="searchField">--%>
<%--                    <option value="title">제목</option>--%>
<%--                    <option value="content">내용</option>--%>
<%--                  </select>--%>
<%--                  <input type="hidden" name="cateSub" value=${ map.cateSub } />--%>
<%--                  <input id="search" name="searchField" class="inputTypeText" placeholder="" value="" type="text" />--%>
<%--                  <input id="submit" name="submit" value="검색하기" />--%>
<%--&lt;%&ndash;                  <input type="text" name="searchWord" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <input type="submit" value="검색하기" />&ndash;%&gt;--%>
<%--            </div>--%>
<%--          </form>--%>

            <br /><br />
            <form id="boardSearchForm" name="" method="get">
                <fieldset class="boardSearch">
                  <legend>선생님 요조모조 검색</legend>
                    <select name="searchField">
                      <option value="title" selected>제목</option>
                      <option value="content">내용</option>
                    </select>
                    <input type="hidden" name="cateSub" value=${ map.cateSub } >
                    <input type="text" id="search" name="searchWord">
                    <input id="submit" type="submit" value="검색">
                </fieldset>
            </form>

          <div class="boardSort">
							<span
                                    class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
          </div>
            <div>
              <button type="button" class="button" onclick="location.href='${contextPath}/teachercommunity/pass.do?mode=write';">글쓰기</button>
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
              <th scope="col">조회수</th>
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
                      <a href="${contextPath}/teachercommunity/view.do?brdId=${ row.brdId }">${ row.title }</a>
                    </td>
                    <td>${ row.userId }</td>  <!-- 작성자 -->
                    <td>${ row.viewCnt }</td>  <!-- 조회수 -->
                    <td>${ row.regDate }</td>  <!-- 작성일 -->
                  </tr>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </table>
            <p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone ">
            </p>
          </div>


          <!-- 하단 메뉴(바로가기, 글쓰기) -->
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

<%--          <table border="1" width="90%">--%>
<%--            <tr align="center">--%>
<%--              <td>--%>
<%--                ${ map.pagingImg }--%>
<%--              </td>--%>
<%--              <td width="100"><button type="button" onclick="location.href='${contextPath}/teachercommunity/write.do';">글쓰기</button></td>--%>
<%--            </tr>--%>
<%--          </table>--%>
          <jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
