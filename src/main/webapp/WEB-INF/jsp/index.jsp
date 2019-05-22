<%@ page import="io.kkw.auction.spring.bean.AucUserBean" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%
    AucUserBean user = (AucUserBean) session.getAttribute("user");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="경기대학교 강경웅, 김건욱">

    <title>경기대학교 데이터베이스 프로그래밍 - Auction</title>

    <link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">

    <!-- for modal -->
    <link href="css/main.css" rel="stylesheet">

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
            margin: 10px 0px;
            font-size: 21px !important;
        }

        .nav-content a {
            font-size: 21px !important;
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
                <%
                    if(user == null) {
                %>
                <li class="nav-content"><a data-toggle="modal" href="#loginModal">로그인</a></li>
                <li class="nav-content"><a data-toggle="modal" href="#registerModal">회원가입</a></li>
                <%
                    } else {
                %>
                <li class="nav-content"><a data-toggle="modal" href="#">경매물품 확인</a></li>
                <li class="nav-content"><a data-toggle="modal" href="#">개인정보</a></li>
                <li class="nav-content"><a data-toggle="modal" href="logout">로그아웃</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</div>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModelLabel" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="loginmodal-container">
                <h1 class="modal-title">로그인</h1>
                <div class="inform-login" id="inform_login"></div>
                <form>
                    <input type="text" name="id" id="id" placeholder="아이디">
                    <input type="password" name="pass" id="pass" placeholder="패스워드">
                </form>
                <button class="login loginmodal-submit" onclick="goLogin()" id="login_button">로그인</button>
                <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" data-width="290" data-height="44"
                     data-longtitle="true"></div>
                <div class="login-help">
                    <a href="#" onclick="clickRegister();">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Register Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModelLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="loginmodal-container registermodal-container">
                <h1 class="modal-title">회원가입</h1>
                <br>
                <form>
                    <div class="form-group">
                        <label for="InputId">아이디</label><span class="form-alert" id="email-span"></span>
                        <input type="text" class="form-control" id="InputId" placeholder="아이디를 입력하세요"
                               onkeyup="checkPassword()">
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">패스워드</label><span class="form-alert" id="password-span-1">6자 이상, 영문과 숫자의 조합 (특수문자 금지)</span>
                        <input type="password" class="form-control" id="InputPassword" placeholder="패스워드를 입력하세요"
                               onkeyup="checkPassword()">
                    </div>
                    <div class="form-group">
                        <label for="InputPasswordCheck">패스워드 확인</label>
                        <input type="password" class="form-control" id="InputPasswordCheck"
                               placeholder="패스워드를 다시 입력해주세요" onkeyup="checkPassword()">
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일</label>
                        <input type="text" class="form-control" id="InputEmail" placeholder="이메일을 입력하세요"
                               onkeyup="checkPassword()">
                    </div>
                    <div class="form-group">
                        <label for="InputAddress">주소</label>
                        <input type="text" class="form-control" id="InputAddress" placeholder="주소 입력하세요"
                               onkeyup="checkPassword()">
                    </div>
                    <div class="form-group">
                        <label for="InputPhone">휴대전화 번호</label>
                        <input type="text" class="form-control" id="InputPhone" placeholder="번호를 입력하세요"
                               onkeyup="checkPassword()">
                    </div>
                    <div class="form-group">
                        <label for="InputAccount">계좌</label>
                        <input type="text" class="form-control" id="InputAccount" placeholder="계좌번호를 입력하세요"
                               onkeyup="checkPassword()">
                    </div>
                </form>
                <button class="login loginmodal-submit registermodal-submit" onclick="doRegister()"
                        id="register_button">회원가입
                </button>
            </div>
        </div>
    </div>
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

    function clickRegister(){
        $('#loginModal').modal('hide');
        $('#registerModal').modal('show');
    }

    function loginError(choose){
        switch(choose){
            case 1:
                $('#inform_login').html('빈 칸을 채워주세요.');
                break;
            case 2:
                $('#inform_login').html('잘못된 이메일과 비밀번호입니다.');
                break;
            case 3:
                $('#inform_login').html('정지된 회원입니다.');
        }
    }

    function goLogin(){
        var email = $('#id').val();
        var password = $('#pass').val();
        if(email == '' || password == ''){
            loginError(1);
            return;
        }
        // password = SHA256(email + password);

        $.ajax({
            url : "login",
            type : "post",
            data : {
                id : email,
                password : password
            },
            dataType : "html",
            success : function(data) {
            }
        });
    }

    var isSafePassword;
    var pattern = [];
    pattern.push('0123456789');
    pattern.push('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
    function checkPattern(password){
        isSafePassword = 0 ;
        var full_check1 = 0;
        var full_check2 = 0;
        var check1;
        var check2;
        for(var i = 0; i < password.length ; ++i){
            var check1 = 0;
            var check2 = 0;
            if(pattern[0].indexOf(password[i]) >= 0) {
                full_check1 = 1;
                check1 = 1;
            }
            if(pattern[1].indexOf(password[i]) >= 0) {
                full_check2 = 1;
                check2 = 1;
            }
            if(check1 == 0 && check2 == 0){
                full_check1 = 0;
                break;
            }
        }
        if(full_check1 == 1 && full_check2 == 1){
            isSafePassword = 1;
        }
    }

    function checkPassword(){
        checkPattern($('#InputPassword').val());
        if($('#InputPassword').val().length < 6 || isSafePassword == 0){
            $('#password-span-1').html('6자 이상, 영문과 숫자의 조합 (특수문자 금지)');
            $('#password-span-1').css('color', 'red');
        }
        else if($('#InputPassword').val() == $('#InputPasswordCheck').val()){
            $('#password-span-1').html('비밀번호가 일치합니다');
            $('#password-span-1').css('color', 'blue');
        }
        else{
            $('#password-span-1').html('비밀번호를 확인해주세요.');
            $('#password-span-1').css('color', 'red');
        }
    }

    var onRegister = 0;
    function doRegister(){
        if(onRegister == 1) return;
        onRegister = 1;
        var id = $('#InputId').val();
        var password = $('#InputPassword').val();
        var email = $('#InputEmail').val();
        var phone = $('#InputPhone').val();
        var address = $('#InputAddress').val();
        var account = $('#InputAccount').val();

        if(id== '' || email == '' || password == '' || phone == '' || address == '' || account == '') {
            onRegister = 0;
            alert('빈 칸을 채워주세요.');
            return;
        } else if (isSafePassword == 0) {
            onRegister = 0;
            alert('비밀번호를 확인해주세요.');
            return;
        }
        // password = SHA256(email + password);
        $.ajax({
            url : "register",
            type : "post",
            data : {
                id : id,
                password : password,
                email : email,
                phone : phone,
                address : address,
                account : account
            },
            dataType : "html",
            success : function(data) {

            }
        });
    }

</script>

</body>

</html>