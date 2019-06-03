<%@ page import="io.kkw.auction.spring.bean.AucProduct" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<% String auc = (String) request.getAttribute("informationBean"); %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="경기대학교 강경웅, 김건욱">

    <title>경기대학교 데이터베이스 프로그래밍 - Auction</title>

    <link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
    <link href="/css/auction.css" rel="stylesheet">
</head>

<body>

<%@ include file="nav.jsp" %>

<section class="page-section my-page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-section"><span class="title-regular">경매</span><br/>확인하기</h2>
                <hr class="title-underline"/>
            </div>
            <div class="image-container col-md-5">
                <div class="image-container col-md-12">
                    <img class="img-thumbnail" alt="" id="image"/>
                </div>
            </div>
            <div class="read-container col-md-7">
                <div class="read-row col-md-12"></div>
                <div class="auction-label col-md-2">제목</div>
                <div class="auction-value col-md-10" id="title"></div>
                <div class="read-row col-md-12"></div>
                <div class="auction-label col-md-2">작성자</div>
                <div class="auction-value col-md-4" id="userID"></div>
                <div class="auction-label col-md-2">분류</div>
                <div class="auction-value col-md-4" id="category"></div>
                <div class="read-row col-md-12"></div>
                <div class="auction-label col-md-2">시작</div>
                <div class="auction-value col-md-4" id="startDate"></div>
                <div class="auction-label col-md-2">마감</div>
                <div class="auction-value col-md-4" id="endDate"></div>
                <div class="read-row col-md-12"></div>
                <div class="col-md-2" style="text-align : center;  border-left : 2px solid #e6e5e5; font-size : 18px; font-weight: 700;">내용</div>
                <div class="col-md-10" style=" border-right : 2px solid #e6e5e5;color:#ffffff;font-size:18px;"></div>
                <div class="read-row col-md-12"></div>
                <div class="auction-value auction-content col-md-12" id="content">
                    좋은 물건을 팔고 싶어요~
                </div>
                <div class="read-row col-md-12"></div>
            </div>
            <div class="col-md-12 curr-auc">
                <div class="col-md-12 curr-auc-label">
                    현재 경매중
                </div>
                <div class="col-md-4 curr_price">
                    현재 입찰가 : <span id="currPriceDiv">5000</span> 원
                </div>
                <div class="form-group col-md-4">
                    <label for="inputPrice" class="inform-label">희망 입찰가</label>
                    <input type="number" class="form-control" id="inputPrice" value="1000">
                </div>
                <a href="/auction_page" class="btn btn-primary btn-lg col-md-4" style="margin-top : 15px;">입찰하기</a>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<script type="text/javascript">
    var inform = <%=auc%>;

    function setInform(){
        $('#title').text(inform['title']);
        $('#category').text(inform['psubject']);
        $('#userID').text(inform['userid']);
        $('#image').attr('src', '/read_auction/load/' + inform['id']);
        var startdate = new Date(inform['startdate']);
        var startFormat = '';
        var enddate = new Date(inform['enddate']);
        var endFormat = '';
        startFormat += startdate.getFullYear() + '-' + startdate.getMonth() + '-' + startdate.getDay() + ', ';
        startFormat += startdate.getUTCHours() + ':' + startdate.getMonth();
        endFormat += enddate.getFullYear() + '- ' + enddate.getMonth() + '- ' + enddate.getDay() + ', ';
        endFormat += enddate.getUTCHours() + ':' + enddate.getMonth();
        $('#startDate').text(startFormat);
        $('#endDate').text(endFormat);
        $('#content').text(inform['pcontent']);
    }

    function getCurrPrice(){
        $.ajax({
            url: "/read_auction/price/" + inform['id'],
            type: "post",
            data: {},
            dataType: "text",
            success: function (data) {
                $('#currPriceDiv').html(data);
            }
        });
    }

    $(document).ready(function(){
        setInform();
        setInterval(getCurrPrice, 1000);
    });
</script>

</body>

</html>