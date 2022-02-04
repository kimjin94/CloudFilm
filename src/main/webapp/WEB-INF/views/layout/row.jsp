<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<div class="rightcolumn">
<c:if test="${member == null}"><button class="btn login" onClick="location='member_login'">로그인</button></c:if>
<c:if test="${member != null}">${member.mem_id}님 안녕하세요.<br></c:if>
<c:if test="${member != null}"><button class="btn login" onclick="location='member_logout'">로그아웃</button></c:if>
<c:if test="${member == null}"><button class="btn signup" onClick="location='member_join'">회원가입</button></c:if>
<c:if test="${member != null}"><button class="btn signup" onClick="location='myPage'">마이페이지</button></c:if>         
  </div>


</body>
</html>