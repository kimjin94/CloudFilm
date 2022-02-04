<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>추천게시판 원문내용</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/board/goodandbad.js"></script>
</head>

<script>
function del(page,board_num){
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='recommend_delete?page='+ page + '&board_num='+board_num;
	}
}
</script>

<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %>  
	<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
		<h2>추천게시판 원문내용</h2>
		<form>
		<input type="hidden" id = "board_num" name="board_num" value="${re.board_num}"/>
		<input type="hidden" name="page" value="${page}"/>
		<table id="bbslist_t" border="1">
			<tr>
				<td  colspan="100" style="text-align:center; font-size:24px;"><h4>[${re.board_filter}] ${re.board_title}</h4></td>
			</tr>
			<tr>
				<td style="text-align:left;">
				<c:choose>
                  <c:when test="${mem.mem_img != null }">
                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/${mem.mem_img}" height="50" width="50">
                  </c:when>
                  <c:otherwise>
                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="50" width="50">
                  </c:otherwise>
               </c:choose>
				${re.mem_id}
				[${re.board_date}]				
				<div style="float:right;">조회수 : ${re.board_count}</div>
				</td>
			</tr>
			<tr>
				<td colspan="1000" style="text-align: left; font-size:16px;">
				 <c:if test="${empty re.board_img}">
      				${re.board_cont}
       				</c:if>
       				<c:if test="${!empty re.board_img}">
					<img src="<%=request.getContextPath() %>/resources/images/recommendimage/${re.board_img}" height="100" width="100" />
       				${re.board_cont}
       				</c:if>
				</td>
			</tr>
		</table>
					<c:choose>
						<%-- 비회원인경우 --%>
						<c:when test="${mem_num == 0 }">
							<div id="goodandbad">
								<button class="btn regood" onclick="login()" >추천 : ${re.board_good} </button>
								<button class="btn rebad" onclick="login()" >비추 : ${re.board_bad}</button>
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
			</form>
			
			<div style="float:right; padding-right:35px;">
				<button class="btn signup" type="button" onClick="location='recommend_update?board_num=${re.board_num}&page=${page}'">수정</button>
				<button class="btn signup" type="button" onClick="del(${page},${re.board_num})">삭제</button>
				<button class="btn signup" type="button" onClick="location='recommend_list?page=${page}'">목록</button>
			</div>
			<br>
			<br>
			<form action="replywrite" method="post">
			<table id="bbslist_t" border=1>
				<%@ include file="../reply/replylist.jsp" %>
				<tr>
					<td colspan="4">
						<div id ="replyarea">
							<input type="hidden" name="mem_num" value="${mem_num}">
							<input type="hidden" name="board_num" value="${re.board_num}">
							<input type="hidden" name="page" value="${page}"> 
							<textarea id="re_cont" name="re_cont" rows="5" cols="100" style="text-align:center; width:100%;"></textarea>
							<button class="btn signup" type="submit">댓글 등록</button>
						</div>
					</td>
				</tr>
			</table>
		</form> 	
	</div>
</div>
	<%@ include file="../layout/row.jsp" %>	
	</div>
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>