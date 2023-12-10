<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>상세 보기</title>


    </head>


    <body>
        <header>

            <jsp:include page="/view/common/header.jsp"></jsp:include>

        </header>

        <div id="wrap">
            <div id="container">
                <div id="contents">
                    <div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
                        <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                            <div class="titleArea">
                                <h2>
                                    <font color="#555555">판매글 상세페이지</font>
                                </h2>
                                <p>판매글 상세입니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="xans-element- xans-product xans-product-detail">
                        <div class="detailArea ">
                            <div class="xans-element- xans-product xans-product-image imgArea ">
                                <div class="keyImg">
                                    <div class="thumbnail">
                                        <a href="#"
                                           alt=""
                                           onclick="window.open(this.href, &#39;image_zoom2&#39;, &#39;toolbar=no,scrollbars=auto,resizable=yes,width=450,height=693,left=0,top=0&#39;, this);return false;">
                                            <img src="${contextPath}/Uploads/${ dto.sfile }"
                                                 alt="" class="BigImage "> </a>
                                        <div id="zoom_wrap"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="infoArea">
                                <span class="icon"> </span>
                                <div class="headingArea">
                                    <h2>
                                        <em class="summary">[${ dto.status }]</em>
                                        <strong>${ dto.title }</strong>
                                    </h2>
                                </div>

                                <div class="product-price-table">
                                    <dl>
                                        <dt>판매가</dt>
                                        <dd class="product-price">
                                            <strong>${ dto.price }<span>원</span></strong>
                                        </dd>
                                    </dl>
                                </div>

                                <div class="xans-element- xans-product xans-product-detaildesign">
                                    <table border="1" summary="" class="prdTable">
                                        <caption> 기본 정보</caption>
                                        <tbody>
                                        <tr>
                                        </tr>
                                        <tr rel="카테고리" class=" xans-record-">
                                            <th scope="row"><span style="font-size:17px;color:#333333;">카테고리</span></th>
                                            <td><span style="font-size:17px;color:#333333;">
                                                            <c:choose>
                                                                <c:when test="${ dto.cateSub eq 1}"> 교재 </c:when>
                                                                <c:when test="${ dto.cateSub eq 2}"> 교구 </c:when>
                                                                <c:when test="${ dto.cateSub eq 3}"> 일상 용품 </c:when>
                                                                <c:otherwise> 기타 </c:otherwise>
                                                            </c:choose>
                                                        </span></td>
                                        </tr>
                                        <tr rel="작성일" class=" xans-record-">
                                            <th scope="row"><span style="font-size:17px;color:#333333;">작성일</span></th>
                                            <td><span style="font-size:17px;color:#333333;">${ dto.regDate }</span></td>
                                        </tr>
                                        <tr rel="조회수" class=" xans-record-">
                                            <th scope="row"><span style="font-size:17px;color:#333333;">조회수</span></th>
                                            <td><span style="font-size:17px;color:#333333;">${ dto.viewCnt }</span></td>
                                        </tr>
                                        <tr rel="작성자" class=" xans-record-">
                                            <th scope="row"><span style="font-size:17px;color:#333333;">작성자</span></th>
                                            <td><span style="font-size:17px;color:#333333;">${ dto.userId }</span></td>
                                        </tr>
                                        <tr rel="거래희망지역" class=" xans-record-">
                                            <th scope="row"><span style="font-size:17px;color:#333333;">거래희망지역</span>
                                            </th>
                                            <td><span style="font-size:17px;color:#333333;">${ dto.dealAddress }</span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="product-price-table delivery-table">
                                    <dl>
                                        <dt>배송비</dt>
                                        <dd class=""><span style="font-size:17px;color:#333333;"><span
                                                class="delv_price_B"><input id="delivery_cost_prepaid"
                                                                            name="delivery_cost_prepaid" value="P"
                                                                            type="hidden"><strong>3,500원</strong> (편의점 택배 이용 시
                                                        )</span></span><br><br>제주도 및 도서산간 지역 추가 배송비 3,000원</dd>
                                    </dl>
                                </div>


                                <div class="xans-element- xans-product xans-product-action ">
                                    <div class="ec-base-button gColumn">

                                        <c:choose>
                                            <c:when test="${ dto.userId eq SessionUserId }">
                                                <a href="#"
                                                   class="btnNormal sizeM btnBasket "
                                                   onclick="location.href='${contextPath}/market/pass.do?mode=delete&brdId=${ param.brdId }'">삭제하기</a>
                                                <a href="#"
                                                   class="btnNormal sizeM btnBasket "
                                                   onclick="location.href='${contextPath}/market/pass.do?mode=edit&brdId=${ param.brdId }'">수정하기</a>
                                            </c:when>
                                            <c:otherwise>
                                            <%--신고하기 기능 사용시 data-bs-toggle, data-bs-target, data-bs-whatever 설정을 아래와 같이 진행. a태그 or 버튼여부 무관--%>
                                                <a href="#"
                                                   class="btnNormal sizeM btnBasket "
                                                   data-bs-toggle="modal" data-bs-target="#reportModal" data-bs-whatever="@mdo">신고하기</a>
                                            </c:otherwise>
                                        </c:choose>

                                        <a href="#"
                                           class="btnSubmit sizeM "
                                           onclick="location.href='${contextPath}/market/list.do'">목록으로
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="xans-element- xans-product xans-product-additional">
                        <div id="prdDetail" class="ec-base-tab gFlex ">
                            <ul class="menu">
                            </ul>
                        </div>
                    </div>
                    <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 xans-product-detail">
                        <div class="ec-base-table typeWrite ">
                            <table border="1" summary="">
                                <caption>게시판 상세</caption>
                                <colgroup>
                                    <col style="width:130px;">
                                    <col style="width:auto;">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td>${ dto.title }</td>
                                </tr>
                                <tr>
                                    <th scope="row">작성자</th>
                                    <td> ${ dto.userId } </td>
                                </tr>
                                <tr>
                                    <th scope="row">작성일</th>
                                    <td>${ dto.regDate }</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="detail">
                                            <div class="fr-view fr-view-article">
                                                ${ dto.content }
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="attach">
                                    <th scope="row">첨부파일</th>
                                    <td>
                                        <c:if test="${ not empty dto.ofile }">
                                            ${ dto.ofile }
                                        </c:if>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <jsp:include page="/view/common/comment.jsp"></jsp:include>

                    <hr class="layout">
                </div>
                <hr class="layout">
            </div>
        </div>

        <jsp:include page="/view/common/report.jsp"></jsp:include>

    </body>
    <jsp:include page="/view/common/footer.jsp" flush="false"/>
</html>
