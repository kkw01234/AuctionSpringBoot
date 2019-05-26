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
            <div class="form-group">
                <label for="inputTitle" class="inform-label">제목</label>
                <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group">
                <label for="inputContent" class="inform-label">설명</label>
                <textarea class="form-control" id="inputContent" rows="11" placeholder="설명을 입력하세요."></textarea>
            </div>
            <div class="form-group">
                <label for="inputPhoto" class="inform-label">사진</label>
                <input type="text" class="form-control" id="inputPhoto" placeholder="사진을 등록하세요.">
            </div>
            <div class="tag-label">태그를 선택하세요</div>
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 가구
            </label>
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 식품
            </label>
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 장식품
            </label>
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
        return;
    }
</script>

</body>

</html>