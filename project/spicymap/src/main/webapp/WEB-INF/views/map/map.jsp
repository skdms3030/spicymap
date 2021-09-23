<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u8dcfkplo9"></script>
	<script src="/resources/jq/jquery.js"></script>
	
	<script>
		$().ready(()=>{
			
			$.ajax({
				url : "/map/init",
				success : function(data){
					
					for(var i=0; i<data.length; i++){
						console.log(data[i].storePointX +" , " +data[i].storePointY);
						
						var markerOptions = {
								position : new naver.maps.LatLng(data[i].storePointX, data[i].storePointY),
								map : map
						};  //markerOptions 끝
						
						var marker = new naver.maps.Marker(markerOptions);
					}//for 끝
					
					
				}//success 끝
			})//ajax 끝
			
			
		$('')
		});//레디 끝
	</script>

<style type="text/css">
    .buttons { position:absolute;top:0;left:0;z-index:1000;padding:5px; }
    .control-btn { margin:0 5px 5px 0; }
    
    
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
    	display : float;
    	margin-left : 0;
    }
    .menu svg{
    	height : 50px;
    	width : 30px;
    	padding : 0 5px;
    }
</style>
</head>
<body>
<div class="header">
    <div id="logo"><img src="/resources/image/logo_and_text.png"></div>
    <div id="menus">
        <div class="menu">
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
  			<path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
  			<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
			</svg></div>
        <div class="menu">
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  			<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
        </div>
        <div class="menu">
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
  			<path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
  			<path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
			</svg>
        </div>
    </div>
</div>


<div id="map" style="width:100%;height:500px;">
        <div class="buttons">
            <input id="to-busan" type="button" value="부산으로" class="control-btn" />
        </div>
</div>
    
    
   
<script id="code">


//지도 시작시 기본 위치
var mapOptions = {
    center: new naver.maps.LatLng(36.350698, 127.453216),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);





//지도에 마크표시 대전
var markerOptions = {
		position : new naver.maps.LatLng(36.350698, 127.453216),
		map : map
};
var marker = new naver.maps.Marker(markerOptions);

//지도에 마크표시 부산
var markerOptions = {
		position : new naver.maps.LatLng(35.1797865, 129.0750194),
		map : map
};
var marker = new naver.maps.Marker(markerOptions);





//클릭 이벤트

/* var HOME_PATH = window.HOME_PATH || '.'; */

/* var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
    map = new naver.maps.Map('map', {
        center: cityhall.destinationPoint(0, 500),
        zoom: 15
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: cityhall
    }); */
var contentString = [
        '<div class="iw_inner">',
        '   <h3>서울특별시청</h3>',
        '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
        '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
        '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
        '   </p>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

/* infowindow.open(map, marker); */





//부산 바로가기 버튼
var busan = new naver.maps.LatLng(35.1797865, 129.0750194);

$("#to-busan").on("click", function(e) {
    e.preventDefault();
	map.setZoom(15, true);
    map.panTo(busan);
   
});



</script>

</body>
</html>