<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>상세 보기</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>


    <body>
        <header>

            <jsp:include page="${pageContext.request.contextPath}/view/common/header.jsp"></jsp:include>


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
                                            <img src="/Uploads/${ dto.sfile }"
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
                                        <a href="#"
                                           class="btnNormal sizeM btnBasket "
                                           onclick="location.href='/market/pass.do?mode=delete&brdId=${ param.brdId }'">삭제하기</a>
                                        <a href="#"
                                           class="btnNormal sizeM btnBasket "
                                           onclick="location.href='/market/pass.do?mode=edit&brdId=${ param.brdId }'">수정하기</a>
                                        <a href="#"
                                           class="btnSubmit sizeM "
                                           onclick="location.href='/market/list.do'">목록으로
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
                    <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
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
                                                <c:if test="${ not empty dto.ofile and isImage eq true }">
                                                    <br><img src="/Uploads/${ dto.sfile }" class="img-fluid" alt="첨부 이미지"/> <!-- 이미지 클래스 적용 -->
                                                </c:if>
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
                    <%-- 댓글 입력 영역 --%>
                    <div id="comment_add">
                        <table class="comment_table">
                            <tr>
                                <td class="title">댓글내용</td>
                                <td class="input"><textarea rows="3" cols="50" id="comContent"></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="btn"><button type="button" id="add_btn">댓글등록</button></td>
                            </tr>
                        </table>
                        <div id="add_message">&nbsp;</div>
                    </div>

                    <%-- 댓글 목록 출력 영역 --%>
                    <div id="comment_list"></div>

                    <%-- 댓글 변경 영역 --%>
                    <div id="comment_modify">
                        <table class="comment_table">
                            <tr>
                                <td class="title">작성자</td>
                                <td class="input"><input type="text" id="modify_writer"></td>
                            </tr>
                            <tr>
                                <td class="title">댓글내용</td>
                                <td class="input"><textarea rows="3" cols="50" id="modify_content"></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="btn"><button type="button" id="modify_btn">댓글수정</button>&nbsp;
                                    <button type="button" id="modify_cancel_btn">수정취소</button></td>
                            </tr>
                        </table>
                        <div id="modify_message">&nbsp;</div>
                    </div>

                    <%-- 댓글 삭제 영역 --%>
                    <div id="comment_remove">
                        <div id="remove_message">
                            <b>정말로 삭제하꼬니?</b>
                            <button type="button" id="remove_btn">댓글삭제</button>
                            <button type="button" id="remove_cancle_btn">삭제취소</button>
                        </div>
                        <div id="remove_message">&nbsp;</div>
                    </div>

<%--                    <form id="message-form" action="#" method="post" name="frmArticle"--%>
<%--                          enctype="multipart/form-data">--%>
<%--                        <div id="">Comment...</div>--%>
<%--                        <div class="group">--%>
<%--                            <input type="text" id="comContent"--%>
<%--                                   placeholder="댓글을 남겨주세요" name="comContent"--%>
<%--                                   id="messages">--%>
<%--                            <span class="highlight"></span>--%>
<%--                            <span class="bar"></span>--%>
<%--                            <input type=button value="답글쓰기"--%>
<%--                                   onClick="fn_reply_form('${contextPath}/market/addComment.do', ${dto.brdId})">--%>

<%--                            <div style="border-bottom: 1px solid #bdbdbd42; margin: 5px 20px 20px 20px"></div>--%>

<%--                            <c:choose>--%>
<%--                                <c:when test="${ commentList == null }">--%>
<%--                                    <tr height="10">--%>
<%--                                        <td colspan="6">--%>
<%--                                            <p align="center">--%>
<%--                                                <b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>--%>
<%--                                            </p>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:when>--%>
<%--                                <c:when test="${ commentList !=null }">--%>
<%--                                    <c:forEach var="item" items="${ commentList }" varStatus="articleNum">--%>
<%--                                        <div class="card" style="width: 18rem;">--%>
<%--                                            <div class="card-body">--%>
<%--                                                <h5 class="card-title">${item.userId}</h5>--%>
<%--                                                <p class="card-text">${item.comContent}</p>--%>
<%--                                                <h6 class="card-subtitle mb-2 text-muted">등록일자:${item.regDate}   </h6>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div style="border-bottom: 1px solid #bdbdbd42; margin: 5px 20px 20px 20px"></div>--%>
<%--                                    </c:forEach>--%>
<%--                                </c:when>--%>
<%--                            </c:choose>--%>
<%--                        </div>--%>
<%--                    </form>--%>
                </div>
                <hr class="layout">
            </div>
            <hr class="layout">
        </div>

        <script type="text/javascript">
            //script를 body의 상단에 작성하게 되면, 간혹 html이 로드 되기 전에 script를 먼저 불러와버리는 경우가 생긴다.
           // 그렇게 되면 addEventListener을 부여할 DOM을 찾지 못하게 되어 에러가 발생하게 된다. 따라서 가장 아래에 작성함

            // [문서가 실행되자마자 목록을 출력하기위해 가장먼저 호출]
            loadComment();

            // 댓글목록을 제공하는 JSP문서를 요청하여 응답받아 출력하는 함수
            function loadComment() {
                $.ajax({
                    type: "GET",
                    url: "/comment/commentList.do?brdId=${dto.brdId}",
                    dataType: "Json",
                    success: function(commentArray) {

                        // 댓글 출력목록의 초기화
                        $("#comment_list").children().remove();

                        // 반복지시자 이용하여 출력 >> object객체로 인식!하니까 $넣어서 접근
                        $(commentArray).each(function() {
                            // 수정을 위해 각각의 div에 고유값인 id를 부여 >> 이때 num활용
                            // 삭제를 위해 num부여 >> 이때도 num활용
                            $("#comment_list").append("<div id='comment_"+this.comId+ "' class='comment' num='"+this.comId+"'>" +
                                "<b>["+this.userId+"]</b><br>"+this.comContent.replace(/\n/g, "<br>")+
                                "<br>"+this.regDate.year+"년 "+this.regDate.month+"월 "+this.regDate.day+"일<br>" +
                                "<button>수정</button>&nbsp;<button>삭제</button></div>");
                        });
                    },
                    error: function() {
                        alert("에러발생");
                    }
                });
            }

            // [댓글등록] 클릭시 호출될 이벤트핸들러 함수 등록
            $("#add_btn").click(function() {
                // 입력값 유효성검사
                var writer=$("#writer").val();
                if(writer=="") {
                    $("#add_message").html("작성자를 입력하세용!");
                    $("#writer").focus();
                    return;
                }
                var content=$("#content").val();
                if(content=="") {
                    $("#add_message").html("내용도 입력하세용!");
                    $("#content").focus();
                    return;
                }

                // 입력태그 초기화
                $("#writer").val("");
                $("#content").val("");
                $("#add_message").html("");

                // ajax기능으로 요청 및 응답처리
                $.ajax({
                    type: "POST",
                    url: "/comment/addComment.do",
                    data: "brdId="+${ dto.brdId } + "&comContent=" + comContent,  // QueryString형태로 전달
                    dataType: "Json",
                    success: function(obj) {
                        loadComment();
                    },
                    error: function() {
                        alert("에러발생");
                    }
                });
            });

        </script>
    </body>
</html>
