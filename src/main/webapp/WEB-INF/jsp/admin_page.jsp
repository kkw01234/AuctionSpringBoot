<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<% String userInform = (String) request.getAttribute("user"); %>
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
                <h2 class="title-section">관리 페이지</h2>
                <hr class="title-underline"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 my-page-tab-container">
                <a onclick="clickUserList();"><div class="col-md-12 my-page-tab tab-selected" id="tab0">유저 리스트</div></a>
                <a onclick="clickCheckAucs();"><div class="col-md-12 my-page-tab" id="tab1">경매 확인</div></a>
            </div>
            <div class="col-md-9 my-page-content-container" id="myPageContentContainer">
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<script type="text/javascript">
    var curr = 0;

    function setUserList(users){
        var addOn = '<div class="col-md-3 message-col">ID</div>' +
            '<div class="col-md-4 message-col">EMAIL</div>' +
            '<div class="col-md-3 message-col">PHONE</div>' +
            '<div class="col-md-2 message-col">STATE</div>';
        for(var i = 0 ; i < users.length ; i++) {
            var user = users[i];
            var addButton = '';
            if(user['stopdate'] == null) {
                addButton = '<a onclick="stopUser(\'' + user['id'] + '\')"><div class="btn btn-primary btn-sm">정지</div></a>';
            } else {
                addButton = '<a onclick="releaseUser(\'' + user['id'] + '\')"><div class="btn btn-primary btn-sm">취소</div></a>'
            }
            addOn += '<div class="col-md-3 message-val">' + user['id'] + '</div>' +
                '<div class="col-md-4 message-val">' + user['email'] + '</div>' +
                '<div class="col-md-3 message-val">' + user['phone'] + '</div>' +
                '<div class="col-md-2 message-val">' + addButton + '</div>';
        }
        $('#myPageContentContainer').html(addOn);
    }

    function stopUser(userID) {
        $.ajax({
            url: "/user/stop",
            type: "post",
            data: {
                'userid' : userID
            },
            dataType: "text",
            success: function (data) {
                showUserList();
            },
            error: function (error) {
                alert('유저 정지에 실패했습니다.');
            }
        });
    }

    function releaseUser(userID) {
        $.ajax({
            url: "/user/release",
            type: "post",
            data: {
                'userid' : userID
            },
            dataType: "text",
            success: function (data) {
                showUserList();
            },
            error: function (error) {
                alert('정지 해제에 실패했습니다.');
            }
        });
    }

    function showUserList(){
        $.ajax({
            url: "/user",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                setUserList(data);
            }
        });
    }

    function registerAuc(aucID) {
        $.ajax({
            url: "/modify_auction/checkauthorize/" + aucID,
            type: "post",
            data: {},
            dataType: "text",
            success: function (data) {
                showAucs();
            },
            error: function (error) {
                alert('승인에 실패했습니다.');
            }
        });
    }

    function setAucs(aucs){
        var addOn = '<div class="col-md-3 message-col">WRITER</div>' +
            '<div class="col-md-4 message-col">TITLE</div>' +
            '<div class="col-md-3 message-col">OPEN DATE</div>' +
            '<div class="col-md-2 message-col">STATE</div>';
        for(var i = 0 ; i < aucs.length ; i++) {
            var auc = aucs[i];
            console.log(auc);
            var date = new Date(auc['startdate'])
            var dateFormat = date.getFullYear() + '-' + date.getMonth() + '-' + date.getDay() + ', ';
            dateFormat += date.getUTCHours() + ':' + date.getMonth();
            var addButton = '<a onclick="registerAuc(\'' + auc['id'] + '\')"><div class="btn btn-primary btn-sm">승인</div></a>';
            addOn += '<div class="col-md-3 message-val">' + auc['userid'] + '</div>' +
                '<div class="col-md-4 message-val"><a href="/read_auction/' + auc['id'] + '">' + auc['title'] + '</a></div>' +
                '<div class="col-md-3 message-val">' + dateFormat + '</div>' +
                '<div class="col-md-2 message-val">' + addButton + '</div>';
        }
        $('#myPageContentContainer').html(addOn);
    }

    function showAucs(){
        $.ajax({
            url: "/read_auction/unauthorized",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                setAucs(data);
            }
        });
    }

    function clickUserList(){
        if(curr == 0) return;
        $('#tab' + curr).removeClass('tab-selected');
        curr = 0;
        $('#tab' + curr).addClass('tab-selected');
        showUserList();
     }

    function clickCheckAucs(){
        if(curr == 1) return;
        $('#tab' + curr).removeClass('tab-selected');
        curr = 1;
        $('#tab' + curr).addClass('tab-selected');
        showAucs();
    }

    $(document).ready(function(){
        showUserList();
    })
</script>

</body>

</html>