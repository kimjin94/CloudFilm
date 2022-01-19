<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="test">테스트</a> 			<br>
	<a href="trailerlist">예고편 게시판</a>	<br>
	<a href="adminsession">로그인</a>					<br>
	<c:if test="${member != null }">
		${member.mem_id } 님 안녕하세요
	</c:if>
</body>
</html>