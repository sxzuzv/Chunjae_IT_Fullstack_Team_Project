<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="euc-kr"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="goods" value="${goodsMap.goods}"/>
<c:set var="imageFileList" value="${goodsMap.imageFileList}"/>

<c:choose>
  <c:when test='${not empty goods.goodsStatus}'>
    <link rel="stylesheet" href="/resources/css/admin.css">
    <script>
        window.onload = function () {
            init();
        }

        function init() {
            var frm_mod_goods = document.frm_mod_goods;
            var h_goods_status = frm_mod_goods.h_goods_status;
            var goods_status = h_goods_status.value;
            var select_goods_status = frm_mod_goods.goodsStatus;
            select_goods_status.value = goods_status;
        }
    </script>
  </c:when>
</c:choose>
<script type="text/javascript">
    function fn_modify_goods(goods_Id, attribute) {
        var frm_mod_goods = document.frm_mod_goods;
        var value = "";
        // if(attribute=='goods_sort'){
        // 	value=frm_mod_goods.goods_sort.value;
        // }else
        if (attribute == 'goodsTitle') {
            value = frm_mod_goods.goodsTitle.value;
        } else if (attribute == 'goodsWriter') {
            value = frm_mod_goods.goodsWriter.value;
        } else if (attribute == 'goodsPublisher') {
            value = frm_mod_goods.goodsPublisher.value;
        } else if (attribute == 'goodsPrice') {
            value = frm_mod_goods.goodsPrice.value;
        } else if (attribute == 'goodsSalesPrice') {
            value = frm_mod_goods.goodsSalesPrice.value;
        }
            // else if(attribute=='goods_point'){
            // 	value=frm_mod_goods.goods_point.value;
        // }
        else if (attribute == 'goodsPublishedDate') {
            value = frm_mod_goods.goodsPublishedDate.value;
        } else if (attribute == 'goodsTotalPage') {
            value = frm_mod_goods.goodsTotalPage.value;
        } else if (attribute == 'goodsIsbn') {
            value = frm_mod_goods.goodsIsbn.value;
        } else if (attribute == 'goodsDeliveryPrice') {
            value = frm_mod_goods.goodsDeliveryPrice.value;
        } else if (attribute == 'goodsDeliveryDate') {
            value = frm_mod_goods.goodsDeliveryDate.value;
        } else if (attribute == 'goodsStatus') {
            value = frm_mod_goods.goodsStatus.value;
        } else if (attribute == 'goodsContentsOrder') {
            value = frm_mod_goods.goodsContentsOrder.value;
        } else if (attribute == 'goodsWriterIntro') {
            value = frm_mod_goods.goodsWriterIntro.value;
        } else if (attribute == 'goodsIntro') {
            value = frm_mod_goods.goodsIntro.value;
        } else if (attribute == 'goodsPublisherComment') {
            value = frm_mod_goods.goodsPublisherComment.value;
        } else if (attribute == 'goodsRecommendation') {
            value = frm_mod_goods.goodsRecommendation.value;
        }

        $.ajax({
            type: "post",
            async: false, //false인 경우 동기식으로 처리한다.
            url: "${contextPath}/admin/goods/modifyGoodsInfo.do",
            data: {
                goods_Id: goods_Id,
                attribute: attribute,
                value: value
            },
            success: function (data, textStatus) {
                if (data.trim() == 'mod_success') {
                    alert("상품 정보를 수정했습니다.");
                } else if (data.trim() == 'failed') {
                    alert("다시 시도해 주세요.");
                }

            },
            error: function (data, textStatus) {
                alert("에러가 발생했습니다." + data);
            },
            complete: function (data, textStatus) {
                //alert("작업을완료 했습니다");

            }
        }); //end ajax
    }


    function readURL(input, preview) {
        //  alert(preview);
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + preview).attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    var cnt = 1;

    function fn_addFile() {
        $("#d_file").append("<br>" + "<input  type='file' name='detail_image" + cnt + "' id='detail_image" + cnt + "'  onchange=readURL(this,'previewImage" + cnt + "') />");
        $("#d_file").append("<img  id='previewImage" + cnt + "'   width=200 height=200  />");
        $("#d_file").append("<input  type='button' value='추가'  onClick=addNewImageFile('detail_image" + cnt + "','${imageFileList[0].goodsId}','detail_image')  />");
        cnt++;
    }

    function modifyImageFile(file_Id, goods_Id, image_Id, fileType) {
        // alert(fileId);
        var form = $('#FILE_FORM')[0];
        var formData = new FormData(form);
        formData.append("fileName", $('#' + file_Id)[0].files[0]);
        formData.append("goods_id", goods_Id);
        formData.append("image_id", image_Id);
        formData.append("fileType", fileType);

        $.ajax({
            url: '${contextPath}/admin/goods/modifyGoodsImageInfo.do',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            success: function (result) {
                alert("이미지를 수정했습니다!");
            }
        });
    }

    function addNewImageFile(file_Id, goods_Id, fileType) {
        //  alert(fileId);
        var form = $('#FILE_FORM')[0];
        var formData = new FormData(form);
        formData.append("uploadFile", $('#' + file_Id)[0].files[0]);
        formData.append("goods_id", goods_Id);
        formData.append("fileType", fileType);

        $.ajax({
            url: '${contextPath}/admin/goods/addNewGoodsImage.do',
            processData: false,
            contentType: false,
            data: formData,
            type: 'post',
            success: function (result) {
                alert("이미지를 수정했습니다!");
            }
        });
    }

    function deleteImageFile(goods_Id, image_Id, imageFileName, trId) {
        var tr = document.getElementById(trId);

        $.ajax({
            type: "post",
            async: true, //false인 경우 동기식으로 처리한다.
            url: "${contextPath}/admin/goods/removeGoodsImage.do",
            data: {
                goods_id: goods_Id,
                image_id: image_Id,
                imageFileName: imageFileName
            },
            success: function (data, textStatus) {
                alert("이미지를 삭제했습니다!!");
                tr.style.display = 'none';
            },
            error: function (data, textStatus) {
                alert("에러가 발생했습니다." + textStatus);
            },
            complete: function (data, textStatus) {
                //alert("작업을완료 했습니다");

            }
        }); //end ajax
    }
</script>

</HEAD>
<BODY>
<form name="frm_mod_goods" method=post>
  <DIV class="clear"></DIV>
  <!-- 내용 들어 가는 곳 -->
  <DIV id="container">
    <UL class="tabs">
      <li><A href="#tab1">상품 정보</A></li>
      <li><A href="#tab2">상품 목차</A></li>
      <li><A href="#tab3">상품 저자 소개</A></li>
      <li><A href="#tab4">상품 소개</A></li>
      <li><A href="#tab5">출판사 상품 평가</A></li>
      <li><A href="#tab6">추천사</A></li>
      <li><A href="#tab7">상품 이미지</A></li>
    </UL>
    <DIV class="tab_container">
      <DIV class="tab_content" id="tab1">
        <%-- 상품 정보 탭 --%>
        <table class="detail_table">
          <%--			<tr >--%>
          <%--				<td width=200 >상품 분류</td>--%>
          <%--				<td width=500>--%>
          <%--				  <select name="goods_sort">--%>
          <%--					<c:choose>--%>
          <%--				      <c:when test="${goods.goods_sort=='컴퓨터와 인터넷' }">--%>
          <%--						<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷 </option>--%>
          <%--				  	    <option value="디지털 기기">디지털 기기  </option>--%>
          <%--				  	  </c:when>--%>
          <%--				  	  <c:when test="${goods.goods_sort=='디지털 기기' }">--%>
          <%--						<option value="컴퓨터와 인터넷" >컴퓨터와 인터넷 </option>--%>
          <%--				  	    <option value="디지털 기기" selected>디지털 기기  </option>--%>
          <%--				  	  </c:when>--%>
          <%--				  	</c:choose>--%>
          <%--					</select>--%>
          <%--				</td>--%>
          <%--				<td >--%>
          <%--				 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_sort')"/>--%>
          <%--				</td>--%>
          <%--			</tr>--%>
          <tr>
            <th>상품 종류</th>
            <td>
              <select name="goodsStatus">
                <option value="bestseller">베스트셀러</option>
                <option value="steadyseller">스테디셀러</option>
                <option value="newbook">신간</option>
                <option value="on_sale">판매중</option>
                <option value="buy_out" selected>품절</option>
                <option value="out_of_print">절판</option>
              </select>
              <input type="hidden" name="h_goods_status" value="${goods.goodsStatus }"/>
            </td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsStatus')"/>
            </td>
          </tr>
          <tr>
            <th>상품 이름</th>
            <td><input name="goodsTitle" type="text" size="40" maxlength="100" value="${goods.goodsTitle }"/></td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsTitle')"/>
            </td>
          </tr>
          
          <tr>
            <th>저자</th>
            <td><input name="goodsWriter" type="text" size="40" value="${goods.goodsWriter }"/></td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsWriter')"/>
            </td>
          
          </tr>
          <tr>
            <th>출판사</th>
            <td><input name="goodsPublisher" type="text" size="40" value="${goods.goodsPublisher }"/></td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsPublisher')"/>
            </td>
          
          </tr>
          <tr>
            <th>ISBN</th>
            <td><input name="goodsIsbn" type="text" size="40" value="${goods.goodsIsbn }"/></td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsIsbn')"/>
            </td>
          
          </tr>
          <%--			<tr>--%>
          <%--				<td >상품 정가</td>--%>
          <%--				<td><input name="goodsPrice" type="text" size="40" value="${goods.goodsPrice }" /></td>--%>
          <%--				<td>--%>
          <%--				 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goodsId }','goodsPrice')"/>--%>
          <%--				</td>--%>
          <%--				--%>
          <%--			</tr>--%>
          
          
          <%--			<tr>--%>
          <%--				<td >상품 구매 포인트</td>--%>
          <%--				<td><input name="goods_point" type="text" size="40" value="${goods.goods_point }" /></td>--%>
          <%--				<td>--%>
          <%--				 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_point')"/>--%>
          <%--				</td>--%>
          
          <%--			</tr>--%>
          
          <tr>
            <th>상품 출판일</th>
            <td>
              <input name="goodsPublishedDate" type="date" value="${goods.goodsPublishedDate }"/>
            </td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsPublishedDate')"/>
            </td>
          
          </tr>
          
          <tr>
            <th>상품 총 페이지 수</th>
            <td><input name="goodsTotalPage" type="text" size="40" value="${goods.goodsTotalPage }"/></td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsTotalPage"/>
            </td>
          
          </tr>
          <tr>
            <th>상품 판매가</th>
            <td><input name="goodsSalesPrice" type="text" size="40" value="${goods.goodsSalesPrice }"/></td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsSalesPrice')"/>
            </td>
          
          </tr>
          
          <tr>
            <th>상품 배송비</th>
            <td><input name="goodsDeliveryPrice" type="text" size="40" value="${goods.goodsDeliveryPrice }"/></td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsDeliveryPrice')"/>
            </td>
          
          </tr>
          <tr>
            <th>상품 도착 예정일</th>
            <td>
              <input name="goodsDeliveryDate" type="date" value="${goods.goodsDeliveryDate }"/>
            </td>
            <td>
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsDeliveryDate')"/>
            </td>
          
          </tr>
          
          <tr>
            <td colspan=3>
              <br>
            </td>
          </tr>
        </table>
      </DIV>
      <DIV class="tab_content" id="tab2">
        <table class="detail_table">
          <tr>
            <th>상품 목차</th>
            <td class="text_container">
              <textarea rows="25" name="goodsContentsOrder" autofocus>${goods.goodsContentsOrder }</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="button-container">
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsContentsOrder')"/>
            </td>
          </tr>
        </table>
      </DIV>
      <DIV class="tab_content" id="tab3">
        <table class="detail_table">
          <tr>
            <th>상품 저자 소개</th>
            <td class="text_container">
              <textarea rows="25" name="goodsWriterIntro" autofocus>${goods.goodsWriterIntro }</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="button-container">
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsWriterIntro')"/>
            </td>
          </tr>
        </table>
      </DIV>
      <DIV class="tab_content" id="tab4">
        <table class="detail_table">
          <tr>
            <th>상품 소개</th>
            <td class="text_container">
              <textarea rows="25" name="goodsIntro">${goods.goodsIntro }</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="button-container">
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsIntro')"/>
            </td>
          </tr>
        </table>
      </DIV>
      <DIV class="tab_content" id="tab5">
        <table class="detail_table">
          <tr>
            <td class="text_container">
              <textarea rows="25" name="goodsPublisherComment">${goods.goodsPublisherComment }</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="button-container">
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsPublisherComment')"/>
            </td>
          </tr>
        </table>
      </DIV>
      <DIV class="tab_content" id="tab6">
        <table class="detail_table">
          <tr>
            <th>추천사</th>
            <td class="text_container">
              <textarea rows="25" name="goodsRecommendation">${goods.goodsRecommendation }</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="button-container">
              <input type="button" value="수정반영" onClick="fn_modify_goods('${goods.goodsId }','goodsRecommendation')"/>
            </td>
          </tr>
        </table>
      </DIV>
      <DIV class="tab_content" id="tab7">
        <form id="FILE_FORM" method="post" enctype="multipart/form-data">
          <table class="detail_table">
            <tr>
              <c:forEach var="item" items="${imageFileList }" varStatus="itemNum">
              <c:choose>
              <c:when test="${item.fileType=='main_image' }">
            <tr>
              <th colspan="2">메인 이미지</th>
            </tr>
            <tr>
              <td colspan="2">
                <div class="preview_container">
                  <div style="grid-row: 1/2;">
                    <h2>[ 이미지 미리보기 ]</h2>
                  </div>
                  <div style="grid-row: 2/3;">
                    <img id="preview${itemNum.count }" width=200 height=200
                         src="${contextPath}/download.do?goods_id=${item.goodsId}&fileName=${item.fileName}"/>
                  </div>
                </div>
                <div class="clear"></div>
              </td>
            </tr>
            <tr>
              <td>
                <input type="file" id="main_image" name="main_image"
                       onchange="readURL(this,'preview${itemNum.count}');"/>
                  <%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
                <input type="hidden" name="imageId" value="${item.imageId}"/>
              </td>
              <td width="100px" align="right">
                <input type="button" value="수정"
                       onClick="modifyImageFile('main_image','${item.goodsId}','${item.imageId}','${item.fileType}')"/>
              </td>
            </tr>
            </c:when>
            <c:otherwise>
              <tr id="${itemNum.count-1}">
                <th colspan="2">상세 이미지${itemNum.count-1 }</th>
              </tr>
              <tr>
                <td colspan="2">
                  <div class="preview_container">
                    <div style="grid-row: 1/2;"><h2>[ 이미지 미리보기 ]</h2></div>
                    <div style="grid-row: 2/3;">
                      <img id="preview${itemNum.count }" width=200 height=200
                           src="${contextPath}/download.do?goods_id=${item.goodsId}&fileName=${item.fileName}">
                    </div>
                  </div>
                  <div class="clear"></div>
                </td>
              </tr>
              <tr>
                <td>
                  <input type="file" name="detail_image" id="detail_image"
                         onchange="readURL(this,'preview${itemNum.count}');"/>
                    <%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
                  <input type="hidden" name="image_id" value="${item.imageId }"/>
                </td>
                <td>
                  <input type="button" value="수정"
                         onClick="modifyImageFile('detail_image','${item.goodsId}','${item.goodsId}','${item.fileType}')"/>
                  <input type="button" value="삭제"
                         onClick="deleteImageFile('${item.goodsId}','${item.imageId}','${item.fileName}','${itemNum.count-1}')"/>
                </td>
              </tr>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            <tr align="center">
              <td colspan="3">
                <div id="d_file">
                  <%-- <img  id="preview${itemNum.count }"   width=200 height=200 src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" /> --%>
                </div>
              </td>
            </tr>
            <tr>
              <td align=center colspan=2>
                
                <input type="button" value="이미지 파일 추가하기" onClick="fn_addFile()"/>
              </td>
            </tr>
          </table>
        </form>
      </DIV>
      <DIV class="clear"></DIV>

</form>	
