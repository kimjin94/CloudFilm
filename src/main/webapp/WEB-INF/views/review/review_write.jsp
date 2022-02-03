<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판 글쓰기</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %> 
	<div class="row">
  <div class="leftcolumn" align="center">
  	<div class="container">
		<form action="review_writing" method="post" enctype="multipart/form-data" >
			<table id="bbslist_t" border=1>
				<h2>리뷰 글쓰기</h2>
				<tr>
					<th>제목</th>
					<td><input type="text" name="board_title" size="90" style="width:100%;"></td>
					<th>추천</th>
					<td>
						<select name="board_filter">
							<option value="추천">추천</option>
							<option value="비추천">비추천</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="4">
						<textarea name="board_cont" rows="20" cols="150"></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지 첨부</th>
					<td colspan="3"><input type="file" name="board_img1"></td>
				</tr>

				<tr>
					<td colspan="4">
						<button>작성</button>
						<button type="reset" onclick="history.go(-1)">취소</button>
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