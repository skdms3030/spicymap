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
</style>
</head>
<body>
<div id="map" style="width:100%;height:600px;">
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