<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>TEACHER MARKET</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }

    h2 {
      text-align: center;
      color: #333;
      margin-top: 20px;
    }

    .detailView {
      border-collapse: collapse;
      width: 90%;
      margin: 20px auto;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    .detailView colgroup {
      width: 15% 35% 15% auto;
    }

    .detailView th, .detailView td {
      border: 1px solid #ddd;
      padding: 15px;
      text-align: left;
    }

    .detailView th {
      background-color: #35497a;
      color: white;
    }

    .detailView tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .detailView td[colspan="3"] {
      white-space: pre-wrap;
    }

    .detailView img {
      max-width: 100%;
      height: auto;
      margin-top: 10px;
    }


    button {
      margin-top: 10px;
      padding: 10px;
      /*font-size: 30px;*/
      /*background-color: #35497a;*/
      /*color: white;*/
      border: none;
      cursor: pointer;

    }

    .btnedit {
      font-size: 20px;
      color: black;
      background-color:#3dd5f3;
      width: 100px;
      height: 45px;
      border-radius: 10px;
      margin-left: 43%;
    }

    .btndel {
      font-size: 20px;
      color: black;
      background-color: #ee2a27;
      width: 100px;
      height: 45px;
      border-radius: 10px;
    }

    .btnrep {
      font-size: 20px;
      color: white;
      background-color: red;
      width: 100px;
      height: 45px;
      border-radius: 10px;
      margin-left: 43%;
    }

    .btnlist {
      font-size: 20px;
      color: black;
      width: 130px;
      height: 45px;
      border-radius: 10px;
    }

  </style>

</head>
<body>
<header>

  <jsp:include page="${contextPath}/view/common/header.jsp"></jsp:include>

</header>

<br /><br />
<h2>
  게시글 상세 보기(View)
</h2>

<br />
<table class="detailView" border="1" width="90%">
  <colgroup>
    <col width="15%"/> <col width="35%"/>
    <col width="15%"/> <col width="*"/>
  </colgroup>

  <!-- 게시글 정보 -->
  <tr>
    <td>작성자</td> <td>${ dto.userId }</td>
  </tr>
  <tr>
    <td>작성일</td> <td>${ dto.regDate }</td>
    <td>조회수</td> <td>${ dto.viewCnt }</td>
  </tr>
  <tr>
    <td>제목</td>
    <td colspan="3">${ dto.title }</td>
  </tr>
  <tr>
    <td>내용</td>
    <td colspan="3" height="100">
      ${ dto.content }
      <c:if test="${ not empty dto.ofile and isImage eq true }">
        <br><img src="../Uploads/${ dto.sfile }" style="max-width:100%;"/>
      </c:if>
    </td>
  </tr>

  <!-- 첨부파일 -->
  <tr>
    <td>첨부파일</td>
    <td>
      <c:if test="${ not empty dto.ofile }">
        ${ dto.ofile }
<%--                <a href="/teachercommunity/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.brdId }">--%>
<%--                  [다운로드]--%>
<%--                </a>--%>
      </c:if>
    </td>
  </tr>
</table>

  <!-- 하단 메뉴(버튼) -->
<%--  <tr>--%>
<%--    <td colspan="4" align="center">--%>
<br />
  <div>
      <c:set var="userId" value="${ userId }" />
      <c:set var="dtouserId" value="${ dto.userId }" />
      <c:set var="cateSub" value="${ cateSub }" />
      <%
        String cateSub = (String)request.getParameter("cateSub");
      %>
      <%
        String userId = (String)request.getSession().getAttribute("userId");
      %>
      <c:choose>
        <c:when test="${ dtouserId eq userId }">
          <button class="btnedit" type="button" onclick="location.href='${contextPath}/teachercommunity/pass.do?mode=edit&brdId=${ param.brdId }';">
            수정하기
          </button>
          <button class="btndel" type="button" onclick="location.href='${contextPath}/teachercommunity/pass.do?mode=delete&brdId=${ param.brdId }';">
            삭제하기
          </button>
          <button class="btnlist" type="button" onclick="location.href='${contextPath}/teachercommunity/list.do?cateSub=${ cateSub }';">
            목록 바로가기
          </button>
        </c:when>
        <c:otherwise>
          <button class="btnrep" type="button"><a href="#">신고하기</a></button>
          <button class="btnlist" type="button" onclick="location.href='${contextPath}/teachercommunity/list.do?cateSub=${ cateSub }';">
            목록 바로가기
          </button>
        </c:otherwise>
      </c:choose>
<%--    </td>--%>
<%--  </tr>--%>
  </div>
</body>
</html>

