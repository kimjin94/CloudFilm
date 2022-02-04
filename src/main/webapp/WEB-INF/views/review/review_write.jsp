<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판 글쓰기</title>
<script type="text/javascript">
	
function check(){
	if($.trim($("#board_title").val())==""){
		alert("제목을 채워주세요.");
		$("#board_title").val("").focus();
		return false;
	}
	if($.trim($("#board_cont").val())==""){
		alert("내용을 채워주세요.");
		$("#board_cont").val("").focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %> 
	<div class="row">
  <div class="leftcolumn" align="center">
		<form action="review_writing" method="post" enctype="multipart/form-data" onsubmit="return check()" >
			<table id="bbslist_t" border=1>
				<h2>리뷰 글쓰기</h2>
				<tr>
					<th>제목</th>
					<td><input type="text" id="board_title" name="board_title" size="90" style="text-align:center; width:100%;"></td>
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
						<textarea id="board_cont" name="board_cont" rows="20" cols="150"></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지 첨부</th>
					<td colspan="3"><input type="file" name="board_img1"></td>
				</tr>

				<tr>
					<td colspan="4">
						<button type="submit">작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="../layout/row.jsp" %>	
	</div>
	
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>