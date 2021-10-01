<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    /* 헤더 */
    .header{
        width: 100%;
        height: 50px;
        background-color: white;
        margin : 5px 0;
    }
    .header div{
    	display : inline-block;
    }
    #logo{
    	height : 50px;
    	padding-left : 20px;
    }
    #logo img{
    	height : 100%;
    }
    #menus{
    	float : right;
    	margin-right : 20px;
    }
    .menu svg{
    	height : 50px;
    	width : 30px;
    	padding : 0 5px;
    	cursor:pointer;
    }
    

        a{text-decoration: none;color: black;}
        .button{ margin-top: 10px;}
        #logout{ width: 100%; padding:20px;}
        .button img{width: 150px;}
</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>

	<div onclick="naverLogout(); return false;">
      <a href="javascript:void(0)">
            <div class="button" id="logout">
                <img src="/resources/image/naver_logout2.png">
            </div>
      </a>
	</div>





<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

$("#logout").click(function(){
	
});

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "G9Ycg2BdCUzKJQbVYrIn", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:9090/map", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
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
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=200,height=100");
}
function closePopUp(){
    testPopUp.close();
}



function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		},);
	alert("로그아웃 되었습니다.")
	
	setTimeout(function(){
	window.location.href = "http://172.16.144.109:9090/";
}, 1500);
}
</script>
</body>
</html>