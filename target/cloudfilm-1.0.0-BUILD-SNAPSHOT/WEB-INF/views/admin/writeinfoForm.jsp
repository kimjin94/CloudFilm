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
<script type="text/javascript">
function check(){
	if($.trim($("#board_title").val())==""){
		alert("제목을 채워주세요.");
		$("#board_title").val("").focus();
		return false;
	}
	if($.trim($("#cate_num").val())==""){
		alert("게시판을 선택해 주세요.");
		$("#cate_num").val("").focus();
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
<%@ include file="../layout/adminheader.jsp" %>
<%@ include file="../layout/tab.jsp" %>   
<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
		<form action="writeInfo" method="post" onsubmit="return check()">
		<h2>공지 글쓰기</h2>
			<table id="bbslist_t" border=1>
				<tr>
					<th>제목</th>
					<td><input type="text" id="board_title" name="board_title" size="90" style="width:100%;"></td>
					<th>게시판</th>
					<td>
						<select id="cate_num" name="cate_num">
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
						<textarea id="board_cont" name="board_cont" rows="20" cols="150"></textarea>
					</td>
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