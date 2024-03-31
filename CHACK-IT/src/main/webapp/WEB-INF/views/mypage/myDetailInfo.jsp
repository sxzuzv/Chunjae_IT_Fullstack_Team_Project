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
  <link rel="stylesheet" href="/resources/css/mypage.css">
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

                  // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                  // if(data.autoRoadAddress) {
                  //     //예상되는 도로명 주소에 조합형 주소를 추가한다.
                  //     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                  //     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                  //
                  // } else if(data.autoJibunAddress) {
                  //     var expJibunAddr = data.autoJibunAddress;
                  //     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                  //
                  // } else {
                  //     document.getElementById('guide').innerHTML = '';
                  // }
              }
          }).open();
      }
  </script>
  <script>

      window.onload = function () {
          selectBoxInit();
      }

      function selectBoxInit() {

          var hp1 = '${memberInfo.memberHp1}';
          var selHp1 = document.getElementById('hp1');
          var optionHp1 = selHp1.options;
          var val;
          for (var i = 0; i < optionHp1.length; i++) {
              val = optionHp1[i].value;
              if (hp1 == val) {
                  optionHp1[i].selected = true;
                  break;
              }
          }
      }


      // function fn_modify_member_info(attribute){
      // 	var value;
      // 	// alert(member_id);
      // 	// alert("mod_type:"+mod_type);
      // 		var frm_mod_member=document.frm_mod_member;
      // 		if(attribute=='memberPw'){
      // 			value=frm_mod_member.member_pw.value;
      // 			//alert("member_pw:"+value);
      // 		}else if(attribute=='memberGender'){
      // 			var member_gender=frm_mod_member.member_gender;
      // 			for(var i=0; member_gender.length;i++){
      // 			 	if(member_gender[i].checked){
      // 					value=member_gender[i].value;
      // 					break;
      // 				}
      // 			}
      //
      // 		}else if(attribute=='memberBirth'){
      // 			var member_birth_y=frm_mod_member.memberBirthY;
      // 			var member_birth_m=frm_mod_member.memberBirthM;
      // 			var member_birth_d=frm_mod_member.memberBirthD;
      // 			var member_birth_gn=frm_mod_member.memberBirthGn;
      //
      // 			for(var i=0; member_birth_y.length;i++){
      // 			 	if(member_birth_y[i].selected){
      // 					value_y=member_birth_y[i].value;
      // 					break;
      // 				}
      // 			}
      // 			for(var i=0; member_birth_m.length;i++){
      // 			 	if(member_birth_m[i].selected){
      // 					value_m=member_birth_m[i].value;
      // 					break;
      // 				}
      // 			}
      //
      // 			for(var i=0; member_birth_d.length;i++){
      // 			 	if(member_birth_d[i].selected){
      // 					value_d=member_birth_d[i].value;
      // 					break;
      // 				}
      // 			}
      //
      // 			//alert("수정 년:"+value_y+","+value_m+","+value_d);
      // 			for(var i=0; member_birth_gn.length;i++){
      // 			 	if(member_birth_gn[i].checked){
      // 					value_gn=member_birth_gn[i].value;
      // 					break;
      // 				}
      // 			}
      // 			//alert("생년 양음년 "+value_gn);
      // 			value=+value_y+","+value_m+","+value_d+","+value_gn;
      // 		}else if(attribute=='memberHp'){
      // 			var hp1=frm_mod_member.hp1;
      // 			var hp2=frm_mod_member.hp2;
      // 			var hp3=frm_mod_member.hp3;
      // 			var smssts_yn=frm_mod_member.smssts_yn;
      //
      // 			for(var i=0; hp1.length;i++){
      // 			 	if(hp1[i].selected){
      // 					value_hp1=hp1[i].value;
      // 					break;
      // 				}
      // 			}
      // 			value_hp2=hp2.value;
      // 			value_hp3=hp3.value;
      // 			value_smssts_yn=smssts_yn.checked;
      // 			value=value_hp1+","+value_hp2+", "+value_hp3+","+value_smssts_yn;
      // 		}else if(attribute=='memberEmail'){
      // 			var email1=frm_mod_member.email1;
      // 			var email2=frm_mod_member.email2;
      // 			var emailsts_yn=frm_mod_member.emailsts_yn;
      //
      // 			value_email1=email1.value;
      // 			value_email2=email2.value;
      // 			value_emailsts_yn=emailsts_yn.checked;
      // 			value=value_email1+","+value_email2+","+value_emailsts_yn;
      // 			//alert(value);
      // 		}else if(attribute=='memberAddress'){
      // 			var zipcode=frm_mod_member.zipcode;
      // 			var roadAddress=frm_mod_member.roadAddress;
      // 			var jibunAddress=frm_mod_member.jibunAddress;
      // 			var namujiAddress=frm_mod_member.namujiAddress;
      //
      // 			value_zipcode=zipcode.value;
      // 			value_roadAddress=roadAddress.value;
      // 			value_jibunAddress=jibunAddress.value;
      // 			value_namujiAddress=namujiAddress.value;
      // 			value=value_zipcode+","+value_roadAddress+","+value_jibunAddress+","+value_namujiAddress;
      // 		}
      // 		console.log(attribute);

      <%--$.ajax({--%>
      <%--	type : "post",--%>
      <%--	async : false, //false인 경우 동기식으로 처리한다.--%>
      <%--	url : "${contextPath}/mypage/modifyMyInfo.do",--%>
      <%--	data : {--%>
      <%--		attribute:attribute,--%>
      <%--		value:value,--%>
      <%--	},--%>
      <%--	success : function(data, textStatus) {--%>
      <%--		if(data.trim()=='mod_success'){--%>
      <%--			alert("회원 정보를 수정했습니다.");--%>
      <%--		}else if(data.trim()=='failed'){--%>
      <%--			alert("다시 시도해 주세요.");	--%>
      <%--		}--%>
      <%--		--%>
      <%--	},--%>
      <%--	error : function(data, textStatus) {--%>
      <%--		alert("에러가 발생했습니다."+data);--%>
      <%--	},--%>
      <%--	complete : function(data, textStatus) {--%>
      <%--		//alert("작업을완료 했습니다");--%>
      <%--		--%>
      <%--	}--%>
      <%--}); //end ajax--%>


      document.addEventListener('DOMContentLoaded', function () {//페이지로드후 실행
          const domainListEl = document.querySelector('#domainlist');//도메인 리스트 정의
          const domainInputEl = document.querySelector('#domaintxt');//직접입력 도메인 정의

          domainListEl.addEventListener('change', (event) => {
              if (event.target.value !== "type") {//직접입력 도메인 선택 안했을때
                  domainInputEl.value = event.target.value;//선택한 도메인을 input 에 입력
                  domainInputEl.readOnly = true;
              } else {//직접입력 도메인 선택시
                  domainInputEl.value = "";//input 내용 초기화
                  domainInputEl.readonly = false;
              }
          });
      });

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
  </script>
</head>

<body>
<h3>내 상세 정보</h3>
<form:form modelAttribute="memberVO" action="${contextPath}/mypage/modifyMyInfo.do" method="post" class="frmMyDetailInfo">
  <div id="detail_table">
    <table>
      <tbody>
      <tr class="dot_line">
        <th class="fixed_join">아이디</th>
        <td>
          <form:input path="memberId" type="text" size="20" value="${memberInfo.memberId }" readonly="true"/>
          <form:errors path="memberId" cssStyle="font-size: 13px; color: red" />
        </td>
      </tr>
      <tr class="dot_line">
<%--        <th class="fixed_join">비밀번호</th>--%>
<%--        <td>--%>

          <form:input path="memberPw" type="hidden" size="20" value="1234choi@@"/>
<%--          <form:errors path="memberPw" cssClass="text-danger" cssStyle="font-size: 10px"/>--%>

<%--        </td>--%>
        <%--					<td>--%>


        <%--					  <input type="button" value="수정하기" onClick="fn_modify_member_info('memberPw')" />--%>
        <%--					</td>--%>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">이름</th>
        <td>
          <form:input path="memberName" type="text" size="20" value="${memberInfo.memberName }" readonly="true"/>
          <form:errors path="memberName" cssStyle="font-size: 13px; color: red" />
        </td>
        <td>
        </td>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">성별</th>
        <td>
          <c:choose>
            <c:when test="${memberInfo.memberGender =='101' }">
              <input type="radio" name="memberGender" id="female" value="102"/>
              <label for="female">여성</label>
              <input type="radio" name="memberGender" id="male" value="101" checked/>
              <label for="male">남성</label>
            </c:when>
            <c:otherwise>
              <input type="radio" name="memberGender" id="female" value="102" checked/>
              <label for="female">여성</label>
              <input type="radio" name="memberGender" id="male" value="101"/>
              <label for="male">남성</label>
            </c:otherwise>
          </c:choose>
        </td>
        <%--					<td>--%>
        <%--					  <input type="button" value="수정하기" onClick="fn_modify_member_info('memberGender')" />--%>
        <%--					</td>--%>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">생년월일</th>
        <td>
          <select name="memberBirthY">
            <c:forEach var="i" begin="1" end="100">
              <c:choose>
                <c:when test="${memberInfo.memberBirthY==1920+i }">
                  <option value="${ 1920+i}" selected>${ 1920+i} </option>
                </c:when>
                <c:otherwise>
                  <option value="${ 1920+i}">${ 1920+i} </option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>년
          <select name="memberBirthM">
            <c:forEach var="i" begin="1" end="12">
              <c:choose>
                <c:when test="${memberInfo.memberBirthM==i }">
                  <option value="${i }" selected>${i }</option>
                </c:when>
                <c:otherwise>
                  <option value="${i }">${i }</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>월
          
          <select name="memberBirthD">
            <c:forEach var="i" begin="1" end="31">
              <c:choose>
                <c:when test="${memberInfo.memberBirthD==i }">
                  <option value="${i }" selected>${i }</option>
                </c:when>
                <c:otherwise>
                  <option value="${i }">${i }</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>일 <span style="padding-left:50px"></span>
          <c:choose>
            <c:when test="${memberInfo.memberBirthGn=='2' }">
              <input type="radio" name="memberBirthGn" id="solar" value="2" checked/>
              <label for="solar">양력</label>
              <input type="radio" name="memberBirthGn" id="lunar" value="1"/>
              <label for="lunar">음력</label>
            </c:when>
            <c:otherwise>
              <input type="radio" name="memberBirthGn" id="solar" value="2"/>
              <label for="solar">양력</label>
              <input type="radio" name="memberBirthGn" id="lunar" value="1" checked/>
              <label for="lunar">음력</label>
            </c:otherwise>
          </c:choose>
        </td>
        <%--					<td>--%>
        <%--					  <input type="button" value="수정하기" onClick="fn_modify_member_info('memberBirth')" />--%>
        <%--					</td>--%>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">휴대폰번호</th>
        <td>
        <div style="display: flex">
          <div>
          <form:select path="memberHp1" id="hp1">
<%--            <option>없음</option>--%>
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
          </form:select>
          - <form:input path="memberHp2" type="text" size="4" value="${memberInfo.memberHp2 }"/>
          - <form:input path="memberHp3" type="text" size="4" value="${memberInfo.memberHp3 }"/>
          </div>
          <div>
            <div><form:errors path="memberHp1" cssStyle="font-size: 13px; color: red" /></div>
            <div><form:errors path="memberHp2" cssStyle="font-size: 13px; color: red" /></div>
            <div><form:errors path="memberHp3" cssStyle="font-size: 13px; color: red" /></div>
          </div>
          </div>
          <input type="checkbox" onchange="setSmsValue(event)"   ${memberInfo.smsstsYn == 'Y' ? 'checked' : ''} />
          <input type="hidden" id="smsstsYn" name="smsstsYn" value="${memberInfo.smsstsYn}"/> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
        </td>
        <%--					<td>--%>
        <%--					  <input type="button" value="수정하기" onClick="fn_modify_member_info('memberHp')" />--%>
        <%--					</td>	--%>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">이메일<br>(e-mail)</th>
        <td>
          <div style="display: flex">
            <div>
          <form:input path="memberEmail1" type="text"  size="10" value="${memberInfo.memberEmail1 }"/> @ <form:input path="memberEmail2" type="text"
                                                                                                        size="10"
                                                                                                        value="${memberInfo.memberEmail2 }"
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
          </select><Br>
            </div>
          <div>
          <div><form:errors path="memberEmail1" cssStyle="font-size: 13px; color: red" /></div>
            <div><form:errors path="memberEmail2" cssStyle="font-size: 13px; color: red" /></div>
          </div>
          </div>
          <input type="checkbox" onchange="setEmailValue(event)" ${memberInfo.emailstsYn == 'Y' ? 'checked' : ''} />
          쇼핑몰에서 발송하는 e-mail을 수신합니다.
          <input type="hidden" id="emailstsYn" name="emailstsYn" value="${memberInfo.emailstsYn}"/>
        
        </td>
        <%--					<td>--%>
        <%--					  <input type="button" value="수정하기" onClick="fn_modify_member_info('memberEmail')" />--%>
        <%--					</td>--%>
      </tr>
      <tr class="dot_line">
        <th class="fixed_join">주소</th>
        <td class="address_info">
          <div class="zipcode">
            <form:input path="zipcode" type="text" id="zipcode"  size="5" value="${memberInfo.zipcode }"/>
            <button class="search_zipcode"><a href="javascript:execDaumPostcode()">우편번호검색</a></button>
            <form:errors path="zipcode" cssClass="text-danger" cssStyle="font-size: 13px"/>

          </div>
          <p>
            <label for="roadAddress">도로명 주소</label>
            <form:input path="roadAddress" type="text" id="roadAddress"  size="50" value="${memberInfo.roadAddress }"/>
              <div><form:errors path="roadAddress" cssStyle="font-size: 13px; color:red"/></div>
          </p>
          <p>
            <label for="jibunAddress">지번 주소</label>
            <form:input path="jibunAddress" type="text" id="jibunAddress" size="50" value="${memberInfo.jibunAddress }"/>
              <div><form:errors path="jibunAddress" cssStyle="font-size: 13px; color:red"/></div>
          </p>
          <p>
            <label for="namujiAddress">나머지 주소</label>
            <form:input path="namujiAddress" type="text" id="namujiAddress"  size="50" value="${memberInfo.namujiAddress }"/>
              <div><form:errors path="namujiAddress" cssStyle="font-size: 13px; color:red"/></div>
          </p>
        </td>
        <%--					<td>--%>
        <%--					  <input type="button" value="수정하기" onClick="fn_modify_member_info('memberAddress')" />--%>
        <%--					</td>--%>
      </tr>
      </tbody>
    </table>
  </div>
  <div class="clear">
    <section id="center">
      <input type="submit" value="수정">
      <input type="reset" value="다시입력">
      <input type="button" value="수정 취소" onclick="location.href='/mypage/myPageMain.do'">
    </section>
  </div>
  <input type="hidden" name="h_hp1" value="${memberInfo.memberHp1}"/>
</form:form>
</body>
</html>
