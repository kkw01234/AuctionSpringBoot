<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<% String auc = (String) request.getAttribute("product"); %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="경기대학교 강경웅, 김건욱">

    <title>경기대학교 데이터베이스 프로그래밍 - Auction</title>

    <link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">

</head>

<body>

<%@ include file="nav.jsp" %>

<section class="page-section" style="padding-top:70px">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">물건</span><br/>수정하기</h2>
                <hr class="title-underline"/>
            </div>
        </div>
        <div class="write-container">
            <div class="form-group col-md-12">
                <label for="inputTitle" class="inform-label">제목</label>
                <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group col-md-12">
                <label for="inputContent" class="inform-label">설명</label>
                <textarea class="form-control" id="inputContent" rows="11" placeholder="설명을 입력하세요."></textarea>
            </div>
            <div class="form-group col-md-6">
                <label for="inputStartDate" class="col-2 col-form-label">경매 시작일</label>
                <div class="col-10">
                    <input class="form-control" type="datetime-local" value="2011-08-19" id="inputStartDate">
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="inputEndDate" class="col-2 col-form-label">경매 마감일</label>
                <div class="col-10">
                    <input class="form-control" type="datetime-local" value="2011-08-19" id="inputEndDate">
                </div>
            </div>
            <div class="form-group col-md-4">
                <label for="inputPhoto" class="inform-label">업로드한 사진은 저장되어 있습니다.<br>바꾸시려면 추가하세요.</label>
                <input type="file" class="form-control-file" id="inputPhoto">
            </div>
            <div class="form-group col-md-4">
                <label for="inputPrice" class="inform-label">시작 금액을 입력하세요.</label>
                <input type="number" class="form-control" id="inputPrice" value="1000">
            </div>
            <div class="form-group col-md-4">
                <label for="inputCategory">관련 분류를 선택하세요</label>
                <select class="form-control" id="inputCategory">
                    <option>패션</option>
                    <option>유아</option>
                    <option>식품</option>
                    <option>가전</option>
                    <option>가구</option>
                    <option>공구</option>
                    <option>티켓</option>
                    <option>기타</option>
                </select>
            </div>
        </div>
        <div class="btn-div">
            <a class="btn btn-sm btn-primary" onclick="updateAuction()">수정</a>
            <a class="btn btn-sm btn-primary" href="/auction_page">취소</a>
        </div>
    </div>
</section>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<script type="text/javascript">
    var auc = <%=auc%>;
    var isNew = false;
    console.log(auc);
    function setValue() {
        $('#inputTitle').val(auc['title']);
        $('#inputContent').val(auc['pcontent']);
        var startDate = new Date(auc['startdate']);
        var startFormat = startDate.toISOString();
        startFormat = startFormat.slice(0, startFormat.indexOf(':', startFormat.indexOf(':') + 1));
        $('#inputStartDate').val(startFormat);
        var endDate = new Date(auc['enddate']);
        var endFormat = endDate.toISOString();
        endFormat = endFormat.slice(0, endFormat.indexOf(':', endFormat.indexOf(':') + 1));
        $('#inputEndDate').val(endFormat);
        $('#inputCategory').val(auc['psubject']);
        $('#inputPrice').val(auc['price']);
    }

    function updateAuction() {
        var formData = new FormData();
        formData.append('id', auc['id']);
        formData.append('title', $('#inputTitle').val());
        formData.append('pcontent', $('#inputContent').val());
        formData.append('startdate', $('#inputStartDate').val());
        formData.append('enddate', $('#inputEndDate').val());
        formData.append('psubject', $('#inputCategory').val());
        formData.append('price', $('#inputPrice').val());
        console.log($('#inputPhoto').val());
        if($('#inputPhoto').val() != '') {
            isNew = true;
        }
        var url = '';
        if(isNew) {
            formData.append('sourceFile', $('input[type=file]')[0].files[0]);
            url = '/modify_auction/newImage'
        } else {
            url = '/modify_auction'
        }
        $.ajax({
            url : url,
            type : "post",
            processData : false,
            contentType : false,
            data : formData,
            dataType : "text",
            success : function(data) {
                if(data == 'success') {
                    alert('관리자 승인을 기다립니다!');
                    window.location.href = "/auction_page";
                } else {
                    alert('수정에 실패했습니다!');
                }
            },
            error: function (error) {
                alert('수정에 실패했습니다!');
            }
        });
    }

    $(document).ready(function(){
        setValue();
    })
</script>

</body>

</html>