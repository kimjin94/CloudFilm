<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예고편 게시판 글 수정</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %> 
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="container">
		<form action="updateTrailer" method="post">
			<input type="hidden" id="board_num" name="board_num" value="${board_num }">
			<input type="hidden" id="page" name="page" value="${page}">
			<table id="bbslist_t"  border=1>
				<h2>예고편  글 수정</h2>
				<tr>
					<th>제목</th>
					<td><input type="text" name="board_title" size="90" style="width:100%;" value="${board.board_title}"></td>
					<th>장르</th>
					<td>
						<select id="board_filter" name="board_filter" >
							<option value="" <c:if test="${board.board_filter == '' }"> selected="selected" </c:if>>전체보기</option>
							<option value="액션" <c:if test="${board.board_filter == '액션' }"> selected="selected" </c:if>>액션</option>
							<option value="애니메이션" <c:if test="${board.board_filter == '애니메이션' }"> selected="selected" </c:if>>애니메이션</option>
							<option value="드라마" <c:if test="${board.board_filter == '드라마' }"> selected="selected" </c:if>>드라마</option>
							<option value="스릴러" <c:if test="${board.board_filter == '스릴러' }"> selected="selected" </c:if>>스릴러</option>
							<option value="코미디" <c:if test="${board.board_filter == '코미디' }"> selected="selected" </c:if>>코미디</option>
							<option value="멜로/로맨스" <c:if test="${board.board_filter == '멜로/로맨스' }"> selected="selected" </c:if>>멜로/로맨스</option>
							<option value="호러" <c:if test="${board.board_filter == '호러' }"> selected="selected" </c:if>>호러</option>
							<option value="시대극" <c:if test="${board.board_filter == '시대극' }"> selected="selected" </c:if>>시대극</option>
							<option value="SF" <c:if test="${board.board_filter == 'SF' }"> selected="selected" </c:if>>SF</option>
							<option value="어드벤처" <c:if test="${board.board_filter == '어드벤처' }"> selected="selected" </c:if>>어드벤처</option>
							<option value="판타지" <c:if test="${board.board_filter == '판타지' }"> selected="selected" </c:if>>판타지</option>
							<option value="가족" <c:if test="${board.board_filter == '가족' }"> selected="selected" </c:if>>가족</option>
							<option value="다큐" <c:if test="${board.board_filter == '다큐' }"> selected="selected" </c:if>>다큐</option>
							<option value="기타" <c:if test="${board.board_filter == '기타' }"> selected="selected" </c:if>>기타</option>
						</select>
					</td>
				</tr>
				<tr>
				<th>내용</th>
					<td colspan="4">
						<textarea name="board_cont" rows="20" cols="150">${board.board_cont}</textarea>
					</td>
				</tr>
				<tr>
					<th>동영상 링크</th>
					<td colspan="3"><input type="text" name="board_video" style="float:left;" value="https://youtu.be/${board.board_video}"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">
						<button class="btn signup">수정</button>
						<button class="btn signup" type="reset" onclick="history.go(-1)">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	<%@ include file="../layout/row.jsp" %>
	</div>
	<%@ include file="../layout/footer.jsp" %>	
</body>
</html>