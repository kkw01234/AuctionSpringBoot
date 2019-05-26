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

<section class="page-section">
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
            <label for="inputContent" class="inform-label">설명</label>
            <textarea class="form-control" id="inputContent" rows="11" placeholder="내용을 입력하세요."></textarea>
            <div class="form-group">
                <label for="inputTag" class="inform-label">관련 태그를 선택하세요</label>
                <input type="text" class="form-control" id="inputTag" placeholder="제목을 입력하세요.">
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<!-- Scripts -->
<!-- Loads Bootstrap Main JS -->
<script src="bootstrap/js/bootstrap.min.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>

<!-- Initiate Portoflio Script -->
<script src="extensions/portfolio/isotope.min.js"></script>
<script src="extensions/portfolio/portfolio.js"></script>

<!-- Initiate Fancybox/Lightbox Script -->
<!-- Fancybox/Lightbox -->
<script type="text/javascript" src="extensions/fancybox/jquery.fancybox.js"></script>
<script type="text/javascript" src="extensions/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="extensions/fancybox/jquery.fancybox.css" media="screen"/>
<script type="text/javascript" src="extensions/fancybox/jquery.fancybox-media.js"></script>
<!-- Initiate Fancybox/Lightbox for Videos -->


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
</script>

</body>

</html>