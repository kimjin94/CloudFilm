<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판 글수정</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %> 
	<div class="row">
  <div class="leftcolumn" align="center">
    <div class="container">
		<form action="recommend_updating" method="post">
		<input type="hidden" name="board_num" value="${re.board_num}">
		<input type="hidden" name="page" value="${page}"/>
			<table id="bbslist_t" border=1>
				<h2>추천 수정하기</h2>
				<tr>
					<th>제목</th>
					<td>
					<input type="text" name="board_title" size="90" style="width:100%;"  value="${re.board_title}">
					</td>
					<th>추천</th>
					<td>
						<select name="board_filter">
							<option value="추천">추천</option>
							<option value="비추천">비추천</option>
						</select>
						${re.board_filter}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="4">
						<textarea name="board_cont" rows="20" cols="150">${re.board_cont}</textarea>
					</td>
				</tr>
				<tr>
					<th>이미지 첨부</th>
					<td colspan="3">
					<input type="file" id="board_img" name="board_img1">
					현재파일 :<img src="<%=request.getContextPath() %>/resources/images/reviewimage/${re.board_img}" height="50" width="50" />
					</td>
						
				</tr>

				<tr>
					<td colspan="4">
						<button class="btn signup" type="submit">수정</button>
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