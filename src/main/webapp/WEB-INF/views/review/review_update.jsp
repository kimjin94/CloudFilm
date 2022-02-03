<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판 글수정</title>
</head>
<body>
	<div>
		<form action="review_updating" method="post" onSubmit="return review_check()" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${re.board_num}">
		<input type="hidden" name="page" value="${page}"/>
			<table border=1>
				<caption>리뷰 수정하기</caption>
				<tr>
					<th>제목</th>
					<td>
					<input type="text" name="board_title" value="${re.board_title}">
					</td>
					<th>추천</th>
					<td>
						<select name="board_filter">
							<option value="추천">추천</option>
							<option value="비추천">비추천</option>
						</select>
						${re.board_filter}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="4">
						<textarea name="board_cont" rows="20" cols="60">${re.board_cont}</textarea>
					</td>
				</tr>
				<tr>
					<th>이미지 첨부</th>
					<td colspan="3">
					<input type="file" id="board_img" name="board_img1">
					현재파일 :
 					<c:choose>
                  <c:when test="${not empty re.board_img}">
                     <img src="<%=request.getContextPath()%>/resources/images/reviewimage/${re.board_img}" height="50" width="50">
                  </c:when>
                  <c:otherwise>
					현재파일이 없습니다.
                  </c:otherwise>
               </c:choose>	
       				</td>
						
				</tr>

				<tr>
					<td colspan="4">
						<button type="submit">수정</button>
						<button type="reset" onclick="history.go(-1)">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>