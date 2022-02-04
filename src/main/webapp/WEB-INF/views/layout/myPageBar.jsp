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
<br>
<br>
  
  <div class="sidenav" style="float:right;">
  <table id="bbslist_t" border="1">
  <tr>
  <th>-----마이페이지------</th>
  </tr>
	<tr>
	<td><a href="myPage">마이페이지 홈</a></td>
	</tr>
	<tr>
    <td><a href="myWritingList">내가 쓴 글</a></td>
	</tr>
	<tr>
	<td><a href="myReplyList">내가 쓴 댓글</a></td>
	</tr>
	<tr>
	<td><a href="myGoodList">내가 좋아요한 글</a></td>
	</tr>
	<c:if test="${mem_num == 1}">
	<tr>
	<th>------관리자-----</th>
	<td><a href="test">테스트</a></td>
	<td><a href="trailerlist">예고편 게시판</a></td>
	<td><a href="adminsession">로그인</a></td>
	</tr>
	</c:if>
	</table>
  </div>
 </div>


</body>
</html>