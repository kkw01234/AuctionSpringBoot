<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%
    String auc = (String) request.getAttribute("informationBean");
    String complete = (String) request.getAttribute("completeBean");
%>

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
                <div class="col-md-2"
                     style="text-align : center;  border-left : 2px solid #e6e5e5; font-size : 18px; font-weight: 700;">
                    내용
                </div>
                <div class="col-md-10" style=" border-right : 2px solid #e6e5e5;color:#ffffff;font-size:18px;"></div>
                <div class="read-row col-md-12"></div>
                <div class="auction-value auction-content col-md-12" id="content">
                    좋은 물건을 팔고 싶어요~
                </div>
                <div class="read-row col-md-12"></div>
            </div>
            <div class="col-md-12 curr-auc" id="informDiv">
                <div class="col-md-12 curr-auc-label" id="currLabel">
                </div>
                <div class="col-md-4 curr_price">
                    <span id="currPriceLabel" style="color : black;">현재 입찰가</span> : <span id="currPriceDiv"></span> 원
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<script type="text/javascript">
    var inform = <%=auc%>;
    console.log(inform);
    var curr = 0;

    function setInform() {
        $('#title').text(inform['title']);
        $('#category').text(inform['psubject']);
        $('#userID').text(inform['userid']);
        $('#image').attr('src', '/read_auction/load/' + inform['id']);
        var startdate = new Date(inform['startdate']);
        var startFormat = '';
        var enddate = new Date(inform['enddate']);
        var endFormat = '';
        startFormat += startdate.getFullYear() + '-' + (startdate.getMonth() + 1) + '-' + startdate.getDate() + ', ';
        startFormat += startdate.getUTCHours() + ':' + startdate.getMonth();
        endFormat += enddate.getFullYear() + '- ' + (enddate.getMonth() + 1) + '- ' + enddate.getDate() + ', ';
        endFormat += enddate.getUTCHours() + ':' + enddate.getMonth();
        $('#startDate').text(startFormat);
        $('#endDate').text(endFormat);
        $('#content').text(inform['pcontent']);
        var today = new Date();
        if (startdate > today) {
            $('#currLabel').html('경매 준비 중입니다!')
            $('#currPriceLabel').html('시작 입찰가');
            $('#informDiv').append('<div class="form-group col-md-4">' +
                '<label for="inputPrice" class="inform-label">희망 입찰가</label>' +
                '<input type="number" class="form-control" id="inputPrice" value="1000">' +
                '</div>' +
                '<a class="btn btn-primary btn-lg col-md-4" style="margin-top : 15px;" id="currButton">입찰하기</a>');
            $('#currButton').attr('disabled', true);
            $('#inputPrice').attr('readonly', true);
        } else if (enddate < today) {
            $('#currLabel').html('경매가 종료되었습니다!')
            $('#currPriceLabel').html('최종 입찰가');
            var complete = <%=complete%>;
            console.log(complete);
            if (complete['tenderUserId'] == undefined) {
                $('#informDiv').append('<div class="col-md-4 curr-auc-label">입찰자가 없습니다!' +
                    '</div><div class="col-md-4"></div>');
            } else {
                var userID = <%if(aucUser != null){%>
                    '<%=aucUser.getId()%>';
                <%} else {%>
                'NONENONENONENONE';
                <% } %>
                var writerID = inform['userid'];
                var tenderID = complete['tenderUserId'];
                var writerCheck = complete['uidCheck'];
                var tenderCheck = complete['tenderIdCheck'];
                var writerButton = '대기';
                var tenderButton = '대기';
                if (writerCheck != undefined) {
                    writerButton = '승인';
                }
                if (tenderCheck != undefined) {
                    tenderButton = '승인';
                }
                var btnFormat = '승인';
                if (userID == tenderID) {
                    if (tenderButton == '대기') {
                        btnFormat = '<a onclick="clickCheck();"><div class="col-md-12 btn btn-primary btn-sm" style="color : white;">승인</div></a>'
                    }
                    $('#informDiv').append('<div class="col-md-8">' +
                        '<div class="col-md-6 curr_price">ID</div><div class="col-md-6 curr_price">State</div>' +
                        '<div class="col-md-6 curr_price">' + writerID + '</div><div class="col-md-6 curr_price">' + writerButton + '</div>' +
                        '<div class="col-md-6 curr_price">' + tenderID + '</div><div class="col-md-6 curr_price">' + btnFormat + '</div>' +
                        '</div>');
                } else if (userID == writerID) {
                    if (writerButton == '대기') {
                        btnFormat = '<a onclick="clickCheck();"><div class="col-md-12 btn btn-primary btn-sm" style="color : white;">승인</div></a>'
                    }
                    $('#informDiv').append('<div class="col-md-8">' +
                        '<div class="col-md-6 curr_price">ID</div><div class="col-md-6 curr_price">State</div>' +
                        '<div class="col-md-6 curr_price">' + writerID + '</div><div class="col-md-6 curr_price">' + btnFormat + '</div>' +
                        '<div class="col-md-6 curr_price">' + tenderID + '</div><div class="col-md-6 curr_price">' + tenderButton + '</div>' +
                        '</div>');
                } else {
                    $('#informDiv').append('<div class="col-md-4 curr_price">최종 입찰자 : ' + tenderID + '</div>');
                    $('#informDiv').append('<div class="col-md-4 curr_price">축하드립니다!</div>');
                }
            }
        } else {
            $('#currLabel').html('현재 경매 중!')
            $('#informDiv').append('<div class="form-group col-md-4">' +
                '<label for="inputPrice" class="inform-label">희망 입찰가</label>' +
                '<input type="number" class="form-control" id="inputPrice" value="1000">' +
                '</div>' +
                '<a class="btn btn-primary btn-lg col-md-4" style="margin-top : 15px;" id="currButton">입찰하기</a>');
            $('#currButton').attr('onclick', 'doAuc()');
        }
    }

    function clickCheck() {
        $.ajax({
            url: "/read_auction/check/" + inform['id'],
            type: "post",
            data: {},
            dataType: "text",
            success: function (data) {
                location.href = '/read_auction/' + inform['id'];
            }, error: function (error) {
                alert('승인에 실패했습니다.');
            }
        });
    }

    function getCurrPrice() {
        $.ajax({
            url: "/read_auction/price/" + inform['id'],
            type: "post",
            data: {},
            dataType: "text",
            success: function (data) {
                $('#currPriceDiv').html(data);
                curr = Number(data);
            },
            error: function (error) {
                console.log('현재 입찰 값을 받아오는 데 문제가 있습니다.');
            }
        });
    }

    function doAuc() {
        <%if (user == null) { %>
        $('#loginModal').modal('show');
        <%} else {%>
        var want = Number($('#inputPrice').val());
        if (curr >= want) {
            alert('입찰금이 부족합니다.')
            return;
        }
        $.ajax({
            url: "/bidding/" + inform['id'],
            type: "post",
            data: {
                'price': want
            },
            dataType: "text",
            success: function (data) {
                if (data == 'true') {
                    alert('입찰에 성공했습니다.');
                } else {
                    alert('입찰 실패!');
                }
            },
            error: function (error) {
                alert('입찰 실패!');
            }
        });
        <% } %>
    }

    $(document).ready(function () {
        setInform();
        setInterval(getCurrPrice, 1000);
    });
</script>

</body>

</html>