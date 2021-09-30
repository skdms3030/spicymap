<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

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
    
    
    .content{
    	margin : 10px;
    }
    .incontent{
    	padding-top: 10px;
    }
    
    
    .store{
    	padding: 10px;
    }
    .store p{
    	margin : 0px;
    }
    .store .title{
    	font-size: 15px;
    	font-weight : bold;
    }
</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
	<c:if test="${list.size()<1}">
		<div>
			<p>등록된 목록이 없습니다.</p>
		</div>
	</c:if>
	<c:forEach var="list" items="${list}">
	<div class="store">
		<p class="title">${list.storeName}</p>
		<div class="incontent">
			<p>상점 카테고리 : ${list.storeCategory}</p>
			<p>상점 전화번호 : ${list.storeTel}</p>
			<p>상점 주소 : ${list.storeAddress}</p>
		</div>
	</div>
		<br>
	</c:forEach>
	
	<a href="."><button>돌아가기</button></a>
</div>
</body>
</html>