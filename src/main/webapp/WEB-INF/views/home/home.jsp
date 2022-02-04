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
				<th style="font-family: Tahoma; font-size: 11pt;" width="42%">
					<div align="center">제목</div>	
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">작성자</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="12%">
					<div align="center">날짜</div>
				</th>
			</tr>
			<c:forEach var="reviewlist" items="${reviewlist}">
				<tr>
					<td>
						${reviewlist.board_filter}
					</td>
					<td style="text-align: left;">
						<span style="float:left;width:74%;">${reviewlist.board_title}  </span> 
						<span style="float:right;width:24%;">| 조회수 : ${reviewlist.board_count} | 추천 : ${reviewlist.board_good} |</span>
					</td>
					<td>
						${reviewlist.mem_nick}
					</td>
					<td>
						<fmt:formatDate value="${reviewlist.board_date}" pattern="yyyy/MM/dd HH:mm:ss" />
					</td>
				</tr>
			</c:forEach>
	</table>		
	
	<h4 align="left">추천</h4>
	<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<th style="font-family: Tahoma; font-size: 11pt;" width="9%"
					height="26">
					<div align="center">필터</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="42%">
					<div align="center">제목</div>	
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">작성자</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="12%">
					<div align="center">날짜</div>
				</th>
			</tr>
				<c:forEach var="recommendlist" items="${recommendlist}">
				<tr>
					<td>
						${recommendlist.board_filter}
					</td>
					<td style="text-align: left;">
						<span style="float:left;width:74%;">${recommendlist.board_title}  </span> 
						<span style="float:right;width:24%;">| 조회수 : ${recommendlist.board_count} | 추천 : ${recommendlist.board_good} | </span>
					</td>
					<td>
						${recommendlist.mem_nick}
					</td>
					<td>
						<fmt:formatDate value="${recommendlist.board_date}" pattern="yyyy/MM/dd HH:mm:ss" />
					</td>
				</tr>
			</c:forEach>
	</table>		
	<h4 align="left">예고편</h4>
	<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<th style="font-family: Tahoma; font-size: 11pt;" width="9%"
					height="26">
					<div align="center">필터</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="42%">
					<div align="center">제목</div>	
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">작성자</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="12%">
					<div align="center">날짜</div>
				</th>
			</tr>
				<c:forEach var="trailerlist" items="${trailerlist}">
				<tr>
					<td>
						${trailerlist.board_filter}
					</td>
					<td style="text-align: left;">
						<span style="float:left;width:74%;">${trailerlist.board_title}  </span> 
						<span style="float:right;width:24%;">| 조회수 : ${trailerlist.board_count} | 추천 : ${trailerlist.board_good} | </span>
					</td>
					<td>
						${trailerlist.mem_nick}
					</td>
					<td>
						<fmt:formatDate value="${trailerlist.board_date}" pattern="yyyy/MM/dd HH:mm:ss" />
					</td>
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