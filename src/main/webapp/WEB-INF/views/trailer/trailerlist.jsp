<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예고편</title>
<style>
table{
	width: 600px;
}

#container {
	margin-top : 5px;
    text-align: center;
    width: 600px;
}
#left-box {
    float: left;
}
#center-box {
    margin: 0 auto;
}
#right-box {
    float: right;
}

#trailerlist_paging{
margin-top : 5px;
	text-align: center;
	width : 600px;
}
</style>
</head>
<body>
	<div>
		<table border=1 >
			<h2>예고편 게시판</h2>
			<c:forEach var="trailerlist" items="${trailerlist}">
				<tr>
					<th rowspan="3" width="160"><img alt="" src="http://i.ytimg.com/vi/${trailerlist.board_video}/hqdefault.jpg" width="160" height="120"></th>
					<td><a href="trailerDetail?page=${page}&board_num=${trailerlist.board_num}">${trailerlist.board_title} </a></td><tr>
					<td> 댓글  ${trailerlist.board_count} | ${trailerlist.board_good} | 
						<fmt:formatDate value="${trailerlist.board_date}"
							pattern="yyyy/MM/dd HH:mm:ss" />
						</td><tr>
					<td>${trailerlist.board_video}</td><tr>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id='container'>
	    <div id='left-box'>왼쪽</div>
   	    <div id='right-box'>
   	    	<button onclick="location='writeTrailerForm'">글쓰기</button>
	    </div>
	    <div id='center-box'>
	    	<input type="text" placeholder="검색"> 
	    	<button onclick="">검색</button>
	    </div>
	</div>
	<div id="trailerlist_paging" >
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>

			<c:if test="${page > 1 }">
				<a href="trailerlist?page=${page-1}">[이전]</a>&nbsp;
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="trailerlist?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="trailerlist?page=${page+1}">[다음]</a>
			</c:if>
		</div>
	
	
</body>
</html>