<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>

<div>
<%-- 	<c:if test="${list.size()<1}">
		<div>
			<p>등록된 목록이 없습니다.</p>
		</div>
	</c:if> --%>
	<c:forEach var="list" items="${list}">
		<p>"${list.storeName}</p>
		<p>"${list.storeCategory}</p>
		<p>"${list.storeTel}</p>
		<p>"${list.storeAddress}"</p>
		<br>
	</c:forEach>
</div>
</body>
</html>