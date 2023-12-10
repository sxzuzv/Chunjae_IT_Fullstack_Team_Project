<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
    <title>report</title>
</head>
<body>
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="${contextPath}/report/write.do" method="post">
                    <div class="modal-body">

                        <div class="mb-3">
                            <label for="report-text" class="col-form-label">신고사유</label>
                                <select id="report-text" name="title">
                                    <option value="욕설사용, 비방으로 신고합니다">욕설사용, 비방</option>
                                    <option value="중고 거래 사기로 신고합니다">중고 거래 사기</option>
                                    <option value="기타 사유로 신고합니다">기타 사유</option>
                                </select>
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">신고내용</label>
                            <textarea class="form-control" id="message-text" name="content"></textarea>
                        </div>
                        <input type="hidden" name="brdId" value="${dto.brdId}">
                        <input type="hidden" name="userId" value="${dto.userId}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
                        <button type="submit" class="btn btn-primary">제출하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
