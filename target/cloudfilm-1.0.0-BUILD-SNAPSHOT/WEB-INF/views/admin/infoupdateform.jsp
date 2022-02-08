<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예고편 게시판 글 수정</title>
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
			<form action="updateInfo" method="post" onsubmit="return check()">
				<input type="hidden" id="board_num" name="board_num" value="${board_num }">
				<input type="hidden" id="page" name="page" value="${page}">
				<table id="bbslist_t" border=1>
					 <h2>공지 수정하기</h2>
					 
					<tr>
						<th>제목</th>
						<td><input type="text" id="board_title" name="board_title" size="90" style="width:100%;" value="${board.board_title}"></td>
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
					<th>내용</th>
						<td colspan="4">
							<textarea name="board_cont" rows="20" cols="150">${board.board_cont}</textarea>
						</td>
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