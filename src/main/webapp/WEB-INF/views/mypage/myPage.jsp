<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 홈</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %>  
<div class="row">
  <div class="leftcolumn" align="center">
<div class="container">
    <h2 class="text-primary">게시판 목록</h2>
	 <br>
		<table border="1" class="table table-hover" id=tboard>
			<thead>
			<tr>
				<th>번호</th>
				<th>필터</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
		</table>
  </div>	
</div> 
<%@ include file="../layout/myPageBar.jsp" %>	
</div>
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>