<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 작성</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>

<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/adminheader.jsp" %>
<%@ include file="../layout/tab.jsp" %>   
<div class="row">
  	  <div class="leftcolumn" align="center">
  	  <div>
		<form action="writeInfo" method="post">
		<h2>공지 글쓰기</h2>
			<table id="tboard" border=1>
				<tr>
					<th>제목</th>
					<td><input type="text" name="board_title" style="text-align:center; width:100%;"></td>
					<th>게시판</th>
					<td>
						<select name="cate_num">
							<option value="">게시판 선택</option>
							<option value="1">리뷰 게시판</option>
							<option value="2">추천 게시판</option>
							<option value="3">예고편 게시판</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="4">
						<textarea name="board_cont" rows="20" cols="120"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<button>작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
		<%@ include file="../layout/row.jsp" %>	
	</div>
	</div>
	
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>