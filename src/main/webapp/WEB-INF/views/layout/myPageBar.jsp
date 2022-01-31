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
    <div class="card">
<c:if test="${member == null}"><button class="btn login" onClick="location='member_login'">로그인</button></c:if>
<c:if test="${member != null}">${member.mem_id}님 안녕하세요.<br></c:if>
<c:if test="${member != null}"><button class="btn login" onclick="location='member_logout'">로그아웃</button></c:if>
<c:if test="${member == null}"><button class="btn signup" onClick="location='member_join'">회원가입</button></c:if>
<c:if test="${member != null}"><button class="btn signup" onClick="location='myPage'">마이페이지</button></c:if>         
    </div>
  <div class="card">
  -----마이페이지------<br><br>
	<a href="myPage">마이페이지 홈</a><br>
    <a href="myWritingList">내가 쓴 글</a><br>
	<a href="myReplyList">내가 쓴 댓글</a><br>
	<a href="myGoodList">내가 좋아요한 글</a><br><br>
	-----멤버-----<br><br>
	<a href="passReCheck">회원정보 수정</a><br>
	<a href="member_delete">탈퇴</a><br><br>
	<c:if test="${mem_grade == 99}">
	------관리자-----<br><br>
	<a href="test">테스트</a> 			<br>
	<a href="trailerlist">예고편 게시판</a>	<br>
	<a href="adminsession">로그인</a>		<br>
	</c:if>
  </div>
 </div>


</body>
</html>