<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/board/goodandbad.js"></script>
<style type="text/css">
#boarddate{
	float : right;
}

#goodandbad{
	text-align:center;
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

#goodbutton, #badbutton{
	float:center;
	align-content: center;
}
#replyarea{
	height: 80px;
}

#re_cont{
	resize: none;
}
#replywritebtn{
	height : 78px;
	weidth : 78px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div>
		<input type="hidden" id="board_num" name="board_num" value="${board.board_num }">
		<table border=1>
		<h2>예고편 게시판</h2>
			<tr>
				<td width="100">${board.board_filter}</td>
				<th>${board.board_title}</th>
			</tr>
			<tr>
				<td colspan="2">작성자 : ${board.mem_id} | 조회수 : ${board.board_count} |
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
				<td colspan="2">
					<c:choose>
						<%-- 비회원인경우 --%>
						<c:when test="${mem_num == 0 }">
							<div id="goodandbad">
								<button  onclick="login()" >추천 : ${board.board_good} </button>
								<button  onclick="login()" >비추 : ${board.board_bad}</button>
							</div>
						</c:when>
						<%-- 회원이면서, 추천, 비추천 아무것도 안누른경우 --%>
						<c:when test="${mem_num != 0 && checkTrailerGood == 0 && checkTrailerBad == 0}">
							<div id="goodandbad">
								<%@ include file="./ajax/trailergoodandbad.jsp" %>
							</div>
						</c:when>
						<%-- 회원이면서, 추천  누른경우 --%>
						<c:when test="${mem_num != 0 && checkTrailerGood != 0 && checkTrailerBad == 0 }">
							<div id="goodandbad">
								<%@ include file="./ajax/trailergood.jsp" %>
							</div>
						</c:when>
						<%-- 회원이면서, 비추 누른경우 --%>
						<c:when test="${mem_num != 0 && checkTrailerGood == 0 && checkTrailerBad != 0 }">
							<div id="goodandbad">
								<%@ include file="./ajax/trailerbad.jsp" %>
							</div>
						</c:when>
					</c:choose>
					<script type="text/javascript">
						
					</script>
				</td>
			</tr>
		</table>
		
		<table border=1>
			<tr>
				<td>
					댓글출력부분<br>
					<input type="text" name=>
				</td>
			</tr>
			<tr>
				<td>
					<div id ="replyarea">
						<textarea id="re_cont" name="re_cont" rows="5" cols="100"></textarea>
						<button id="replywritebtn" onclick="replywrite(${mem_num})">댓글 등록</button>
					</div>
					<script type="text/javascript">
					function replywrite(mem_num) {
						
					}
					
					</script>
				</td>
			</tr>
		</table>
	
	</div>

</body>
</html>