<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false"
%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    var loopSearch = true;

    function keywordSearch() {
        if (loopSearch == false)
            return;
        var value = document.frmSearch.searchWord.value;
        $.ajax({
            type: "get",
            async: true, //false인 경우 동기식으로 처리한다.
            url: "${contextPath}/goods/keywordSearch.do",
            data: {keyword: value},
            success: function (data, textStatus) {
                var jsonInfo = JSON.parse(data);
                displayResult(jsonInfo);
            },
            error: function (data, textStatus) {
                alert("에러가 발생했습니다." + data);
            },
            complete: function (data, textStatus) {
                //alert("작업을완료 했습니다");

            }
        }); //end ajax
    }

    function displayResult(jsonInfo) {
        var count = jsonInfo.keyword.length;
        if (count > 0) {
            var html = '';
            for (var i in jsonInfo.keyword) {
                html += "<a href=\"javascript:select('" + jsonInfo.keyword[i] + "')\">" + jsonInfo.keyword[i] + "</a><br/>";
            }
            var listView = document.getElementById("suggestList");
            listView.innerHTML = html;
            show('suggest');
        } else {
            hide('suggest');
        }
    }

    function select(selectedKeyword) {
        document.frmSearch.searchWord.value = selectedKeyword;
        loopSearch = false;
        hide('suggest');
    }

    function show(elementId) {
        var element = document.getElementById(elementId);
        if (element) {
            element.style.display = 'block';
        }
    }

    function hide(elementId) {
        var element = document.getElementById(elementId);
        if (element) {
            element.style.display = 'none';
        }
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
        crossorigin="anonymous"></script>
<body>
<div id="logo">
  <a href="${contextPath}/main/main.do">
    <img width="269" height="100" alt="booktopia" src="${contextPath}/resources/image/logo.png">
  </a>
</div>
<div class="head_content">
  <div id="head_link">
    <ul class="nav-menu">
        <sec:authorize access="isAuthenticated()">
          <form id="logout" action="/logout" method="POST">
            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
          </form>
          <li class="nav-item"><a class="nav-link" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
          <li class="nav-item"><a class="nav-link" href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
          <li class="nav-item"><a class="nav-link" href="${contextPath}/cart/myCartList.do">장바구니</a></li>
          <li class="nav-item"><a class="nav-link" href="${contextPath}/mypage/listMyOrderHistory.do">주문배송</a></li>
        </sec:authorize>

        <sec:authorize access="isAnonymous()">
          <li class="nav-item"><a class="nav-link" href="${contextPath}/member/loginForm.do">로그인</a></li>
          <li class="nav-item"><a class="nav-link" href="${contextPath}/member/memberForm.do">회원가입</a></li>
        </sec:authorize>

      <li class="nav-item"><a class="nav-link" href="${contextPath}/notice/noticeList.do">공지사항</a></li>

      <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="no_line nav-item"><a class="nav-link" href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
      </sec:authorize>
    </ul>
  </div>
  <br>
  <div id="search">
    <form name="frmSearch" action="${contextPath}/goods/searchGoods.do">
      <%--input 태그에 onkeyup을 사용해 키를 누를때마다 filter()라는 함수를 실행시키기 --%>
      <input name="searchWord" class="main_input" type="text" onKeyUp="keywordSearch()">
      <input type="submit" name="search" class="btn1" value="검 색">
    </form>
    <div id="suggest">
      <div id="suggestList"></div>
    </div>
  </div>
</div>
</body>
</html>
