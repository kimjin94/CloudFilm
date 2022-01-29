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

#trailersearchlist_paging{
margin-top : 5px;
	text-align: center;
	width : 600px;
}
</style>
</head>
<body>
	<div>
		글 갯수 = ${listcount}
		<table border=1 style="table-layout:fixed;">
			<h2>예고편 게시판</h2>
			<c:forEach var="trailersearchlist" items="${trailersearchlist}">
				<tr>
					<th rowspan="3" width="160"><img alt="" src="http://i.ytimg.com/vi/${trailersearchlist.board_video}/hqdefault.jpg" width="160" height="120"></th>
					<td><a href="trailerDetail?page=${page}&board_num=${trailersearchlist.board_num}">${trailersearchlist.board_title} </a></td><tr>
					<td> 댓글 : ${trailersearchlist.re_count} | 조회수 : ${trailersearchlist.board_count} | 추천 : ${trailersearchlist.board_good} |
						<fmt:formatDate value="${trailersearchlist.board_date}"
							pattern="yyyy/MM/dd HH:mm:ss" />
						</td>
					<tr>
						<td  style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${trailersearchlist.board_cont}</td>
					<tr>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id='container'>
	    <div id='left-box'>왼쪽</div>
   	    <div id='right-box'>
   	    	<button onclick="location='writeTrailerForm'">글쓰기</button>
	    </div>
	    <form action="searchboard" method="post">
		    <div id='center-box'>
		    	<select name="search">
		    		<option value="">검색조건</option>
		    		<option value="board_title" <c:if test="${search == 'board_title'}">selected="selected"</c:if>>제목</option>
		    		<option value="board_cont" <c:if test="${search == 'board_cont'}">selected="selected"</c:if>>내용</option>
		    		<option value="mem_nick" <c:if test="${search == 'mem_nick'}">selected="selected"</c:if>>작성자</option>
		    	</select>
		    	<input type="text" id="keyword" name="keyword" placeholder="검색" value="${keyword}"> 
		    	<button type="submit">검색</button>
		    </div>
	    </form>
	</div>
	<div id="trailersearchlist_paging" >
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>

			<c:if test="${page > 1 }">
				<a href="trailersearchlist?page=${page-1}">[이전]</a>&nbsp;
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="trailersearchlist?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="trailersearchlist?page=${page+1}">[다음]</a>
			</c:if>
		</div>
	
	
</body>
</html>