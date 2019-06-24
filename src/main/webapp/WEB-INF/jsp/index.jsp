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

<%@ include file="nav.jsp"%>

<!-- Hero Header -->
<header class="hero-header" style="background-image: url('img/main.jpg');">
    <div class="container">
        <div class="intro-text">
            <div class="intro-heading">Auction에 오신 걸 환영합니다!</div>
            <div class="intro-lead-in">현재 100만 개 이상의 물건이 경매되고 있습니다!</div>
            <a href="/auction_page" class="btn btn-primary btn-lg">경매 확인하기</a>
        </div>
    </div>
</header>

<!-- Intro -->
<section class="page-section" id="intro">
    <div class="container intro">
        <div class="row margin-bottom-50">
            <div class="col-md-12 text-center">
                <h1 class="title-section">
                    <span class="title-regular">Auction은 <strong>전 세계적인</strong>
                    </span>
                    <br/>
                    온라인 경매 1위 사이트입니다.
                </h1>
                <hr class="title-underline-center">
                <p class="lead">지금 원하는 물건을 찾아보시거나,
                    <br/>가진 물건을 팔아보세요.</p>
            </div>
        </div>
        <div class="row text-center">
            <div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-desktop"></i>
                        <label><strong>1,000,000</strong>
                            <br/>판매 중인 물건</label>
                        <p>이미 100만 개 이상의 물건이 팔렸습니다.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-user"></i>
                        <label><strong>100,000</strong>
                            <br/>등록된 유저 수</label>
                        <p>벌써 수많은 유저분들이 사용 중입니다.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-code"></i>
                        <label><strong>10억원</strong>
                            <br/>거래된 물건 금액</label>
                        <p>10억원 이상이 거래되었습니다.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div>
                        <i class="fa fa-trophy"></i>
                        <label><strong>2명</strong>
                            <br/>개발자</label>
                        <p>
                            201411682 강경웅<br>
                            201411686 김건욱
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ALTERNATIVE SECTION -->
<!-- insert "sec-alternative" class into section tag -->

<!-- RIGHT SPOTLIGHT-->
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-push-7 spotlight-container">
                <h2 class="title-section"><span class="title-regular">경매</span><br/>어렵지 않습니다</h2>
                <hr class="title-underline"/>
                <p>
                    좋은 물건, 제 값 주고 팔고 싶은 당신!<br>
                    싸게 좋은 물건 얻고 싶은 당신!<br>
                    지금 당장 이 사이트를 가입하세요.<br>
                    당신의 물건은 당신이 결정합니다.
                </p>
            </div>
            <div class="col-md-6  col-md-pull-5 padding-0">
                <img class=" img-responsive" src="/img/main-right.jpg" alt=""/>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp"%>

<!-- Scripts -->
<!-- JQuery JavaScript -->
<script src="js/jquery.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="js/bootstrap.bundle.min.js"></script>
<!--  SHA256 HASH JavaScript -->
<script src="js/sha256.js"></script>

<script type="text/javascript">
</script>

</body>

</html>