<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세페이지</title>
<style type="text/css">
#boarddate{
	float : right;
}

table{
	width: 900px;
}

td, th{
	padding-left : 5px;
	padding-right : 5px;
}
th{
	text-align: left;
}

</style>
</head>
<body>
	<div>
		<table border=1>
		<h2>예고편 게시판</h2>
			<tr>
				<td width="100">${board.board_filter}</td>
				<th>${board.board_title}</th>
			</tr>
			<tr>
				<td colspan="2">작성자 : ${board.mem_id} | 조회수 : ${board.board_count} | 좋아요 : ${board.board_good} | 싫어요 : ${board.board_bad} |
					<a id=boarddate><fmt:formatDate value="${board.board_date}" pattern="yyyy/MM/dd HH:mm:ss" /></a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/${board.board_video}"></iframe> <br>
					${board_cont}
				</td>
			</tr>
			<tr>
				<td>
					<
				</td>
			</tr>
		</table>
	
	</div>

</body>
</html>