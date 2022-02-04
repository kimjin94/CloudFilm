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

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
		<button class="btn selectall" onClick="location='recommend_list?page=${page}'">전체</button>
		<button class="btn good"  id="board_filter" name="board_filter" onClick="location='recommend_list?board_filter=추천'">추천</button>
		<button class="btn bad"  id="board_filter" name="board_filter" onClick="location='recommend_list?board_filter=비추천'">비추천</button>
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
			<!--공지출력부분 -->
			<c:forEach var="info" items="${recommendinfolist}">
			<tr align="center" valign="middle">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					${info.board_filter}
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">							
						
					<!-- 필터 출력 부분 -->	
							${info.board_filter}
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">							
						
					<!-- 제목 출력 부분 -->	
					<a href="recommend_cont?board_num=${info.board_num}&page=${page}">
							${info.board_title}
							+${info.re_count}&nbsp;
                     <i class="fas fa-thumbs-up"></i>${info.board_good}
					</a>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${info.mem_id}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					
					<fmt:formatDate value="${info.board_date}"
						 pattern="yyyy-MM-dd HH:mm:ss"/>					
					
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					<i class="fas fa-eye"></i>${info.board_count}</div>
				</td>
			</tr>
				
			</c:forEach>
			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*20}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="re" items="${recommendlist}">
			
			<tr align="center" valign="middle">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">							
						
					<!-- 필터 출력 부분 -->	
							${re.board_filter}
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">							
						
					<!-- 제목 출력 부분 -->	
					<a href="recommend_cont?board_num=${re.board_num}&page=${page}">
							${re.board_title}
							+${re.re_count}&nbsp;
                     <i class="fas fa-thumbs-up"></i>${re.board_good}
					</a>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${re.mem_id}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					
					<fmt:formatDate value="${re.board_date}"
						 pattern="yyyy-MM-dd HH:mm:ss"/>					
					
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					<i class="fas fa-eye"></i>${re.board_count}</div>
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
				<a href="recommend_list?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="recommend_list?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="recommend_list?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>
		<div id="bbslist_w" align="center" valign="middle" style="float:right; padding-right:30px;">
			<button class="btn signup" onclick="location='recommend_write?page=${page}'">글쓰기</button>	
		</div>
		<form action="search_recommend" method="post">
		<input type="hidden" name="board_filter">
			<div>
				<select name="search">
				<option value="">검색조건</option>
				<option value="board_title"<c:if test="${search == 'board_title'}">selected="selected"</c:if>>제목</option>
				<option value="board_cont"<c:if test="${search == 'board_cont'}">selected="selected"</c:if>>내용</option>
				<option value="mem_nick"<c:if test="${search == 'mem_nick'}">selected="selected"</c:if>>작성자</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색" value="${keyword}">
				<button class="btn signup" type="submit">검색</button>
			</div>
		</form>
		</div>
	</div>
	<%@ include file="../layout/row.jsp" %>	
	</div>
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>