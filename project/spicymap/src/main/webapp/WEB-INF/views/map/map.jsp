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
			var i;
			var arr = new Array();

			
			$.ajax({
				url : "/map/init",
				success : function(data){
					
					
					for(i=0; i<data.length; i++){
						console.log(data[i].storePointX +" , " +data[i].storePointY);
						console.log(i);
						
						var id=i+1;
						console.log(id);
						
						
						
						var marker = new naver.maps.Marker({
							position : new naver.maps.LatLng(data[i].storePointX, data[i].storePointY),
							map : map,
							title : 'loc_'+id,
							});  //markerOptions 끝
						
						var marker = new naver.maps.Marker(markerOptions);
						
						arr[i] = marker; 

					}//for 끝
					
					//마커 클릭 이벤트
					  $('div[title*="loc_"]').click(function(){
						  	$(".store_modal .modal_incontent").empty();
						    $(".store_modal").fadeIn();
						    var tagId = $(this).attr('title').split("_")[1];
						    console.log(tagId);
						    
						    //$(".modal_incontent").append($("<div>"+tagId+"</div>"));
						    
 						    $.ajax({
								url : "/map/inmodal",
								data : {storeId:tagId},  //내가 보내는 데이터
								dataType:"json",
								contentType: "application/json",
								method:"get",
								success : function(storeInfo){ 
									console.log(storeInfo.storeName);
									$(".store_modal .modal_web").empty();
									$(".store_modal .modal_incontent").append($("<div id='storeTitle' class='storeInfo'>가게명 : "+storeInfo.storeName+"</div>"));
									$(".store_modal .modal_incontent").append($("<div id='storeAddress' class='storeInfo'>가게주소 : "+storeInfo.storeAddress+"</div>"));
									$(".store_modal .modal_incontent").append($("<div id='storeTel' class='storeInfo'>가게 전화번호 : "+storeInfo.storeTel+"</div>"));
									
									var storeName = storeInfo.storeName;
									var j;
									$.ajax({
										url : "/map/video",
										data : {storeName : storeName},
										dataType : "json",
										contentType : "application/json",
										method : "get",
										success : function(videoList){
											console.log(videoList);
											
											for(j=0; j<videoList.length; j++){
											$(".store_modal .modal_web").append($("<a href='"+videoList[j].href+"'><div class='img'><img src='"+videoList[j].img+"'></div></a>"));
											$(".store_modal .modal_web").append($("<a href='"+videoList[j].href+"'><div class='title'>"+videoList[j].title+"</div></a>"));
											}
											

										} //success 끝
									});  //in ajax 끝
								}
						    });  //ajax 끝
						    
						  });  //마커클릭 이벤트 끝
					  
					//스토어모달 닫기 클릭 이벤트
					$(".close_icon").click(function(){
						$(".store_modal").fadeOut();
					});  //모달 닫기 끝
					
					
					
					//검색창 모달 클릭 이벤트
					$("#menus #search").click(function(){
						$(".search_modal").fadeIn();
					}); //검색모달 클릭 끝
					
					
					
					
					//검색모달 닫기 클릭 이벤트
					$(".close_icon").click(function(){
						$(".search_modal").fadeOut();
					});  //모달 닫기 끝
					
					
				}//success 끝
			})//ajax 끝
			
			/* 모달 */
/*  				$("#map").on("click",$('div[title="loc_"+i]'), function(){
				    $(".modal").fadeIn();
 				    var tagId = $(this);
				    $(".modal_content").append($("<div>"+tagId+"</div>")) 
				  });
				$(".close").click(function(){
					$(".modal").fadeOut();
				});  */
			
				

				  
		
		});//레디 끝
	</script>

<style type="text/css">
    .buttons { position:absolute;top:0;left:0;z-index:1000;padding:5px; }
    .control-btn { margin:0 5px 5px 0; }
    
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
    }
    
    
    /* 모달 */
.store_modal { 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.2); top:0; left:0; display:none;
}

.store_modal .modal_content{
  width:90%; height:90%;
  background:#fff; border-radius:10px;
  position:absolute; top:5%; left:5%;
  /* margin-top:-100px; margin-left:-200px; */
  text-align:center;
  box-sizing:border-box;  /*padding:74px 0;*/
  line-height:15px; cursor:pointer;
  z-index:2000;
}
.store_modal .modal_incontent{padding-top: 74px;}
.store_modal .modal_content .close_icon{width:30px; height:30px; position: absolute; right: 5%; top:10px;}
button{ 
  width:120px; height:30px; margin-top:-15px; margin-left:-60px;
  line-height:15px; cursor:pointer;
}

/* 모달 안 가게 정보 */
.store_modal .modal_incontent .storeInfo{text-align: left; padding: 0 40px; margin: 3px 0; width:664.84px; font-size:5px; margin:0 auto;}
.store_modal .modal_web{overflow:auto; width:90%; height:70%; position:absolute; top:150px; left:50%; transform:translate(-50%); display: inline-block;}
.store_modal .modal_web .img{width:50%; display: inline-block;}
.store_modal .modal_web .img img{width:100%; display: inline-block;}
a{text-decoration: none; color: black;}
/* .modal_web .videoInfo{width:50%; height:170px;} */
.store_modal .modal_web .title{width:60%; font-size:5px; padding:5px 0 10px 0; /*display: inline-block;*/ margin: 0 auto;}


/* 검색모달 */
.search_modal { 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.2); top:0; left:0; display:none;
}

.search_modal .modal_content{
  width:90%; height:90%;
  background:#fff; border-radius:10px;
  position:absolute; top:5%; left:5%;
  /* margin-top:-100px; margin-left:-200px; */
  text-align:center;
  box-sizing:border-box;  /*padding:74px 0;*/
  line-height:15px; cursor:pointer;
  z-index:2000;
}
.search_modal .modal_content .close_icon{width:30px; height:30px; position: absolute; right: 5%; top:10px;}
.search_modal .modal_incontent{margin: auto 0;}


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
        <div class="menu" id="search">
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

<!-- 지도 -->
<div id="map" style="width:100%;height:600px;">
        <!-- <div class="buttons">
            <input id="to-busan" type="button" value="부산으로" class="control-btn" />
        </div> -->
</div>

<!-- 스토어모달 -->

<div class="store_modal">

  <div class="modal_content" title="클릭하면 창이 닫힙니다.">
  <svg class="close_icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>
    <div class="modal_incontent">
    내용
    </div>
    <div class="modal_web">
    </div>
  </div>
</div>
  
 

<!-- 검색모달 -->

<div class="search_modal">

  <div class="modal_content" title="클릭하면 창이 닫힙니다.">

  <svg class="close_icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>
    <div class="modal_incontent">
    	<select name='store'>
  			<option value='' selected>-- 선택 --</option>
  			<option value='storeName'>상점명</option>
  			<option value='storeAddress'>주소</option>
  			<option value='storeTel'>전화번호</option>
  			<option value='storeCategory'>카테고리</option>
		</select>
		<input type="text" placeholder="검색어를 입력하세요">
		<svg class="search_icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
		</svg>
    </div>
  </div>
</div>  
    
   
<script id="code">


//지도 시작시 기본 위치
var mapOptions = {
    center: new naver.maps.LatLng(36.350698, 127.453216),
    zoom: 3
};

var map = new naver.maps.Map('map', mapOptions);





/* //지도에 마크표시 대전
var markerOptions = {
		position : new naver.maps.LatLng(36.350698, 127.453216),
		map : map
};
var marker = new naver.maps.Marker(markerOptions); */

//지도에 마크표시 부산
 var markerOptions = {
/* 		position : new naver.maps.LatLng(35.1797865, 129.0750194),
		map : map
		title */
}; 
var marker = new naver.maps.Marker(markerOptions);


//범죄지도 따라하기
/* var marker = new naver.maps.Marker({
	position : new naver.maps.LatLng(37.3595704, 127.105399),
	map : map,
	title : '사기',
	icon: {
		content:[
			'<div style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px; background-color:#d3cc07; color:white; text-align:center; border:1px solid #a09b07; border-radius:14px; opacity:75%">'+
			'<div style="font-weight:bold; font-size:14px">사기</div>'+
			'<div style="font-weight:normal; font-size:13px; margin-top:3px">2016-01-21<br/>09시13분</div>'+
			'</div>'
			].join(''),
		size : new naver.maps.Size(38,58),
		anchor : new naver.maps.Point(19,58),
		}
	}); */





//클릭 이벤트

//var HOME_PATH = window.HOME_PATH || '.'; 

/* var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
    map = new naver.maps.Map('map', {
        center: cityhall.destinationPoint(0, 500),
        zoom: 15
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: cityhall
    }); */
    
    
    
/* var contentString = [
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
}); */

//infowindow.open(map, marker);





//부산 바로가기 버튼
/* 
var busan = new naver.maps.LatLng(35.1797865, 129.0750194);

$("#to-busan").on("click", function(e) {
    e.preventDefault();
	map.setZoom(15, true);
    map.panTo(busan);
   
});
 */


</script>

</body>
</html>