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
<%@ include file="../layout/adminheader.jsp" %>	
<%@ include file="../layout/tab.jsp" %>  
<div class="row">
  	  <div class="leftcolumn" align="center">
			<form action="updateInfo" method="post">
				<input type="hidden" id="board_num" name="board_num" value="${board_num }">
				<input type="hidden" id="page" name="page" value="${page}">
				<table border=1>
					<caption>예고편  글 수정</caption>
					<tr>
						<th>제목</th>
						<td><input type="text" name="board_title" value="${board.board_title}"></td>
						<th>게시판 분류</th>
						<td>
							<select id="cate_num" name="cate_num" >
								<option value="" <c:if test="${board.cate_num == '' }"> selected="selected" </c:if>>게시판 선택</option>
								<option value="1" <c:if test="${board.cate_num == 1 }"> selected="selected" </c:if>>리뷰 게시판</option>
								<option value="2" <c:if test="${board.cate_num == 2 }"> selected="selected" </c:if>>추천 게시판</option>
								<option value="3" <c:if test="${board.cate_num == 3 }"> selected="selected" </c:if>>예고편 게시판</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="board_cont" rows="20" cols="60">${board.board_cont}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;">
							<button>수정</button>
						</td>
					</tr>
				</table>
			</form>
		<%@ include file="../layout/row.jsp" %>	
	</div>
</div>
	
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>