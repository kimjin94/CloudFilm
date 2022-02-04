<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>리뷰게시판 원문내용</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/tab.jsp" %>   
	<div class="row">
  <div class="leftcolumn" align="center">
		<h2>리뷰게시판 원문내용</h2>
		<form >
		<input type="hidden" id = "board_num" name="board_num" value="${re.board_num}"/>
		<input type="hidden" name="page" value="${page}"/>
		<table id="bbslist_t" border="1">
			<%-- <div style="float:right;">조회수 : ${re.board_count}</div> --%>
				<tr>
				<td colspan="100" style="text-align:center;"><h4>[${re.board_filter}] ${re.board_title}</h4></td>
				</tr>
			<tr>
				<!-- <th>작성자</th> -->
				<td style="text-align:left;">
				<c:choose>
                  <c:when test="${mem.mem_img != null }">
                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/${mem.mem_img}" height="50" width="50">
                  </c:when>
                  <c:otherwise>
                     <img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="50" width="50">
                  </c:otherwise>
               </c:choose>
				${re.mem_nick}
				
				<span style="float:right;"><i class="fas fa-eye"></i> ${re.board_count}</span>				
				<span style="float:right;"> <i class="fas fa-thumbs-up"></i>${re.board_good}</span>				
				<span style="float:right;"> <i class="fas fa-comments"></i>${re.re_count}&nbsp;</span>		
				<span style="float:right;">[${re.board_date}]&nbsp;&nbsp;</span>		
				</td>
				<!-- <td style="text-align:center; width:18%;">
				</td> -->
				<!-- <th style="text-align:center; width:10%;">작성일</th> -->
				
			</tr>
			
			<tr>
				<td colspan="1000" >
				 <c:if test="${empty re.board_img}">
      				<pre>${re.board_cont}</pre>
       				</c:if>
       				<c:if test="${!empty re.board_img}">
       				
					<img src="<%=request.getContextPath() %>/resources/images/reviewimage/${re.board_img}" height="200" width="200" />
       				<pre>${re.board_cont}</pre>
       				</c:if>
				</td>
			</tr>
		</table>
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
			</form>
			<div style="float:right; padding-right:35px;" >
				<button type="button" onClick="location='review_update?board_num=${re.board_num}&page=${page}'">수정</button>
				<button type="button" onClick="del(${page},${re.board_num})">삭제</button>
				<button type="button" onClick="location='review_list?page=${page}'">목록</button>
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
							<button type="submit">댓글 등록</button>
						</div>
					</td>
				</tr>
			</table>
		</form> 	
	</div>
	<%@ include file="../layout/row.jsp" %>	
	</div>
	
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>