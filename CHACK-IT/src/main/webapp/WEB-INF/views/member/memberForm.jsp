<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
  <meta charset="utf-8">
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script>

      function execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function (data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                      extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraRoadAddr !== '') {
                      extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                  if (fullRoadAddr !== '') {
                      fullRoadAddr += extraRoadAddr;
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('roadAddress').value = fullRoadAddr;
                  document.getElementById('jibunAddress').value = data.jibunAddress;
                  document.getElementById("namujiAddress").focus();

                  // // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                  // if (data.autoRoadAddress) {
                  // 	//예상되는 도로명 주소에 조합형 주소를 추가한다.
                  // 	var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                  // 	document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                  //
                  // } else if (data.autoJibunAddress) {
                  // 	var expJibunAddr = data.autoJibunAddress;
                  // 	document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                  // } else {
                  // 	document.getElementById('guide').innerHTML = '';
                  // }

              }
          }).open();
      }
  </script>
  <script>
    let idcheck=false;
    function submitCheck() {
      // idcheck가 true인지 확인
      if (idcheck) {
        // true일 경우 폼 제출
        return true;
      } else {
        // false일 경우 알림 메시지 표시
        alert("아이디를 다시 확인 해주세요.");
        return false;
      }
    }
      function fn_overlapped() {
        var _id = $("#member_id").val();
        var pattern = /^[A-Za-z]{1}[A-Za-z0-9]{4,19}$/;

        if (!pattern.test(_id)) {
          // 아이디 패턴이 맞지 않을 때의 처리
          $('.id_ok').css("display", "none");
          $('.id_already').css("display", "none");
          $('.id_valid').css("display", "inline-block");
          return;
        }else{
          $('.id_valid').css("display", "none");
        }
          $.ajax({
              type: "post",
              async: false,
              url: "${contextPath}/member/overlapped.do",
              dataType: "text",
              data: {id: _id},
              success: function (data) {
                  if (data == 'false') {
                      $('.id_ok').css("display","inline-block");
                      $('.id_already').css("display", "none");
                      $('#member_id').val(_id);
                      idcheck=true;

                  } else {
                      $('.id_already').css("display","inline-block");
                      $('.id_ok').css("display", "none");
                      $('#id').val('');
                      idcheck=false;
                  }
              },
              error: function (data) {
                  alert("에러가 발생했습니다.");
                  idcheck=false;
              },

          });  //end ajax
      }


      document.addEventListener('DOMContentLoaded', function () {//페이지로드후 실행
        fn_overlapped();
          const domainListEl = document.querySelector('#domainlist');//도메인 리스트 정의
          const domainInputEl = document.querySelector('#domaintxt');//직접입력 도메인 정의

          domainListEl.addEventListener('change', (event) => {
              if (event.target.value !== "type") {//직접입력 도메인 선택 안했을때
                  domainInputEl.value = event.target.value;//선택한 도메인을 input 에 입력
                  domainInputEl.readOnly = true;
              } else {//직접입력 도메인 선택시
                  domainInputEl.value = "";//input내용 초기화
                  domainInputEl.readonly = false;
              }
          });
      });

      function setSmsValue(event) {//sms 체크박스 함수
          const checked = !event.target.checked;//true or false
          const tag = document.getElementById("smsstsYn");
          if (checked) {
              event.target.checked = false;
              tag.value = 'N';
          } else {
              event.target.checked = true;
              tag.value = 'Y';
          }
      }

      function setEmailValue(event) {//이메일 체크박스 함수
        const checked = !event.target.checked; // true or false
        const tag = document.getElementById("emailstsYn");
        if (checked) {
          event.target.checked = false;
          tag.value = 'N';
        } else {
          event.target.checked = true;
          tag.value = 'Y';
        }
      }


  
  </script>
</head>
<body>
<h3>필수입력사항</h3>
<form:form modelAttribute="memberVO" action="${contextPath}/member/addMember.do" method="post"
           class="frmMember" onsubmit="return submitCheck()">
  <div id="detail_table">
    <table>
      <tbody>
      <tr class="dot_line">
        <th class="fixed_join">아이디</th>
        <td>
          <form:input path="memberId" type="text" id="member_id" maxlength="16" oninput="fn_overlapped()"/>
<%--          <input type="button" id="btnOverlapped" value="중복체크" oninput="fn_overlapped()"/>--%>
          <span class="id_ok" style="display: none; color:#008000; font-size: 13px;">사용 가능한 아이디입니다.</span>
          <span class="id_already" style="display: none; color:#6A82FB; font-size: 13px;">누군가 이 아이디를 사용하고 있어요.</span>
          <span class="id_valid" style="display: none; color:black; font-size: 13px;">아이디는 5~16자리. 영어와 숫자로 입력해주세요.</span>
          <form:errors path="memberId" cssStyle="font-size: 13px; color: red" />
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">비밀번호</th>
        <td><form:input path="memberPw" type="password" maxlength="16"/>
        <form:errors path="memberPw" cssStyle="font-size: 13px; color: red" />
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">이름</th>
        <td><form:input path="memberName" type="text" size="20"/>
          <form:errors path="memberName" cssStyle="font-size: 13px; color: red" />
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">성별</th>
        <td><input type="radio" name="memberGender" id="female" value="102"/>
          <label for="female">여성</label>
          <input type="radio" name="memberGender" id="male" value="101" checked/>
          <label for="male">남성</label>
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">생년월일</th>
        <td>
          <select name="memberBirthY">
            <c:forEach var="year" begin="1" end="100">
              <c:choose>
                <c:when test="${year==80}">
                  <option value="${ 1920+year}" selected>${ 1920+year} </option>
                </c:when>
                <c:otherwise>
                  <option value="${ 1920+year}">${ 1920+year} </option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>년
          <select name="memberBirthM">
            <c:forEach var="month" begin="1" end="12">
              <c:choose>
                <c:when test="${month==5 }">
                  <option value="${month }" selected>${month }</option>
                </c:when>
                <c:otherwise>
                  <option value="${month }">${month}</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>월
          <select name="memberBirthD">
            <c:forEach var="day" begin="1" end="31">
              <c:choose>
                <c:when test="${day==10 }">
                  <option value="${day}" selected>${day}</option>
                </c:when>
                <c:otherwise>
                  <option value="${day}">${day}</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>일 <span style="padding-left:50px"></span>
          <input type="radio" name="memberBirthGn" value="2" checked/>양력
          <span style="padding-left:50px"></span>
          <input type="radio" name="memberBirthGn" value="1"/>음력
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">휴대폰번호</th>
        <td>
        <div style="display: flex">
        <div>
        <form:select path="memberHp1">
<%--          <option>없음</option>--%>
          <option selected value="010">010</option>
          <option value="011">011</option>
          <option value="016">016</option>
          <option value="017">017</option>
          <option value="018">018</option>
          <option value="019">019</option>
        </form:select>
          - <form:input path="memberHp2" size="10px" type="text" maxlength="4"/>
          - <form:input path="memberHp3" size="10px" type="text" maxlength="4"/><br> <br>
        </div>
        <div>
          <div><form:errors path="memberHp1" cssStyle="font-size: 13px; color: red"/></div>
          <div><form:errors path="memberHp2" cssStyle="font-size: 13px; color: red"/></div>
          <div><form:errors path="memberHp3" cssStyle="font-size: 13px; color: red"/></div>
        </div>
        </div>
          <input type="checkbox" onchange="setSmsValue(event)" checked/>
          <input type="hidden" id="smsstsYn" name="smsstsYn" value="Y"/>쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">이메일<br>(e-mail)</th>
        <td>
          <div style="display: flex">
          <div>
          <form:input path="memberEmail1" size="10px" type="text"/> @ <form:input path="memberEmail2" size="10px" type="text"
                                                                          id="domaintxt"/>
          <select id="domainlist" title="선택하세요">
            <option value="type">직접입력</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="naver.com">naver.com</option>
            <option value="yahoo.co.kr">yahoo.co.kr</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="paran.com">paran.com</option>
            <option value="nate.com">nate.com</option>
            <option value="google.com">google.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="empal.com">empal.com</option>
            <option value="korea.com">korea.com</option>
            <option value="freechal.com">freechal.com</option>
          </select><br>
          </div>
          <div>
            <div><form:errors path="memberEmail1" cssClass="text-danger" cssStyle="font-size: 13px; color:red"/></div>
            <div><form:errors path="memberEmail2" cssClass="text-danger" cssStyle="font-size: 13px; color:red"/></div>
          </div>
        </div>
          <input type="checkbox" onchange="setEmailValue(event)" checked/>
          <input type="hidden" id="emailstsYn" name="emailstsYn" value="Y"/>쇼핑몰에서 발송하는 e-mail을 수신합니다.
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">주소</th>
        <td class="address_info">
          <div class="zipcode">
            <form:input path="zipcode" type="text" id="zipcode" size="10" maxlength="5"/>
            <button class="search_zipcode"><a href="javascript:execDaumPostcode()">우편번호검색</a></button><form:errors path="zipcode" cssStyle="font-size: 13px; color: red; margin-left: 5px"/>
          </div>
          <p>
            <label for="roadAddress">도로명 주소</label>
            <form:input path="roadAddress" type="text" id="roadAddress" maxlength="50"/>
          <div><form:errors path="roadAddress" cssStyle="font-size: 13px; color:red"/></div>
          </p>
          <p>
            <label for="jibunAddress">지번 주소</label>
            <form:input path="jibunAddress" type="text" id="jibunAddress"  maxlength="50"/>
          <div><form:errors path="jibunAddress" cssStyle="font-size: 13px; color:red"/></div>
          </p>
          <p>
            <label for="namujiAddress">나머지 주소</label>
            <form:input path="namujiAddress" type="text" id="namujiAddress"  maxlength="50"/>
          <div><form:errors path="namujiAddress" cssStyle="font-size: 13px; color:red"/></div>
          </p>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
  <div class="clear">
    <section id="center">
      <input type="submit" value="회원 가입" >
      <input type="reset" value="다시입력">
      <input type="button" value="취소" onclick="location.href='/main/main.do'"/>
    </section>
  </div>
</form:form>
</body>
</html>
