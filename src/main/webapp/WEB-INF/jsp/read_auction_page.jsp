<%@ page import="io.kkw.auction.spring.bean.AucProduct" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<% AucProduct auc = (AucProduct) session.getAttribute("auc"); %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="경기대학교 강경웅, 김건욱">

    <title>경기대학교 데이터베이스 프로그래밍 - Auction</title>

    <link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
    <link href="css/auction.css" rel="stylesheet">
</head>

<body>

<%@ include file="nav.jsp" %>

<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">물건</span><br/>확인하기</h2>
                <hr class="title-underline"/>
            </div>
            <div class="image-container col-md-5">
                <div class="image-container col-md-12">
                    <img class="img-thumbnail" src="/img/item-example1.jpg" alt=""/>
                </div>
            </div>
            <div class="read-container col-md-7">
                <div class="read-row col-md-12"></div>
                <div class="auction-label col-md-2">제목</div>
                <div class="auction-value col-md-10">맛있는 빵 드세요!</div>
                <div class="read-row col-md-12"></div>
                <div class="auction-label col-md-2">분류</div>
                <div class="auction-value col-md-2">식품</div>
                <div class="auction-label col-md-2">시작</div>
                <div class="auction-value col-md-2">12.06.07</div>
                <div class="auction-label col-md-2">마감</div>
                <div class="auction-value col-md-2">13.06.07</div>
                <div class="read-row col-md-12"></div>
                <div class="auction-label col-md-12">내용</div>
                <div class="read-row col-md-12"></div>
                <div class="auction-value auction-content col-md-12">
                    좋은 물건을 팔고 싶어요~
                </div>
                <div class="read-row col-md-12"></div>
            </div>
            <div class="col-md-12 play-container">
                <div class="col-md-3">
                    현재 입찰가 : 5000원
                </div>
                <div class="form-group col-md-5">
                    <label for="inputPrice" class="inform-label">입찰가</label>
                    <input type="text" class="form-control" id="inputPrice" placeholder="입찰가를 입력하세요.">
                </div>
                <div class="col-md-4">
                    <a href="/auction_page" class="btn btn-primary btn-lg">입찰하기</a>
                </div>
            </div>
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
</script>

</body>

</html>