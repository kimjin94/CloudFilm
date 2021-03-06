<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CloudFilm Admin board Management</title>
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
		function adminCateSort() {
			var cate_num = $("#cate_num  option:selected").val();
			var board_yn = $("#board_yn option:selected").val();
			var search = $("#search option:selected").val();
			var keyword = $("#keyword").val();
			location.href="boardManagement?cate_num="+cate_num+"&board_yn="+board_yn+"&search="+search+"&keyword="+keyword;
		}
		
		function adminYNSort() {
			var cate_num = $("#cate_num option:selected").val();
			var board_yn = $("#board_yn  option:selected").val();
			var search = $("#search option:selected").val();
			var keyword = $("#keyword").val();
			location.href="boardManagement?cate_num="+cate_num+"&board_yn="+board_yn+"&search="+search+"&keyword="+keyword;
		}
		
		function adminSearch() {
			var cate_num = $("#cate_num option:selected").val();
			var board_yn = $("#board_yn  option:selected").val();
			var search = $("#search option:selected").val();
			var keyword = $("#keyword").val();
			location.href="boardManagement?cate_num="+cate_num+"&board_yn="+board_yn+"&search="+search+"&keyword="+keyword;
		}
		
		function adminBoardYN(board_num, yn) {
			var cate_num = $("#cate_num option:selected").val();
			var board_yn = $("#board_yn  option:selected").val();
			var search = $("#search option:selected").val();
			var keyword = $("#keyword").val();
			var page = $("#page").val();
			location.href="adminBoardYN?page="+page+"&cate_num="+cate_num+"&board_yn="+board_yn+"&search="+search+"&keyword="+encodeURI(keyword,"UTF-8")+"&board_num="+board_num+"&yn="+yn;
		}
			
	</script>
	<h4 style="float:left; width:48%; padding-right:350px;">
		<select id="cate_num" name="cate_num" onchange="adminCateSort()">
			<option value=0 >?????? ?????????</option>
			<option value=1 <c:if test="${cate_num == 1 }"> selected="selected" </c:if> >?????? ?????????</option>
			<option value=2 <c:if test="${cate_num == 2 }"> selected="selected" </c:if> >?????? ?????????</option>
			<option value=3 <c:if test="${cate_num == 3 }"> selected="selected" </c:if> >????????? ?????????</option>
		</select>
	</h4>
	<h4 style="float:right; width:48%; padding-left:370px;">
		<select id="board_yn" name="board_yn" onchange="adminYNSort()">
			<option value="" >?????? ??????</option>
			<option value="y" <c:if test="${board_yn == 'y' }"> selected="selected" </c:if> >????????? ??????</option>
			<option value="n" <c:if test="${board_yn == 'n' }"> selected="selected" </c:if> >????????? ??????</option>
		</select>
	</h4>
	<input type="hidden" id="page" value="${page}">
		<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<th width="5%"
					height="26">
					<div align="center">?????????</div>
				</th>
				<th width="40%">
					<div align="center">??????</div>	
				</th>
				<th width="5%">
					<div align="center">?????????</div>
				</th>
				<th width="10%">
					<div align="center">?????????</div>
				</th>
				<th width="12%">
					<div align="center">??????</div>
				</th>
				<th width="4%">
					<div align="center">??????</div>
				</th>
				<th width="10%">
					<div align="center">??????</div>
				</th>
			</tr>
			<c:forEach var="boardlist" items="${boardlist}">
				<tr>
					<td>
						<c:choose>
							<c:when test="${boardlist.cate_num == 1}">
								??????
							</c:when>
							<c:when test="${boardlist.cate_num == 2}">
								??????
							</c:when>
							<c:when test="${boardlist.cate_num == 3}">
								?????????
							</c:when>
						</c:choose>
					</td>
					<td style="">
						<a href="boardManagementDetail?board_num=${boardlist.board_num}"> 
							<span style="float:left;width:70%; text-align: left;">[${boardlist.board_filter}] ${boardlist.board_title}  </span> 
							<span style="float:right;width:29%; text-align: right;">| ????????? : ${boardlist.board_count} | ?????? : ${boardlist.board_good} |</span>
						</a>
					</td>
					<td >
						${boardlist.board_bad}
					</td>
					<td>
						${boardlist.mem_nick}
					</td>
					<td>
						<fmt:formatDate value="${boardlist.board_date}" pattern="yyyy/MM/dd HH:mm:ss" />
					</td>
					<td>
						${boardlist.board_yn}
					</td>
					<td>
						<c:choose>
							<c:when test="${boardlist.board_yn == 'y'}">
								<button class="btn signup" onclick="adminBoardYN(${boardlist.board_num},'${boardlist.board_yn}')">??????</button>
							</c:when>
							<c:when test="${boardlist.board_yn == 'n'}">
								<button class="btn signup" onclick="adminBoardYN(${boardlist.board_num},'${boardlist.board_yn}')">??????</button>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
	</table>
	<div id='container'>
	    <div id='center-box'>
	    	<select id="search" name="search">
		    		<option value="">????????????</option>
		    		<option value="board_title" <c:if test="${search == 'board_title'}">selected="selected"</c:if>>??????</option>
		    		<option value="board_cont" <c:if test="${search == 'board_cont'}">selected="selected"</c:if>>??????</option>
		    		<option value="mem_nick" <c:if test="${search == 'mem_nick'}">selected="selected"</c:if>>?????????</option>
	    	</select>
	    	<input type="text" id="keyword" name="keyword" placeholder="??????" value="${keyword}"> 
	    	<button class="btn signup" type="button" onclick="adminSearch()">??????</button>
    	</div>
	</div>
	<div id="trailerlist_paging" >
			<c:if test="${page <=1 }">
				[??????]&nbsp;
			</c:if>

			<c:if test="${page > 1 }">
				<a href=
				"boardManagement?page=${page-1}&cate_num=${cate_num}&board_yn=${board_yn}&search=${search}&keyword=${keyword}">[??????]</a>&nbsp;
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href=
					"boardManagement?page=${a}&cate_num=${cate_num}&board_yn=${board_yn}&search=${search}&keyword=${keyword}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				[??????] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href=
				"boardManagement?page=${page+1}&cate_num=${cate_num}&board_yn=${board_yn}&search=${search}&keyword=${keyword}">[??????]</a>
			</c:if>
		</div>	
	
	
</div>
</div>
	<%@ include file="../layout/row.jsp" %>	
	</div>
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>