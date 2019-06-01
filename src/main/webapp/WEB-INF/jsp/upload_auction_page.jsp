<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
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
                <h2 class="title-section"><span class="title-regular">물건</span><br/>등록하기</h2>
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
                <label for="inputPhoto" class="inform-label">관련 사진을 등록하세요</label>
                <input type="file" class="form-control-file" id="inputPhoto">
            </div>
            <div class="form-group col-md-4">
                <label for="inputPrice" class="inform-label">시작 금액을 입력하세요.</label>
                <input type="number" class="form-control" id="inputPrice" value="1000">
            </div>
            <div class="form-group col-md-4">
                <label for="inputCategory">관련 분류를 선택하세요</label>
                <select class="form-control" id="inputCategory">
                    <option>가구</option>
                    <option>가전</option>
                    <option>식품</option>
                    <option>쏘쏘</option>
                    <option>굳굳</option>
                </select>
            </div>
        </div>
        <div class="btn-div">
            <a class="btn btn-sm btn-primary" onclick="uploadAuction()">신청</a>
            <a class="btn btn-sm btn-primary" href="/auction_page">취소</a>
        </div>
    </div>
</section>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<!-- Scripts -->
<!-- JQuery JavaScript -->
<script src="js/jquery.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="js/bootstrap.bundle.min.js"></script>
<!--  SHA256 HASH JavaScript -->
<script src="js/sha256.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        /*
         *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
         */
        $('.fancybox-media')
            .attr('rel', 'media-gallery')
            .fancybox({
                openEffect: 'none',
                closeEffect: 'none',
                prevEffect: 'none',
                nextEffect: 'none',
                arrows: false,
                helpers: {
                    media: {},
                    buttons: {}
                }
            });
    });

    function uploadAuction() {
        var formData = new FormData();
        formData.append('sourceFile', $('input[type=file]')[0].files[0]);
        formData.append('title', $('#inputTitle').val());
        formData.append('content', $('#inputContent').val());
        formData.append('start_date', $('#inputStartDate').val());
        formData.append('end_date', $('#inputEndDate').val());
        formData.append('subject', $('#inputCategory').val());
        formData.append('price', $('#inputPrice').val());
        $.ajax({
            url : "create_auction/new",
            type : "post",
            processData : false,
            contentType : false,
            data : formData,
            dataType : "text",
            success : function(data) {
                if(data == 'success') {
                    alert('프로필 사진 변경에 성공했습니다!');
                    window.location.href = "#";
                } else {
                    alert('알 수 없는 오류가 발생했습니다!');
                    window.location.href = "#";
                }
            }
        });
    }

</script>

</body>

</html>