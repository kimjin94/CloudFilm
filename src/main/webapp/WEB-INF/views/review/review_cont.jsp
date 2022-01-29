<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>리뷰게시판 원문내용</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/board/goodandbad.js"></script>
</head>

<script>
function del(page,board_num){
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='review_delete?page='+ page + '&board_num='+board_num;
	}
}
</script>

<body>
	<div>
		<h2>리뷰게시판 원문내용</h2>
		<form >
		<input type="hidden" id = "board_num" name="board_num" value="${re.board_num}"/>
		<input type="hidden" name="page" value="${page}"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${re.board_title}</td>
				<th>필터</th>
				<td>${re.board_filter }</td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td>
				<c:choose>
                  <c:when test="${mem.mem_img != null }">
                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/${mem.mem_img}" height="50" width="50">
                  </c:when>
                  <c:otherwise>
                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="50" width="50">
                  </c:otherwise>
               </c:choose>
				</td>
				<th >작성자</th>
				<td>
				${re.mem_id}
				</td>
				<th >조회수</th>
				<td>
				${re.board_count}
				</td>
				<th style="text-align:right;">작성일</th>
				<td>
				${re.board_date }				
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				 <c:if test="${empty re.board_img}">
      				${re.board_cont}
       				</c:if>
       				<c:if test="${!empty re.board_img}">
					<img src="<%=request.getContextPath() %>/resources/images/reviewimage/${re.board_img}" height="100" width="100" />
       				${re.board_cont}
       				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:choose>
						<%-- 비회원인경우 --%>
						<c:when test="${mem_num == 0 }">
							<div id="goodandbad">
								<button  onclick="login()" >추천 : ${re.board_good} </button>
								<button  onclick="login()" >비추 : ${re.board_bad}</button>
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
				</td>
			</tr>
		</table>
			</form>
			
			<div>
				<button type="button" onClick="location='review_update?board_num=${re.board_num}&page=${page}'">수정</button>
				<button type="button" onClick="del(${page},${re.board_num})">삭제</button>
				<button type="button" onClick="location='review_list?page=${page}'">목록</button>
			</div>
			
			<form action="replywrite" method="post">
			<table border=1>
				<%@ include file="../reply/replylist.jsp" %>
				<tr>
					<td colspan="4">
						<div id ="replyarea">
							<input type="hidden" name="mem_num" value="${mem_num}">
							<input type="hidden" name="board_num" value="${re.board_num}">
							<input type="hidden" name="page" value="${page}"> 
							<textarea id="re_cont" name="re_cont" rows="5" cols="100"></textarea>
							<button type="submit">댓글 등록</button>
						</div>
					</td>
				</tr>
			</table>
		</form> 	
	</div>

</body>
</html>