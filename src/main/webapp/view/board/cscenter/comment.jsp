<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%-- AJAX를 이용하여 댓글에 대한 저장/변경/삭제 기능을 제공하고 댓글목록을 검색하려 출력하는 JSP문서 --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>코멘트</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <link rel="stylesheet" href="${contextPath}/css/comment.css" />
</head>
<body>

<%-- 댓글 입력 영역 --%>
<div class = "xans-product-detail">
   <%-- 댓글 목록 출력 영역 --%>
  <div id="comment_list"></div>
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
      url: "${contextPath}/comment/commentList.do?brdId=${dto.brdId}",
      dataType: "Json",
      success: function(commentArray) {

        // 댓글 출력목록의 초기화
        $("#comment_list").children().remove();

        // 반복지시자 이용하여 출력 >> object객체로 인식!하니까 $넣어서 접근
        $(commentArray).each(function() {
          // 수정을 위해 각각의 div에 고유값인 id를 부여 >> 이때 num활용
          // 삭제를 위해 num부여 >> 이때도 num활용
          $("#comment_list").append("<div id='comment_"+this.comId+ "' class='comment' num='"+this.comId+"'>" +
                  "<b>["+this.userId+"]</b>&nbsp;&nbsp;"+this.regDate.year+"년 "+this.regDate.month+"월 "+this.regDate.day+"일" +
                  '<br><br>' +
                  '<div id ="comContent">'+this.comContent.replace(/\n/g, "<br>")+"</div>" +
                  "<br>");
        });
      },
      error: function() {
        alert("list 로드시 에러발생");
      }
    });
  }

  // [댓글등록] 클릭시 호출될 이벤트핸들러 함수 등록
  $("#add_btn").click(
          function() {
            // 입력값 유효성검사
            var comContent=$("#comContent").val();
            if(comContent=="") {
              $("#add_message").html("내용을 입력하세요");
              $("#comContent").focus();
              return;
            }

            // 입력태그 초기화
            $("#comContent").val("");
            $("#add_message").html("");

            // ajax기능으로 요청 및 응답처리
            $.ajax({
              type: "POST",
              url: "${contextPath}/comment/addComment.do",
              data: "brdId="+${ dto.brdId } + "&comContent=" + comContent,  // QueryString형태로 전달
              dataType: "Json",
              success: function(result) {
                loadComment();
              },
              error: function() {
                alert("댓글 작성시 에러발생");
              }
            });
          });

  // [댓글삭제] 클릭시 호출될 이벤트핸들러 함수 등록
  $("#comment_list").on("click", "button:contains('삭제')",
          function() {
            // 삭제할 댓글의 고유번호(num)를 가져온다.
            var comId = $(this).parent().attr("num");

            // ajax기능으로 요청 및 응답처리
            $.ajax({
              type: "POST",
              url: "${contextPath}/comment/deleteComment.do",
              data: "comId=" + comId,  // QueryString형태로 전달
              dataType: "Json",
              success: function(result) {
                // 삭제 성공시 댓글목록을 다시 불러온다.
                loadComment();
              },
              error: function() {
                alert("삭제시 에러발생");
              }
            });
          });

  // [댓글수정] 클릭시 호출될 이벤트핸들러 함수 등록
  $("#comment_list").on("click", "button:contains('수정')", function() {
    // 수정할 댓글의 고유번호(num)와 내용을 가져온다.
    var comId = $(this).parent().attr("num");
    var comContent = $(this).parent().find("#comContent").text();

    // 수정할 댓글의 내용을 textarea 태그로 바꾼다.
    $(this).parent().html("<textarea id='editContent' rows='3' cols='50'>"+comContent+"</textarea><br><br>" +
            "<button id='save_btn'>저장</button>&nbsp;<button id='cancel_btn'>취소</button>");

    // [저장] 버튼에 수정할 댓글의 고유번호를 속성으로 부여한다.
    $("#save_btn").attr("num", comId);
  });

  // [저장] 클릭시 호출될 이벤트핸들러 함수 등록
  $("#comment_list").on("click", "#save_btn", function() {
    // 수정할 댓글의 고유번호(num)와 새로운 내용을 가져온다.
    var comId = $(this).attr("num");
    var comContent = $("#editContent").val();

    // 입력값 유효성검사
    if(comContent=="") {
      alert("내용을 입력하세요");
      $("#editContent").focus();
      return;
    }

    // ajax기능으로 요청 및 응답처리
    $.ajax({
      type: "POST",
      url: "${contextPath}/comment/updateComment.do",
      data: "comId=" + comId + "&comContent=" + comContent,  // QueryString형태로 전달
      dataType: "Json",
      success: function(result) {
        // 수정 성공시 댓글목록을 다시 불러온다.
        loadComment();
      },
      error: function() {
        alert("수정시 에러발생");
      }
    });
  });

  // [취소] 클릭시 호출될 이벤트핸들러 함수 등록
  $("#comment_list").on("click", "#cancel_btn", function() {
    // 댓글목록을 다시 불러온다.
    loadComment();
  });

</script>


</body>
</html>
