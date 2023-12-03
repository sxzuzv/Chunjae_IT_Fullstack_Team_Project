<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
  <title>Title</title>
  <style>
    a {
      text-decoration: none;
      color: inherit;
    }
  </style>
</head>
<body>
<h2>
  <a href="${contextPath}/teachercommunity/list.do">꿀팁 나눠요</a>
</h2>
<h3>지금 가장 인기있는 게시글이에요!</h3>
<table border="1" width="90%">
  <tr>
    <th width="*">제목</th>
    <th width="15%">작성자</th>
    <th width="10%">조회수</th>
  </tr>
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
</table>
<br />

<!-- 검색 폼 -->
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

<!-- 목록 테이블 -->
<table border="1" width="90%">
  <tr>
    <th width="10%">번호</th>
    <th width="*">제목</th>
    <th width="15%">작성자</th>
    <th width="10%">조회수</th>
    <th width="15%">작성일</th>
  </tr>
  <c:choose>
    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
      <tr>
        <td colspan="6" align="center">
          등록된 게시물이 없습니다.
        </td>
      </tr>
    </c:when>
    <c:otherwise>  <!-- 게시물이 있을 때 -->
      <c:forEach items="${ boardLists }" var="row" varStatus="loop">
        <tr align="center">
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

<!-- 하단 메뉴(바로가기, 글쓰기) -->
<table border="1" width="90%">
  <tr align="center">
    <td>
      ${ map.pagingImg }
    </td>
    <td width="100"><button type="button" onclick="location.href='${contextPath}/teachercommunity/write.do';">글쓰기</button></td>
  </tr>
</table>
</body>
</html>
