<%@ page import="io.kkw.auction.spring.bean.AucUserBean" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = (String) request.getAttribute("userid");
    String password = (String) request.getAttribute("password");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="경기대학교 강경웅, 김건욱">

    <title>경기대학교 데이터베이스 프로그래밍 - Auction</title>

    <!-- normalize core CSS -->
    <link href="css/normalize.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/carousel.css" rel="stylesheet">
    <link href="bootstrap/fonts/glyphicons-halflings-regular.eot" rel="stylesheet">

    <!-- Load jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="bootstrap/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <script src="bootstrap/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Fonts - Change if needed -->
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400italic,400,700,300,600' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen:400,700,300' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- Menu shrinking -->
    <script type="text/javascript" src="js/menu.js"></script>

    <!-- Main styles of this template -->
    <link href="css/style.min.css?v=1.0.0" rel="stylesheet">

    <!-- Custom CSS. Input here your changes -->
    <link href="css/custom.css" rel="stylesheet">
    <style>
        .nav-content {
            margin : 10px 0px;
            font-size : 21px !important;
        }
        .nav-content a {
            font-size : 21px !important;
        }
    </style>
</head>

<body>
<!-- Navigation -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.html"><img class="logo" src="img/logo.jpg" alt="Logo"></a>
        </div>
        <nav class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-content"><a href="components.html">로그인</a></li>
                <li class="nav-content"><a href="components.html">회원가입</a></li>
            </ul>
        </nav>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</div>


<!-- Hero Header -->
<header class="hero-header" style="background-image: url('img/main.jpg');">
    <div class="container">
        <div class="intro-text">
            <div class="intro-heading">Auction에 오신 걸 환영합니다!</div>
            <div class="intro-lead-in">현재 100만 개 이상의 물건이 경매되고 있습니다!</div>
            <a href="#intro" class="btn btn-primary btn-lg">경매 확인하기</a>
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
                        <p>벌써 수많은 유저분들이 애용하고 있습니다.</p>
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
                            <br/>데이터프로그래밍</label>
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

<!-- BLOG/LATEST NEWS-->
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">최신 등록된</span><br/>경매 물건</h2>
                <a href="blog-single-post.html" class="btn btn-sm btn-primary" style="float: right">더보기</a>
                <hr class="title-underline"/>
            </div>
        </div>
        <div class="row blog-listing">
            <div class="col-md-4">
                <article>
                    <img class="img-thumbnail" src="/img/item-example1.jpg" alt=""/>
                    <h2>물건 제목</h2>
                    <hr class="title-underline">
                    <p>
                        물건 설명
                    </p>
                    <div class="post-meta">
                        <span><i class="fa fa-calendar"></i> Aug 17, 2016 - 6:53</span>
                        <span><i class="fa fa-user"></i> By <a href="#">올린 사람</a></span>
                        <span><i class="fa fa-tag"></i> <a href="#">Duis</a>, <a href="#">관련 항목</a> </span>
                    </div>
                    <a href="blog-single-post.html" class="btn btn-xs btn-primary">확인하기</a>
                </article>
            </div>
            <div class="col-md-4">
                <article>
                    <img class="img-thumbnail" src="/img/item-example2.jpg" alt=""/>
                    <h2>물건 제목</h2>
                    <hr class="title-underline">
                    <p>
                        물건 설명
                    </p>
                    <div class="post-meta">
                        <span><i class="fa fa-calendar"></i> Aug 17, 2016 - 6:53</span>
                        <span><i class="fa fa-user"></i> By <a href="#">올린 사람</a></span>
                        <span><i class="fa fa-tag"></i> <a href="#">Duis</a>, <a href="#">관련 항목</a> </span>
                    </div>
                    <a href="blog-single-post.html" class="btn btn-xs btn-primary">확인하기</a>
                </article>
            </div>
            <div class="col-md-4">
                <article>
                    <img class="img-thumbnail" src="/img/item-example3.jpg" alt=""/>
                    <h2>물건 제목</h2>
                    <hr class="title-underline">
                    <p>
                        물건 설명
                    </p>
                    <div class="post-meta">
                        <span><i class="fa fa-calendar"></i> Aug 17, 2016 - 6:53</span>
                        <span><i class="fa fa-user"></i> By <a href="#">올린 사람</a></span>
                        <span><i class="fa fa-tag"></i> <a href="#">Duis</a>, <a href="#">관련 항목</a> </span>
                    </div>
                    <a href="blog-single-post.html" class="btn btn-xs btn-primary">확인하기</a>
                </article>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="page-section-no-padding  footer2-container">
    <div class="container">
        <div class="row">
            <!-- Copyright -->
            <div class="col-xs-6">
                <p>이 웹사이트는 <a href="http://www.cs.kyonggi.ac.kr">학교 프로젝트</a>를 위해 만들어졌습니다.</p>
                <br>
                2019-1 데이터베이스 프로그래밍
                <a href="#">
                    강경웅, 김건욱
                </a>.
            </div>
        </div>
    </div>
</footer>

<!-- Scripts -->
<!-- Loads Bootstrap Main JS -->
<script src="bootstrap/js/bootstrap.min.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>

<!-- Initiate Google Maps - For more Infos look into the documentation -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script src="js/google-map.js"></script>

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