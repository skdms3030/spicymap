<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="/resources/jq/jquery.js"></script>
	    <style>
        body{
            height: auto;}
        a{text-decoration: none;color: black;}
        .align{width: 150px; height: 100%; margin: auto;}
        #logo{width: 150px; margin-top: 100%;}
        .button{ margin-top: 10px;}
        #login{ width: 100%;}
        #logout{ width: 100%;}
        .button img{width: 150px;}
        .notMember{padding: 5px;font-size: 5px;float: right;}
    </style>
</head>
<body>

<div class="align">
    <img id="logo" src="/resources/image/logo.png">

      <!-- 아래와같이 아이디를 꼭 써준다. -->
      <a id="naverIdLogin_loginButton" href="javascript:void(0)">
            <div class="button" id="login">
                <img src="/resources/image/naver_login2.png">
            </div>
      </a>

	<div onclick="naverLogout(); return false;">
      <a href="javascript:void(0)">
            <div class="button" id="logout">
                <img src="/resources/image/naver_logout2.png">
            </div>
      </a>
	</div>

    <a href="map/"><p class="notMember">비회원 이용</p></a>
</div>




<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "G9Ycg2BdCUzKJQbVYrIn", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://192.168.123.102:9090/map/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>

</body>
</html>