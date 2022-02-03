<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %>  
	<!-- 게시판 리스트 -->
	<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
		<h2 class="bbslist_title">게시판 목록</h2>
		<div style="float:right; padding-right:35px;">
		<button class="btn selectall" onClick="location='review_list?page=${page}'">전체</button>
		</div>	
		<div id="bbslist_c" style="float:left; padding-left:30px;">글 개수 : ${listcount}</div>

		
		

		<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<th style="font-family: Tahoma; font-size: 11pt;" width="8%"
					height="26">
					<div align="center">번호</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="9%"
					height="26">
					<div align="center">필터</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="47%">
					<div align="center">제목</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">작성자</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="12%">
					<div align="center">날짜</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="10%">
					<div align="center">조회수</div>
				</th>
			</tr>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="reviewsearchlist" items="${reviewsearchlist}">
			
			<tr align="center" valign="middle">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">							
						
					<!-- 필터 출력 부분 -->	
							${reviewsearchlist.board_filter}
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">							
						
					<!-- 제목 출력 부분 -->	
					<a href="review_cont?board_num=${reviewsearchlist.board_num}&page=${page}">
							${reviewsearchlist.board_title}
							+${reviewsearchlist.re_count}
					</a>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${reviewsearchlist.mem_nick}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					<fmt:formatDate value="${reviewsearchlist.board_date}"
						 pattern="yyyy-MM-dd HH:mm:ss"/>					
					
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${reviewsearchlist.board_count}</div>
				</td>
			</tr>
			
			</c:forEach>
			<!-- 반복문 끝 -->			
		</table>
		

		<div id="bbslist_paging">			
			<c:if test="${page <= 1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="search_review?page=${page-1}&search=${search}&keyword=${keyword}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="search_review?page=${a}&search=${search}&keyword=${keyword}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="search_review?page=${page+1}&search=${search}&keyword=${keyword}">[다음]</a>
			</c:if>			
			
		</div>
		<div id="bbslist_w" align="center" valign="middle" style="float:right; padding-right:30px;">
			<input type="button" value="글쓰기" class="input_button"
				onclick="location='review_write?page=${page}'">
		</div>
		<form action="search_review" method="post">
		<input type="hidden" name="board_filter">
			<div>
				<select name="search">
				<option value="">검색조건</option>
				<option value="board_title"<c:if test="${search == 'board_title'}">selected="selected"</c:if>>제목</option>
				<option value="board_cont"<c:if test="${search == 'board_cont'}">selected="selected"</c:if>>내용</option>
				<option value="mem_nick"<c:if test="${search == 'mem_nick'}">selected="selected"</c:if>>작성자</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색" value="${keyword}">
				<button type="submit">검색</button>
			</div>
		</form>
	</div>
	</div>
	<%@ include file="../layout/row.jsp" %>	
	</div>
<%@ include file="../layout/footer.jsp" %>
</body>
</html>