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
	margin-bottom : 5px;
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
	<div>
		<h2>예고편 게시판</h2>
		<div id='container'>
			<div id='right-box'> 
				<select id="board_filter" name="board_filter" onchange="searchboard()">
					<option value="" <c:if test="${board_filter == '' }"> selected="selected" </c:if>>전체보기</option>
					<option value="액션" <c:if test="${board_filter == '액션' }"> selected="selected" </c:if>>액션</option>
					<option value="애니메이션" <c:if test="${board_filter == '애니메이션' }"> selected="selected" </c:if>>애니메이션</option>
					<option value="드라마" <c:if test="${board_filter == '드라마' }"> selected="selected" </c:if>>드라마</option>
					<option value="스릴러" <c:if test="${board_filter == '스릴러' }"> selected="selected" </c:if>>스릴러</option>
					<option value="코미디" <c:if test="${board_filter == '코미디' }"> selected="selected" </c:if>>코미디</option>
					<option value="멜로/로맨스" <c:if test="${board_filter == '멜로/로맨스' }"> selected="selected" </c:if>>멜로/로맨스</option>
					<option value="호러" <c:if test="${board_filter == '호러' }"> selected="selected" </c:if>>호러</option>
					<option value="시대극" <c:if test="${board_filter == '시대극' }"> selected="selected" </c:if>>시대극</option>
					<option value="SF" <c:if test="${board_filter == 'SF' }"> selected="selected" </c:if>>SF</option>
					<option value="어드벤처" <c:if test="${board_filter == '어드벤처' }"> selected="selected" </c:if>>어드벤처</option>
					<option value="판타지" <c:if test="${board_filter == '판타지' }"> selected="selected" </c:if>>판타지</option>
					<option value="가족" <c:if test="${board_filter == '가족' }"> selected="selected" </c:if>>가족</option>
					<option value="다큐" <c:if test="${board_filter == '다큐' }"> selected="selected" </c:if>>다큐</option>
					<option value="기타" <c:if test="${board_filter == '기타' }"> selected="selected" </c:if>>기타</option>
				</select>
				<script type="text/javascript">
					function searchboard() {
						if($("#board_filter  option:selected").val() == ""){
							location.href="trailerlist";
						} else{
							var board_filter = $("#board_filter  option:selected").val();
							location.href="searchboard?board_filter="+board_filter;
						}
						
					}
				</script>
			</div>
		</div>
		<table border=1 style="table-layout:fixed;">
			<c:forEach var="trailerlist" items="${trailerlist}">
				<tr>
					<th rowspan="3" width="160"><img alt="" src="http://i.ytimg.com/vi/${trailerlist.board_video}/hqdefault.jpg" width="160" height="120"></th>
					<td><a href="trailerDetail?page=${page}&board_num=${trailerlist.board_num}">${trailerlist.board_title} </a></td><tr>
					<td> 댓글 : ${trailerlist.re_count} | 조회수 : ${trailerlist.board_count} | 추천 : ${trailerlist.board_good} |
						<fmt:formatDate value="${trailerlist.board_date}"
							pattern="yyyy/MM/dd HH:mm:ss" />
						</td>
					<tr>
						<td  style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${trailerlist.board_cont}</td>
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
		    <input type="hidden" name="board_filter">
		    <div id='center-box'>
		    	<select name="search">
		    		<option value="">검색조건</option>
		    		<option value="board_title">제목</option>
		    		<option value="board_cont">내용</option>
		    		<option value="mem_nick">작성자</option>
		    	</select>
		    	<input type="text" id="keyword" name="keyword" placeholder="검색"> 
		    	<button type="submit">검색</button>
		    </div>
	    </form>
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