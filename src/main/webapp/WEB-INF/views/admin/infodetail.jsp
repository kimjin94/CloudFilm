<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/board/goodandbad.js"></script>
<script type="text/javascript">

function check(){
	if($.trim($("#re_cont").val())==""){
		alert("댓글 내용을 입력해 주세요.");
		$("#re_cont").val("").focus();
		return false;
	}
}

function del(page,board_num){
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='infoDelete?page='+page+'&board_num='+board_num;
	}
}
</script>

<style type="text/css">
#boarddate{
	float : right;
}

#goodandbad{
	text-align:center;
}

table{
	width: 900px;
}

td, th{
	padding-left : 5px;
	padding-right : 5px;
}
th{
	text-align: left;
}

#goodbutton, #badbutton{
	float:center;
	align-content: center;
}
#replyarea{
	height: 80px;
}

#re_cont{
	resize: none;
}
#replywritebtn{
	height : 78px;
	weidth : 78px;
	margin: 0 auto;
}
</style>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/adminheader.jsp" %>
<%@ include file="../layout/tab.jsp" %>  
<div class="row">
  	  <div class="leftcolumn" align="center">
	  	  <div>
			<input type="hidden" id="board_num" name="board_num" value="${board.board_num }">
			<table border=1>
			<h2>공지</h2>
				<tr>
					<td width="100">${board.board_filter}</td>
					<th>${board.board_title}</th>
				</tr>
				<tr>
					<td colspan="2">
						<c:choose>
		                  <c:when test="${board.mem_img != null }">
		                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/${board.mem_img}" height="20" width="20">
		                  </c:when>
		                  <c:otherwise>
		                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="20" width="20">
		                  </c:otherwise>
		               </c:choose>
	               		${board.mem_nick} | 조회수 : ${board.board_count} |
						<a id=boarddate><fmt:formatDate value="${board.board_date}" pattern="yyyy/MM/dd HH:mm:ss" /></a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
	 					${board_cont}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:choose>
							<%-- 비회원인경우 --%>
							<c:when test="${mem_num == 0 }">
								<div id="goodandbad">
									<button  onclick="login()" >추천 : ${board.board_good} </button>
									<button  onclick="login()" >비추 : ${board.board_bad}</button>
								</div>
							</c:when>
							<%-- 회원이면서, 추천, 비추천 아무것도 안누른경우 --%>
							<c:when test="${mem_num != 0 && checkTrailerGood == 0 && checkTrailerBad == 0}">
								<div id="goodandbad">
									<%@ include file="./ajax/trailergoodandbad.jsp" %>
								</div>
							</c:when>
							<%-- 회원이면서, 추천  누른경우 --%>
							<c:when test="${mem_num != 0 && checkTrailerGood != 0 && checkTrailerBad == 0 }">
								<div id="goodandbad">
									<%@ include file="./ajax/trailergood.jsp" %>
								</div>
							</c:when>
							<%-- 회원이면서, 비추 누른경우 --%>
							<c:when test="${mem_num != 0 && checkTrailerGood == 0 && checkTrailerBad != 0 }">
								<div id="goodandbad">
									<%@ include file="./ajax/trailerbad.jsp" %>
								</div>
							</c:when>
						</c:choose>
						<script type="text/javascript">
							
						</script>
					</td>
				</tr>
				<c:if test="${mem_num == 1}">
				<tr>
					<td colspan="2">
						<div id="goodandbad">
							<button onclick="location.href='infoUpdateForm?page=${page}&board_num=${board.board_num}'">수정 </button>
							<button onclick=del(${page},${board.board_num})>삭제</button>
						</div>
					</td>
				</tr>
				</c:if>
			</table>
			
			<form action="replywrite" method="post">
				<table border=1> 
					<%@ include file="../reply/replylist.jsp" %>
					<tr>
						<td colspan="4">
							<div id ="replyarea">
								<input type="hidden" name="mem_num" value="${mem_num}">
								<input type="hidden" name="board_num" value="${board.board_num}">
								<input type="hidden" name="page" value="${page}"> 
								<textarea id="re_cont" name="re_cont" rows="5" cols="100"></textarea>
								<button type="submit">댓글 등록</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
			</div>
		<%@ include file="../layout/row.jsp" %>	
	</div>
</div>
	
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>