<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%-- AJAX_COMMENT 테이블을 이용하여 댓글에 대한 저장/변경/삭제 기능을 제공하고 댓글목록을 검색하려 출력하는 JSP문서 --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>AJAX</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <style type="text/css">
    h1 {
      text-align: center;
    }
    .comment_table {
      widows: 500p;
      margin: 0 auto;
      border: 2px solid #cccccc;
      border-collapse: collapse;
    }
    .title {
      width: 100px;
      padding: 5px 10px;
      text-align: center;
      border: 1px solid #cccccc;
    }
    .input {
      padding: 5px 10px;
      border: 1px solid #cccccc;
    }
    .btn {
      text-align: center;
      border: 1px solid #cccccc;
    }

    #comment_add {
      margin-bottom: 5px;
    }

    #comment_modify, #comment_remove {
      margin: 10px;
      display: none;
    }
    #add_message, #modify_message {
      widows: 500p;
      margin: 0 auto;
      margin-bottom: 20px;
      text-align: center;
      color: red;
    }

    #remove_message {
      padding: 3px;
      text-align: center;
      border: 1px solid #cccccc;
    }
    .comment {
      width: 550px;
      margin: 0 auto;
      margin-bottom: 5px;
      padding: 3px;
      border: 2px solid #cccccc;
    }
    .no_comment {
      width: 550px;
      margin: 0 auto;
      padding-bottom: 3px;
      border: 2px solid #cccccc;
      text-align: center;
    }
  </style>
</head>
<body>
<h1>AJAX댓글</h1>
<hr>
<%-- 댓글 입력 영역 --%>
<div id="comment_add">
  <table class="comment_table">
    <tr>
      <td class="title">작성자</td>
      <td class="input"><input type="text" id="writer"></td>
    </tr>
    <tr>
      <td class="title">댓글내용</td>
      <td class="input"><textarea rows="3" cols="50" id="content"></textarea></td>
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

<script type="text/javascript">
  // [문서가 실행되자마자 목록을 출력하기위해 가장먼저 호출]
  loadComment();

  // 댓글목록을 제공하는 JSP문서를 요청하여 응답받아 출력하는 함수
  function loadComment() {
    $.ajax({
      type: "GET",
      url: "comment_list.jsp",
      dataType: "xml",
      success: function(xmlDoc) {
        // 코드확인
        var code=$(xmlDoc).find("code").text();
        if (code=="success") {
          // data를 배열로 저장 >> 이때 꼮꼮 JSON객체로 변환처리해줘야함미덩 [object객체로 인식!]
          var commentArray=JSON.parse($(xmlDoc).find("data").text());

          // 댓글 출력목록의 초기화
          $("#comment_list").children().remove();

          // 반복지시자 이용하여 출력 >> [object객체로 인식!하니까 $넣어서 접근하는고얌]
          $(commentArray).each(function() {
            // 수정을 위해 각각의 div에 고유값인 id를 부여 >> 이때 num활용
            // 삭제를 위해 num부여 >> 이때도 num활용
            $("#comment_list").append("<div id='comment_"+this.num+"' class='comment' num='"+this.num+"'><b>["+this.writer+"]</b><br>"+this.content.replace(/\n/g, "<br>")+"<br>("+this.writeDate+")<br><button>수정</button>&nbsp;<button>삭제</button></div>");
          });
        } else {
          var message=$(xmlDoc).find("message").text();
          $("#comment_list").html("<div class='no_comment'>"+message+"</div>");
        }
      },
      error: function(xhr) {
        alert("ERROR CODE : "+xhr.status);
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
      url: "comment_add.jsp",
      data: "writer="+writer+"&content="+content,     // QueryString형태로 전달
      dataType: "xml",
      success: function(xmlDoc) {
        var code=$(xmlDoc).find("code").text();
        if(code=="success") {
          loadComment();
        }
      },
      error: function(xhr) {
        alert("ERROR CODE : "+xhr.status);
      }
    });
  });

</script>


</body>
</html>
