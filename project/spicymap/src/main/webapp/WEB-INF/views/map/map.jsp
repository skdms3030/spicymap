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

//지도에 마크 표시

for(var i=0; i<${list.length}; i++){
	console.log(list[i].storePoint);
}
/* foreach(()=>{
	
}) */
var markerOptions = {
		position : new naver.maps.LatLng(35.1797865, 129.0750194),
		map : map
};
var marker = new naver.maps.Marker(markerOptions);





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