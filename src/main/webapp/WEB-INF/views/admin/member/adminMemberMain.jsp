<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="/resources/css/admin.css">
  <script>
      function search_member(search_period) {
          temp = calcPeriod(search_period);
          var date = temp.split(",");
          beginDate = date[0];
          endDate = date[1];
          //alert("beginDate:"+beginDate+",endDate:"+endDate);
          //return ;

          var formObj = document.createElement("form");

          var formObj = document.createElement("form");
          var i_beginDate = document.createElement("input");
          var i_endDate = document.createElement("input");

          i_beginDate.name = "beginDate";
          i_beginDate.value = beginDate;
          i_endDate.name = "endDate";
          i_endDate.value = endDate;

          formObj.appendChild(i_beginDate);
          formObj.appendChild(i_endDate);
          document.body.appendChild(formObj);
          formObj.method = "get";
          formObj.action = "${contextPath}/admin/member/adminMemberMain.do";
          formObj.submit();
      }


      function calcPeriod(search_period) {
          var dt = new Date();
          var beginYear, endYear;
          var beginMonth, endMonth;
          var beginDay, endDay;
          var beginDate, endDate;

          endYear = dt.getFullYear();
          endMonth = dt.getMonth() + 1;
          endDay = dt.getDate();
          if (search_period == 'today') {
              beginYear = endYear;
              beginMonth = endMonth;
              beginDay = endDay;
          } else if (search_period == 'one_week') {
              beginYear = dt.getFullYear();
              if (endDay - 7 < 1) {
                  beginMonth = dt.getMonth();
              } else {
                  beginMonth = dt.getMonth() + 1;
              }

              dt.setDate(endDay - 7);
              beginDay = dt.getDate();

          } else if (search_period == 'two_week') {
              beginYear = dt.getFullYear();
              if (endDay - 14 < 1) {
                  beginMonth = dt.getMonth();
              } else {
                  beginMonth = dt.getMonth() + 1;
              }
              dt.setDate(endDay - 14);
              beginDay = dt.getDate();
          } else if (search_period == 'one_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 1);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          } else if (search_period == 'two_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 2);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          } else if (search_period == 'three_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 3);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          } else if (search_period == 'four_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 4);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          }

          if (beginMonth < 10) {
              beginMonth = '0' + beginMonth;
              if (beginDay < 10) {
                  beginDay = '0' + beginDay;
              }
          }
          if (endMonth < 10) {
              endMonth = '0' + endMonth;
              if (endDay < 10) {
                  endDay = '0' + endDay;
              }
          }
          endDate = endYear + '-' + endMonth + '-' + endDay;
          beginDate = beginYear + '-' + beginMonth + '-' + beginDay;
          //alert(beginDate+","+endDate);
          return beginDate + "," + endDate;
      }


      function fn_member_detail(order_id) {
          //alert(order_id);
          var frm_delivery_list = document.frm_delivery_list;


          var formObj = document.createElement("form");
          var i_order_id = document.createElement("input");

          i_order_id.name = "order_id";
          i_order_id.value = order_id;

          formObj.appendChild(i_order_id);
          document.body.appendChild(formObj);
          formObj.method = "post";
          formObj.action = "/bookshop01/admin/member/memberDetail.do";
          formObj.submit();

      }


      function fn_enable_detail_search(r_search) {
          var frm_delivery_list = document.frm_delivery_list;
          t_beginYear = frm_delivery_list.beginYear;
          t_beginMonth = frm_delivery_list.beginMonth;
          t_beginDay = frm_delivery_list.beginDay;
          t_endYear = frm_delivery_list.endYear;
          t_endMonth = frm_delivery_list.endMonth;
          t_endDay = frm_delivery_list.endDay;
          s_search_type = frm_delivery_list.s_search_type;
          t_search_word = frm_delivery_list.t_search_word;
          btn_search = frm_delivery_list.btn_search;

          if (r_search.value == 'detail_search') {
              //alert(r_search.value);
              t_beginYear.disabled = false;
              t_beginMonth.disabled = false;
              t_beginDay.disabled = false;
              t_endYear.disabled = false;
              t_endMonth.disabled = false;
              t_endDay.disabled = false;

              s_search_type.disabled = false;
              t_search_word.disabled = false;
              btn_search.disabled = false;
          } else {
              t_beginYear.disabled = true;
              t_beginMonth.disabled = true;
              t_beginDay.disabled = true;
              t_endYear.disabled = true;
              t_endMonth.disabled = true;
              t_endDay.disabled = true;

              s_search_type.disabled = true;
              t_search_word.disabled = true;
              btn_search.disabled = true;
          }

      }

      //상세조회 버튼 클릭 시 수행
      function fn_detail_search() {
          var frm_delivery_list = document.frm_delivery_list;

          beginYear = frm_delivery_list.beginYear.value;
          beginMonth = frm_delivery_list.beginMonth.value;
          beginDay = frm_delivery_list.beginDay.value;
          endYear = frm_delivery_list.endYear.value;
          endMonth = frm_delivery_list.endMonth.value;
          endDay = frm_delivery_list.endDay.value;
          search_type = frm_delivery_list.s_search_type.value;
          search_word = frm_delivery_list.t_search_word.value;

          var formObj = document.createElement("form");
          var i_command = document.createElement("input");
          var i_beginDate = document.createElement("input");
          var i_endDate = document.createElement("input");
          var i_search_type = document.createElement("input");
          var i_search_word = document.createElement("input");


          i_command.name = "command";
          i_beginDate.name = "beginDate";
          i_endDate.name = "endDate";
          i_search_type.name = "search_type";
          i_search_word.name = "search_word";

          i_command.value = "list_detail_order_goods";
          i_beginDate.value = beginYear + "-" + beginMonth + "-" + beginDay;
          i_endDate.value = endYear + "-" + endMonth + "-" + endDay;
          i_search_type.value = search_type;
          i_search_word.value = search_word;

          formObj.appendChild(i_command);
          formObj.appendChild(i_beginDate);
          formObj.appendChild(i_endDate);
          formObj.appendChild(i_search_type);
          formObj.appendChild(i_search_word);
          document.body.appendChild(formObj);
          formObj.method = "post";
          formObj.action = "/bookshop01/admin/member/memberDetail.do";
          formObj.submit();
      }
  </script>
</head>
<body>
<h1>회원 관리</h1>
<form name="frm_delivery_list">
<%--  <table class="search_option">--%>
<%--    <tbody>--%>
<%--    <tr>--%>
<%--      <td colspan="2">--%>
<%--        <input id="simple_search" type="radio" name="r_search_option" value="simple_search" checked--%>
<%--               onClick="fn_enable_detail_search(this)"/>--%>
<%--        <label for="simple_search">간단 조회</label>--%>
<%--        <input id="detail_search" type="radio" name="r_search_option" value="detail_search"--%>
<%--               onClick="fn_enable_detail_search(this)"/>--%>
<%--        <label for="detail_search">상세 조회</label>--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>--%>
<%--        <select name="curYear">--%>
<%--          <c:forEach var="i" begin="0" end="5">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${endYear==endYear-i}">--%>
<%--                <option value="${endYear }" selected>${endYear  }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <option value="${endYear-i }">${endYear-i }</option>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>년 <select name="curMonth">--%>
<%--        <c:forEach var="i" begin="1" end="12">--%>
<%--          <c:choose>--%>
<%--            <c:when test="${endMonth==i }">--%>
<%--              <option value="${i }" selected>${i }</option>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--              <option value="${i }">${i }</option>--%>
<%--            </c:otherwise>--%>
<%--          </c:choose>--%>
<%--        </c:forEach>--%>
<%--      </select>월--%>
<%--        --%>
<%--        <select name="curDay">--%>
<%--          <c:forEach var="i" begin="1" end="31">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${endDay==i }">--%>
<%--                <option value="${i }" selected>${i }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <option value="${i }">${i }</option>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>일 &nbsp;이전--%>
<%--      </td>--%>
<%--      <td>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('today')">--%>
<%--          당일--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('one_week')">--%>
<%--          1주--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('two_week')">--%>
<%--          2주--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('one_month')">--%>
<%--          1개월--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('two_month')">--%>
<%--          2개월--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('three_month')">--%>
<%--          3개월--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('four_month')">--%>
<%--          4개월--%>
<%--        </a>--%>
<%--        까지 조회--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--    --%>
<%--    <tr>--%>
<%--      <td colspan="2">--%>
<%--        조회 기간:--%>
<%--        <select name="beginYear" disabled>--%>
<%--          <c:forEach var="i" begin="0" end="5">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${beginYear==beginYear-i }">--%>
<%--                <option value="${beginYear-i }" selected>${beginYear-i  }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <option value="${beginYear-i }">${beginYear-i }</option>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>년--%>
<%--        <select name="beginMonth" disabled>--%>
<%--          <c:forEach var="i" begin="1" end="12">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${beginMonth==i }">--%>
<%--                <option value="${i }" selected>${i }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <c:choose>--%>
<%--                  <c:when test="${i <10 }">--%>
<%--                    <option value="0${i }">0${i }</option>--%>
<%--                  </c:when>--%>
<%--                  <c:otherwise>--%>
<%--                    <option value="${i }">${i }</option>--%>
<%--                  </c:otherwise>--%>
<%--                </c:choose>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>월--%>
<%--        <select name="beginDay" disabled>--%>
<%--          <c:forEach var="i" begin="1" end="31">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${beginDay==i }">--%>
<%--                <option value="${i }" selected>${i }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <c:choose>--%>
<%--                  <c:when test="${i <10 }">--%>
<%--                    <option value="0${i }">0${i }</option>--%>
<%--                  </c:when>--%>
<%--                  <c:otherwise>--%>
<%--                    <option value="${i }">${i }</option>--%>
<%--                  </c:otherwise>--%>
<%--                </c:choose>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>일 &nbsp; ~--%>
<%--        --%>
<%--        <select name="endYear" disabled>--%>
<%--          <c:forEach var="i" begin="0" end="5">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${endYear==endYear-i }">--%>
<%--                <option value="${2016-i }" selected>${2016-i  }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <option value="${2016-i }">${2016-i }</option>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>년--%>
<%--        <select name="endMonth" disabled>--%>
<%--          <c:forEach var="i" begin="1" end="12">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${endMonth==i }">--%>
<%--                <option value="${i }" selected>${i }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <c:choose>--%>
<%--                  <c:when test="${i <10 }">--%>
<%--                    <option value="0${i }">0${i }</option>--%>
<%--                  </c:when>--%>
<%--                  <c:otherwise>--%>
<%--                    <option value="${i }">${i }</option>--%>
<%--                  </c:otherwise>--%>
<%--                </c:choose>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>월--%>
<%--        <select name="endDay" disabled>--%>
<%--          <c:forEach var="i" begin="1" end="31">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${endDay==i }">--%>
<%--                <option value="${i }" selected>${i }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <c:choose>--%>
<%--                  <c:when test="${i<10}">--%>
<%--                    <option value="0${i}">0${i }</option>--%>
<%--                  </c:when>--%>
<%--                  <c:otherwise>--%>
<%--                    <option value="${i}">${i }</option>--%>
<%--                  </c:otherwise>--%>
<%--                </c:choose>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>--%>
<%--      --%>
<%--      </td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td colspan="2">--%>
<%--        <select name="s_search_type" disabled>--%>
<%--          <option value="all" checked>전체</option>--%>
<%--          <option value="member_name">회원 이름</option>--%>
<%--          <option value="member_id">회원 아이디</option>--%>
<%--          <option value="member_hp_num">회원 휴대폰 번호</option>--%>
<%--          <option value="member_addr">회원 주소</option>--%>
<%--        </select>--%>
<%--        <input type="text" size="30" name="t_search_word" disabled/>--%>
<%--        <input type="button" value="조회" name="btn_search" onClick="fn_detail_search()" disabled/>--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--    </tbody>--%>
<%--  </table>--%>
  <div class="clear">
  </div>
  
  <div class="clear"></div>
  <table class="list_view member_list">
    <thead>
    <tr>
      <td class="fixed">회원 아이디</td>
      <td class="fixed">회원 이름</td>
      <td>휴대폰 번호</td>
      <td>주소</td>
      <td>가입일</td>
      <%--				<td>탈퇴 여부</td>--%>
    </tr>
    </thead>
    <tbody>
    <c:choose>
    <c:when test="${empty member_list}">
    <tr>
      <td colspan=5 class="fixed">
        <strong>조회된 회원이 없습니다.
      </td>
    </tr>
    </c:when>
    <c:otherwise>
    <c:forEach var="item" items="${member_list}" varStatus="item_num">
    <tr>
      <td>
        
        <a href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.memberId}">
            ${item.memberId}
        </a>
      </td>
      <td>
          ${item.memberName}<br>
      </td>
      <td>
          ${item.memberHp1}-${item.memberHp2}-${item.memberHp3}<br>
      </td>
      <td align="left">
          ${item.roadAddress}<br>
          ${item.jibunAddress}<br>
          ${item.namujiAddress}<br>
      </td>
      <td>
        <c:set var="join_date" value="${item.joinDate}"/>
        <c:set var="arr" value="${fn:split(join_date,' ')}"/>
        <c:out value="${arr[0]}"/>
      </td>
        <%--				    <td width=10%>--%>
        <%--				       <c:choose>--%>
        <%--				         <c:when test="${item.delYn=='N' }">--%>
        <%--				           <strong>활동 중</strong>--%>
        <%--				         </c:when>--%>
        <%--				         <c:otherwise>--%>
        <%--				           <strong>탈퇴</strong>--%>
        <%--				         </c:otherwise>--%>
        <%--				       </c:choose>--%>
        <%--				    </td>--%>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
  </table>
  <table class="page_controller">
    <tr>
      <td colspan=8 class="fixed">
        <c:forEach var="page" begin="1" end="10" step="1">
          <c:if test="${chapter >1 && page==1 }">
            <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre
              &nbsp;</a>
          </c:if>
          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
          <c:if test="${page ==10 }">
            <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp;
              next</a>
          </c:if>
        </c:forEach>
      </td>
    </tr>
    </tbody>
  </table>
</form>
<div class="clear"></div>
<c:choose>
  <c:when test="${not empty order_goods_list }">
    <DIV id="page_wrap">
      <c:forEach var="page" begin="1" end="10" step="1">
        <c:if test="${chapter >1 && page==1 }">
          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre
            &nbsp;</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
        <c:if test="${page ==10 }">
          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp;
            next</a>
        </c:if>
      </c:forEach>
    </DIV>
  </c:when>
</c:choose>
</body>
</html>

