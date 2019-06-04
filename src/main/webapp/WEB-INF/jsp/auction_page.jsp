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
    <link href="css/auction.css" rel="stylesheet">

</head>

<body>

<%@ include file="nav.jsp" %>

<section class="page-section my-page-section">
    <div class="container">
        <a onclick="clickFuture();">
            <div class="col-md-4 tab" id="tab0">진행 예정</div>
        </a>
        <a onclick="clickCurrent();">
            <div class="col-md-4 tab selected-tab" id="tab1">진행 중</div>
        </a>
        <a onclick="clickPast();">
            <div class="col-md-4 tab" id="tab2">진행 완료</div>
        </a>
        <div class="col-md-12 tab-row"></div>
        <div class="insert-div col-md-12">
            <h3>지금 바로 당신의 물건을 등록해보세요!</h3>
            <a <%if (user == null) { %>
                    data-toggle="modal" href="#loginModal"
                    <%} else {%>
                    href="/create_auction"
                    <%}%> class="btn btn-primary btn-lg insert-btn">물건 등록하기</a>
        </div>
        <div class="row col-md-12">
            <div class="col-md-8">
                <h2 class="title-section"><span class="title-regular" id="adjective">진행 중인</span><br/>경매 물건</h2>
                <hr class="title-underline"/>
            </div>
            <div class="col-md-4">
                <div class="search-container input-group">
                    <input class="form-control" type="text" placeholder="검색하기" id="search"
                           onkeyup="if(event.keyCode==13){doSearch();}">
                    <div class="input-group-addon" style="padding : 0px 10px; border : none;"><a
                            onclick="doSearch();"><img src="/img/search.png"></a></div>
                </div>
            </div>
        </div>
        <div id="auc-container">
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
    var curr = 4;
    var auc_list;

    function setAucList() {
        var aucs = $('#auc-container');
        var result = ''
        for (var i = 0; i < auc_list.length; i++) {
            if(i % 3 == 0) result += '<div class="row blog-listing">';
            var auc = auc_list[i];
            console.log(auc);
            var startdate = new Date(auc['startdate']);
            console.log(auc['startdate']);
            console.log(startdate)
            var enddate = new Date(auc['enddate']);
            console.log(auc['enddate']);
            console.log(enddate);
            var startFormat = '';
            var endFormat = '';
            startFormat += startdate.getFullYear() + '년 ' + (startdate.getMonth() + 1) + '월 ' + startdate.getDate() + '일, ';
            startFormat += startdate.getUTCHours() + '시 ' + startdate.getMinutes() + '분'
            endFormat += enddate.getFullYear() + '년 ' + (enddate.getMonth() + 1) + '월 ' + enddate.getDate() + '일, ';
            endFormat += enddate.getUTCHours() + '시 ' + enddate.getMinutes() + '분'
            result += '<div class="col-md-4"><a href="/read_auction/' + auc['id'] + '">' + '<article>' +
                '<img class="img-thumbnail" src="/read_auction/load/' + auc['id'] + '" alt=""/>' +
                '<h2>' + auc['title'] + '</h2>' + '<hr class="title-underline">' +
                '<p>' + auc['pcontent'] + '</p>' + '<div>' + '<div>' +
                '<i class="fa fa-calendar"></i> 시작 : ' + startFormat + '</div>' +
                '<div>' + '<i class="fa fa-calendar"></i> 종료 : ' + endFormat + '</div>' +
                '<div>' + '<i class="fa fa-user"></i> 작성자 : ' + auc['userid'] + '</div>' + '<div>' +
                '<i class="fa fa-tag"></i> 분류 : ' + auc['psubject'] + '</div>' + '</div>' +
                '</article>' + '</a>' + '</div>'
            if(i % 3 == 2) result += '</div>';
        }
        if(auc_list % 3 != 2) result += '</div>';
        aucs.html(result);
    }

    function clickFuture() {
        if (curr == 0) return;
        $('#tab' + curr).removeClass('selected-tab');
        curr = 0;
        $('#tab' + curr).addClass('selected-tab');
        $('#adjective').text("진행 예정인");
        $.ajax({
            url: "read_auction/plan",
            type: "post",
            data: {},
            async: false,
            dataType: "json",
            success: function (data) {
                auc_list = data;
                setAucList();
            }
        });
    }

    function clickCurrent() {
        if (curr == 1) return;
        $('#tab' + curr).removeClass('selected-tab');
        curr = 1;
        $('#tab' + curr).addClass('selected-tab');
        $('#adjective').text("진행 중인");
        $.ajax({
            url: "read_auction/progress",
            type: "post",
            data: {},
            async: false,
            dataType: "json",
            success: function (data) {
                auc_list = data;
                setAucList();
            }
        });
    }

    function clickPast() {
        if (curr == 2) return;
        $('#tab' + curr).removeClass('selected-tab');
        curr = 2;
        $('#tab' + curr).addClass('selected-tab');
        $('#adjective').text("진행 완료된");
        $.ajax({
            url: "read_auction/complete",
            type: "post",
            data: {},
            async: false,
            dataType: "json",
            success: function (data) {
                auc_list = data;
                setAucList();
            }
        });
    }

    $(document).ready(function(){
        clickCurrent();
    });

    function doSearch() {
        var url = '';
        var search = $('#search').val();
        if(curr == 0) { // 예정
            url = '/read_auction/plan/search';
        } else if (curr == 1) { // 진행 중
            url = '/read_auction/progress/search';
        } else { // 완료
            url = '/read_auction/complete/search';
        }
        $.ajax({
            url: url,
            type: "post",
            data: {
                'search' : search
            },
            async: false,
            dataType: "json",
            success: function (data) {
                auc_list = data;
                setAucList();
            }
        });
    }
</script>

</body>

</html>