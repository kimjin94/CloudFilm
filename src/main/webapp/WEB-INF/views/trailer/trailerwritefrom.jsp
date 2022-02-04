<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예고편 게시판 글쓰기</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %>  
	<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
		<form action="writeTrailer" method="post">
			<table id="bbslist_t" border=1>
				<h2>예고편 글쓰기</h2>
				<tr>
					<th>제목</th>
					<td><input type="text" name="board_title" size="90" style="width:100%;"></td>
					<th>장르</th>
					<td>
						<select name="board_filter">
							<option value="액션">액션</option>
							<option value="애니메이션">애니메이션</option>
							<option value="드라마">드라마</option>
							<option value="스릴러">스릴러</option>
							<option value="코미디">코미디</option>
							<option value="멜로/로맨스">멜로/로맨스</option>
							<option value="호러">호러</option>
							<option value="시대극">시대극</option>
							<option value="SF">SF</option>
							<option value="어드벤처">어드벤처</option>
							<option value="판타지">판타지</option>
							<option value="가족">가족</option>
							<option value="다큐">다큐</option>
							<option value="기타">기타</option>
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
					<th>동영상 링크</th>
					<td colspan="3"><input type="text" name="board_video" style="float:left;"></td>
				</tr>
				<tr>
					<td colspan="4">
						<button class="btn signup">작성</button>
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