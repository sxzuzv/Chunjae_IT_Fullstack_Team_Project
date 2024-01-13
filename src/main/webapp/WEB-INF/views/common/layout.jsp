<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false"
%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  request.setCharacterEncoding("utf-8");
%>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
          integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
          integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
          crossorigin="anonymous"></script>
  <link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
  <link href="${contextPath}/resources/css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen">
  <link href="${contextPath}/resources/css/mobile.css" rel="stylesheet" type="text/css">
  <script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/jquery/jquery.easing.1.3.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/jquery/stickysidebar.jquery.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/jquery/basic-jquery-slider.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script>
  <script>
      // 슬라이드
      $(document).ready(function () {
          $('#ad_main_banner').bjqs({
              'width': 775,
              'height': 145,
              'showMarkers': true,
              'showControls': false,
              'centerMarkers': false
          });
      });
      // 스티키
      $(function () {
          $("#sticky").stickySidebar({
              timer: 100,
              easing: "easeInBounce"
          });
      });
  </script>
  <title><tiles:insertAttribute name="title"/></title>

</head>
<body>
<div id="outer_wrap">
  <div id="wrap">
    <header>
      <tiles:insertAttribute name="header"/>
    </header>
    <div class="clear"></div>
    <div class="flexbox">
      <aside>
        <tiles:insertAttribute name="side"/>
      </aside>
      <article>
        <tiles:insertAttribute name="body"/>
      </article>
      <div class="blank">
        <tiles:insertAttribute name="quickMenu"/>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <footer>
    <tiles:insertAttribute name="footer"/>
  </footer>
</div>
</body>
