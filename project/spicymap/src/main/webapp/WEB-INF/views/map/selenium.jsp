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
<p style="font-size:25px; color:red">웹 크롤링 테스트</p>
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
</body>
</html>