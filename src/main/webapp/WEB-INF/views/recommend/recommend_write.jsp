<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 게시판 글쓰기</title>
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
	<div>
		<form action="recommend_writing" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<table border=1>
				<caption>추천 글쓰기</caption>
				<tr>
					<th>제목</th>
					<td><input type="text" id="board_title" name="board_title"></td>
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
						<textarea id="board_cont" name="board_cont" rows="20" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지 첨부</th>
					<td colspan="3"><input type="file" name="board_img1"></td>
				</tr>

				<tr>
					<td colspan="4">
						<button>작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>