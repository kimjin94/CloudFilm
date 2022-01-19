<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>리뷰게시판 원문내용</title>
</head>

<script>
function del(page,board_num){
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='review_delete?page='+ page + '&board_num='+board_num;
	}
}
</script>

<body>
	<div>
		<h2>리뷰게시판 원문내용</h2>
		<input type="hidden" name="board_num" value="${re.board_num}"/>
		<input type="hidden" name="page" value="${page}"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${re.board_title}</td>
			</tr>
			<tr>
				<th >작성자</th>
				<td>
				${re.mem_id}
				</td>
				<th style="text-align:right;">작성일</th>
				<td>
				${re.board_date }				
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				 <c:if test="${empty re.board_img}">
      				${re.board_cont}
       				</c:if>
       				<c:if test="${!empty re.board_img}">
					<img src="<%=request.getContextPath() %>/resources/images/reviewimage/${re.board_img}" height="100" width="100" />
       				${re.board_cont}
       				</c:if>
				</td>
			</tr>
			<tr>
			</tr>
			
		</table>
			<div>
				<button id="board_good" name="board_good">좋아요</button>
				<button id="board_bad" name="board_bad">싫어요</button>
			</div>
			<div>
				<button type="button" onClick="location='review_update?board_num=${re.board_num}&page=${page}'">수정</button>
				<button type="button" onClick="del(${page},${re.board_num})">삭제</button>
				<button type="button" onClick="location='review_list?page=${page}'">목록</button>
			</div>
	</div>

</body>
</html>