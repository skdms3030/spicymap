<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="/resources/jq/jquery.js"></script>
</head>
<body>
<p>홈화면</p>
<br>
	<c:if test="${list.size()<1}">
		<div>
			<p>등록된 목록이 없습니다.</p>
		</div>
	</c:if>
	<c:forEach var="list" items="${list}">
		<a href="${list.href}"><img src="${list.img}"></a>
		<p>"${list.title}"</p>
	</c:forEach>	
	
		<%-- <p>${item.storeName}</p>
		<p>${item.storeImg}</p>
		<p>${item.storeTel}</p>
		<p>${item.storeAddress}</p>
		 --%>
		 
		 
		 
	<a href="map"><p style="font-size:15px">지도로</p></a>
</body>
</html>