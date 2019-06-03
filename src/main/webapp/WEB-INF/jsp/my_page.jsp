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
                <h2 class="title-section">MY PAGE</h2>
                <hr class="title-underline"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 my-page-tab-container">
                <a onclick="clickMyPage();"><div class="col-md-12 my-page-tab tab-selected" id="tab0">개인 정보</div></a>
                <a onclick="clickMessage();"><div class="col-md-12 my-page-tab" id="tab1">쪽지 확인</div></a>
                <a onclick="clickAuc();"><div class="col-md-12 my-page-tab" id="tab2">경매 확인</div></a>
                <a data-toggle="modal" href="#changeModal"><div class="col-md-12 my-page-tab" id="tab3">비밀번호 변경</div></a>
            </div>
            <div class="col-md-9 my-page-content-container" id="myPageContentContainer">
            </div>
        </div>
    </div>
</section>

<!-- change password Modal -->
<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="changeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="loginmodal-container registermodal-container">
                <h1>비밀번호 변경</h1>
                <br>
                <div class="form-group">
                    <label for="InputCurrPwd" class="sr-only">현재 비밀번호</label>
                    <input type="password" class="form-control" id="InputCurrPwd" placeholder="현재 비밀번호를 입력하세요.">
                </div>
                <div class="form-group">
                    <label for="InputNextPwd" class="sr-only">변경할 비밀번호</label>
                    <input type="password" class="form-control" id="InputNextPwd" placeholder="변경할 비밀번호를 입력하세요.">
                </div>
                <button class="login loginmodal-submit registermodal-submit" onclick="changePwd();">변경</button>
            </div>
        </div>
    </div>
</div>

<!-- MESSAGE MODAL -->
<div class="modal" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            <div class="modal-body" id="messageBody">
            </div>
        </div>
    </div>
</div>


<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<script type="text/javascript">
    var curr = 0;
    var user = <%=userInform%>;
    function showMyPage(){
        var result = '';
        var userID = user['id'];
        var userEmail = user['email'];
        var userAddr = user['address'];
        var userPhone = user['phone'];
        var userAccount = user['account'];
        result += ' <div class="col-md-4 my-page-label">아이디</div><div class="col-md-8 my-page-value" id="idDiv">' + userID + '</div>';
        result += '<div class="col-md-4 my-page-label">이메일</div><div class="col-md-8 my-page-value" id="emailDiv">' + userEmail + '</div>';
        result += '<div class="col-md-4 my-page-label">주소</div><div class="col-md-8 my-page-value" id="addrDiv">' + userAddr + '</div>';
        result += '<div class="col-md-4 my-page-label">전화번호</div><div class="col-md-8 my-page-value" id="phoneDiv">' + userPhone + '</div>';
        result += '<div class="col-md-4 my-page-label">계좌번호</div><div class="col-md-8 my-page-value" id="accountDiv">' + userAccount + '</div>';
        result += '<div class="col-md-8"></div><div class="col-md-4" id="myBtnDiv">';
        result += '<a onclick="changeMyData();" id="btnA"><div class="col-md-12 btn-primary btn-sm btn" id="myBtn">CHANGE</div></a></div>';
        $('#myPageContentContainer').html(result);
    }

    function changeMyData(){
        $('#emailDiv').html('<input id="inputEmail" type="text" class="form-control" value="' + user['email'] + '">');
        $('#addrDiv').html('<input id="inputAddr" type="text" class="form-control" value="' + user['address'] + '">');
        $('#phoneDiv').html('<input id="inputPhone" type="text" class="form-control" value="' + user['phone'] + '">');
        $('#accountDiv').html('<input id="inputAccount" type="text" class="form-control" value="' + user['account'] + '">');
        $('#myBtnDiv').html('<a onclick="requestChange();"><div class="col-md-6 btn-primary btn-sm btn">수정</div></a>' +
                            '<a onclick="exitChange();"><div class="col-md-6 btn-primary btn-sm btn">취소</div></a>')
    }

    function requestChange(){
        var email = $('#inputEmail').val();
        var addr = $('#inputAddr').val();
        var phone = $('#inputPhone').val();
        var account = $('#inputAccount').val();
        $.ajax({
            url: "/user/mypage/update",
            type: "post",
            data: {
                'email' : email,
                'address' : addr,
                'phone' : phone,
                'account' : account
            },
            dataType: "text",
            success: function (data) {
                location.href = "/user/mypage";
            }
        });
    }

    function exitChange(){
        showMyPage();
    }

    function clickMessage(body){
        $('#messageModal').modal('show');
        $('#messageBody').html(body);
    }

    function setMessages(messages){
        var addOn = '<div class="col-md-1 message-col">No</div>' +
            '<div class="col-md-6 message-col">Title</div>' +
            '<div class="col-md-2 message-col">FROM</div>' +
            '<div class="col-md-3 message-col">WHEN</div>';
        for(var i = 0 ; messages.length ; i++) {
            var message = messages[i];
            var date = new Date(message['data_send'])
            var dateFormat = date.getFullYear() + '-' + date.getMonth() + '-' + date.getDay() + ', ';
            dateFormat += date.getUTCHours() + ':' + date.getMonth();
            addOn += '<div class="col-md-1 message-val">' + (i + 1) + '</div>' +
                '<div class="col-md-6 message-val"><a onclick="clickMessage(\'' + message['content'] + '\')">' + message['content'] + '</a></div>' +
                '<div class="col-md-2 message-val">' + message['send_id'] + '</div>' +
                '<div class="col-md-3 message-val">' + dateFormat + '</div>';
        }
        $('#myPageContentContainer').html(addOn);
    }

    function showMessages(){
        $.ajax({
            url: "/note/receivelist",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                setMessages(data);
            }
        });
    }

    function setAuc(aucs){
        var addOn = '<div class="col-md-1 message-col">No</div>' +
            '<div class="col-md-6 message-col">Title</div>' +
            '<div class="col-md-2 message-col">State</div>' +
            '<div class="col-md-3 message-col">OPEN DATE</div>';
        for(var i = 0 ; i < aucs.length ; i++) {
            var auc = aucs[i];
            console.log(auc);
            var date = new Date(auc['startdate'])
            var dateFormat = date.getFullYear() + '-' + date.getMonth() + '-' + date.getDay() + ', ';
            dateFormat += date.getUTCHours() + ':' + date.getMonth();
            var state = '';
            if(auc['aucProgress']['approval'] == 1) state = '승인';
            else state = '대기';
            addOn += '<div class="col-md-1 message-val">' + (i + 1) + '</div>' +
                '<div class="col-md-6 message-val"><a href="/read_auction/' + auc['id'] + '">' + auc['title'] + '</a></div>' +
                '<div class="col-md-2 message-val">' + state + '</div>' +
                '<div class="col-md-3 message-val">' + dateFormat + '</div>';
        }
        $('#myPageContentContainer').html(addOn);
    }

    function showAuc(){
        $.ajax({
            url: "/read_auction/myauction",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                setAuc(data);
            }
        });
    }

    function clickMyPage(){
        if(curr == 0) return;
        $('#tab' + curr).removeClass('tab-selected');
        curr = 0;
        $('#tab' + curr).addClass('tab-selected');
        showMyPage();
     }

    function clickMessage(){
        if(curr == 1) return;
        $('#tab' + curr).removeClass('tab-selected');
        curr = 1;
        $('#tab' + curr).addClass('tab-selected');
        showMessages();
    }

    function clickAuc(){
        if(curr == 2) return;
        $('#tab' + curr).removeClass('tab-selected');
        curr = 2;
        $('#tab' + curr).addClass('tab-selected');
        showAuc();
    }

    function changePwd(){
        var curr = $('#InputCurrPwd').val();
        var next = $('#InputNextPwd').val();
        $.ajax({
            url: "/user/mypage/updatepassword",
            data: {
            type: "post",
                'password': curr,
                'changepassword': next
            },
            dataType: "text",
            success: function (data) {
                location.href='/user/mypage';
            }
        });
    }

    $(document).ready(function(){
        showMyPage();
    })
</script>

</body>

</html>