<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/tab.jsp" %>  
<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
  	<h4 align="left">최신영화</h4>
  	<%@ include file="../layout/slideshow.jsp" %>  
	<h4 align="left">리뷰</h4>
	<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
			
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
			</tr>
		<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*5}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="re" items="${reviewlist}">
			
			<tr align="center" valign="middle">
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">							
					<!-- 필터 출력 부분 -->	
							${re.board_filter}
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">							
					<!-- 제목 출력 부분 -->	
					<a href="review_cont?board_num=${re.board_num}&page=${page}">
							${re.board_title}
							+${re.re_count}
							추천+${re.board_good}
					</a>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${re.mem_nick}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					
					<fmt:formatDate value="${re.board_date}"
						 pattern="yyyy-MM-dd HH:mm:ss"/>					
					
					</div>
				</td>
			</tr>
			</c:forEach>
			<!-- 반복문 끝 -->	
	</table>		
	<h4 align="left">추천</h4>
	<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
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
			</tr>
			
			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*5}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="re" items="${recommendlist}">
			<tr align="center" valign="middle">
				
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
							[${re.re_count}]
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
			</tr>
			
			</c:forEach>
			<!-- 반복문 끝 -->		
	</table>		
	<h4 align="left">예고편</h4>
	<table id="bbslist_t" border=1 style="table-layout:fixed;">
			<c:forEach var="trailerlist" items="${trailerlist}">
				<tr>
					<td rowspan="3" width="200"><img alt="" src="http://i.ytimg.com/vi/${trailerlist.board_video}/hqdefault.jpg" width="160" height="120"></td>
					<td style="text-align:left;"><a href="trailerDetail?page=${page}&board_num=${trailerlist.board_num}">${trailerlist.board_title} </a></td>
				</tr>
				<tr>
					<td style="text-align:left;"> 댓글 : ${trailerlist.re_count} | 조회수 : ${trailerlist.board_count} | 추천 : ${trailerlist.board_good} |
						<fmt:formatDate value="${trailerlist.board_date}"
							pattern="yyyy/MM/dd HH:mm:ss" />
						</td>
				</tr>
				<tr>
						<td  style="text-align:left;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${trailerlist.board_cont}</td>
				</tr>
			</c:forEach>
		</table>
</div>
</div>
	<%@ include file="../layout/row.jsp" %>	
	</div>
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>