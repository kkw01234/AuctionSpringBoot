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

<section class="page-section" style="padding:50px 0;">
    <div class="insert-div">
        <h3>지금 바로 당신의 물건을 등록해보세요!</h3>
        <a <%if (user == null) { %>
                data-toggle="modal" href="#loginModal"
                <%} else {%>
                href="/create_auction"
                <%}%> class="btn btn-primary btn-lg insert-btn">물건 등록하기</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">최근 등록된</span><br/>경매 물건</h2>
                <hr class="title-underline"/>
            </div>
        </div>
        <div class="row blog-listing">
            <div class="col-md-4">
                <a href="">
                    <article>
                        <img class="img-thumbnail" src="/img/item-example1.jpg" alt=""/>
                        <h2>맛있는 빵</h2>
                        <hr class="title-underline">
                        <p>갓경웅이 직접 구운 맛있는 빵</p>
                        <div>
                            <div>
                                <i class="fa fa-calendar"></i> 2019 05 26 17 00
                            </div>
                            <div>
                                <i class="fa fa-user"></i> 갓경웅
                            </div>
                            <div>
                                <i class="fa fa-tag"></i> 가구 식품
                            </div>
                        </div>
                    </article>
                </a>
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
                    <div>
                        <span><i class="fa fa-calendar"></i> Aug 17, 2016 - 6:53</span>
                        <span><i class="fa fa-user"></i> By <a href="#">올린 사람</a></span>
                        <span><i class="fa fa-tag"></i> <a href="#">Duis</a>, <a href="#">관련 항목</a> </span>
                    </div>
                </article>
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
                </article>
            </div>
        </div>
        <div class="row col-md-12">
            <button class="more-button">
                더보기
            </button>
        </div>
    </div>
</section>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<!-- Scripts -->
<!-- Loads Bootstrap Main JS -->
<script src="bootstrap/js/bootstrap.min.js"></script>
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