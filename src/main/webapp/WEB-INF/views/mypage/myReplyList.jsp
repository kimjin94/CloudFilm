<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내가 쓴 댓글</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/tab.jsp" %>   
<div class="row">
  <div class="leftcolumn" align="center">
	<!-- 게시판 리스트 -->
		<h2 class="bbslist_title">내가 쓴 댓글</h2>
	   <%@ include file="../layout/mypageProfile.jsp" %>	
   <br><br>
	<div>
		<div id="bbslist_c" style="float:right; padding-right:40px;">글 개수 : ${listcount}</div><br>
		

		<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<th style="font-family: Tahoma; font-size: 11pt;" width="8%"
					height="26">
					<div align="center">글번호</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="47%">
					<div align="center">댓글내용</div>
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="12%">
					<div align="center">날짜</div>
				</th>
			</tr>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="myreplylist" items="${myreplylist}">
			
			<tr align="center" valign="middle">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 번호 출력 부분 -->	
					${myreplylist.board_num}
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">							
						
					<!-- 제목 출력 부분 -->	
					<a href="review_cont?board_num=${myreplylist.board_num}&page=${page}">
							${myreplylist.re_cont}
					</a>
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					<fmt:formatDate value="${myreplylist.re_date}"
						 pattern="yyyy-MM-dd HH:mm:ss"/>					
					
					</div>
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
				<a href="myReplyList?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="myReplyList?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="myReplyList?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>
		
	</div>
	
	</div>
 <%@ include file="../layout/myPageBar.jsp" %>
	</div>
	<%@ include file="../layout/footer.jsp" %>	
</body>
</html>