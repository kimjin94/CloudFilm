<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CloudFilm Admin member Management</title>
<style type="text/css">
#bbslist_t .th{
style="font-family: Tahoma; font-size: 11pt;"
}

</style>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/adminheader.jsp" %>
<%@ include file="../layout/tab.jsp" %>  

<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
  	<script type="text/javascript">
		function adminmemYNSort() {
			var mem_yn = $("#mem_yn  option:selected").val();
			var search = $("#search option:selected").val();
			var keyword = $("#keyword").val();
			location.href="memberManagement?mem_yn="+mem_yn+"&search="+search+"&keyword="+keyword;
		}
		
		function adminmemSearch() {
			var mem_yn = $("#mem_yn  option:selected").val();
			var search = $("#search option:selected").val();
			var keyword = $("#keyword").val();
			location.href="memberManagement?mem_yn="+mem_yn+"&search="+search+"&keyword="+keyword;
		}
		
		function adminMemberYN(mem_num, yn) {
			var mem_yn = $("#mem_yn  option:selected").val();
			var search = $("#search option:selected").val();
			var keyword = $("#keyword").val();
			var page = $("#page").val();
			location.href="adminMemberYN?page="+page+"&mem_yn="+mem_yn+"&search="+search+"&keyword="+encodeURI(keyword,"UTF-8")+"&mem_num="+mem_num+"&yn="+yn;
		}
			
	</script>
	<h4 align="right" style="float:right; width:1000%;">
		<select id="mem_yn" name="mem_yn" onchange="adminmemYNSort()">
			<option value="" >전체회원</option>
			<option value="y" <c:if test="${mem_yn == 'y' }"> selected="selected" </c:if> >정상회원 보기</option>
			<option value="n" <c:if test="${mem_yn == 'n' }"> selected="selected" </c:if> >정지회원 보기</option>
		</select>
	</h4>
	<input type="hidden" id="page" value="${page}">
		<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<th width="5%" height="26">
					<div align="center">번호</div>
				</th>
				<th width="10%">
					<div align="center">ID</div>	
				</th>
				<th width="10%">
					<div align="center">닉네임</div>
				</th>
				<th width="10%">
					<div align="center">프로필사진</div>
				</th>
				<th width="19%">
					<div align="center">Email</div>
				</th>
				<th width="12%">
					<div align="center">가입일</div>
				</th>
				<th width="5%">
					<div align="center">등급</div>
				</th>
				<th width="5%">
					<div align="center">yn</div>
				</th>
				<th width="14%">
					<div align="center">글/댓글</div>
				</th>
				<th width="10%">
					<div align="center">액션</div>
				</th>
				
			</tr>
			<c:forEach var="memberlist" items="${memberlist}">
				<tr>
					<td>
						${memberlist.mem_num}
					</td>
					<td>
						${memberlist.mem_id}
					</td>
					<td>
						${memberlist.mem_nick}
					</td>
					<td>
						${memberlist.mem_img}
					</td>
					<td>
						${memberlist.mem_email}
					</td>
					<td>
						<fmt:formatDate value="${memberlist.mem_date}" pattern="yyyy/MM/dd HH:mm:ss" />
					</td>
					<td>
						${memberlist.mem_grade}
					</td>
					<td>
						${memberlist.mem_yn}
					</td>
					<td>
						${memberlist.board_writecount} / ${memberlist.re_writecount}
					</td>
					<td>
						<c:choose>
							<c:when test="${memberlist.mem_yn == 'y'}">
								<button onclick="adminMemberYN(${memberlist.mem_num},'${memberlist.mem_yn}')">정지</button>
							</c:when>
							<c:when test="${memberlist.mem_yn == 'n'}">
								<button onclick="adminMemberYN(${memberlist.mem_num},'${memberlist.mem_yn}')">복구</button>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
	</table>
	<div id='container'>
	    <div id='center-box'>
	    	<select id="search" name="search">
		    		<option value="">검색조건</option>
		    		<option value="mem_id" <c:if test="${search == 'mem_id'}">selected="selected"</c:if>>아이디</option>
		    		<option value="mem_email" <c:if test="${search == 'mem_email'}">selected="selected"</c:if>>이메일</option>
		    		<option value="mem_nick" <c:if test="${search == 'mem_nick'}">selected="selected"</c:if>>닉네임</option>
	    	</select>
	    	<input type="text" id="keyword" name="keyword" placeholder="검색" value="${keyword}"> 
	    	<button type="button" onclick="adminmemSearch()">검색</button>
    	</div>
	</div>
	<div id="trailerlist_paging" >
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>

			<c:if test="${page > 1 }">
				<a href=
				"memberManagement?page=${page-1}&mem_yn=${mem_yn}&search=${search}&keyword=${keyword}">[이전]</a>&nbsp;
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href=
					"memberManagement?page=${a}&mem_yn=${mem_yn}&search=${search}&keyword=${keyword}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href=
				"memberManagement?page=${page+1}&mem_yn=${mem_yn}&search=${search}&keyword=${keyword}">[다음]</a>
			</c:if>
		</div>	
	
	
</div>
</div>
	<%@ include file="../layout/row.jsp" %>	
	</div>
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>