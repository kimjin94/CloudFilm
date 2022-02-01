<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
테스트 페이지
	-----리뷰게시판-----<br><br>
	<a href="review_write">리뷰게시판 작성</a> <br>
	<a href="review_list">리뷰게시판 목록</a> <br>
	<a href="review_searchlist">리뷰 검색목록</a> <br>
	<a href="review_cont">리뷰게시판 원글내용</a> <br>
	<a href="review_update">리뷰게시판 원글 수정</a> <br>
	<a href="review_delete">리뷰게시판 원글 삭제</a> <br>
	<br><br>
	-----추천게시판-----<br><br>
	<a href="recommend_write">추천게시판 작성</a> <br>
	<a href="recommend_list">추천게시판 목록</a> <br>
	<a href="recommend_searchlist">추천 검색목록</a> <br>
	<a href="recommend_cont">추천게시판 원글내용</a> <br>
	<a href="recommend_update">추천게시판 원글 수정</a> <br>
	<a href="recommend_delete">추천게시판 원글 삭제</a> <br>
	<br><br>
	-----멤버-----<br><br>
	<a href="member_join">회원가입</a>
	<a href="member_login">로그인</a><br>
	<a href="passReCheck">비밀번호 재확인</a><br>
	<a href="member_update">회원정보 수정</a><br>
	<a href="member_idFind">아이디찾기</a><br>
	<a href="member_passFind">비밀번호찾기</a><br>
	<a href="member_delete">탈퇴</a><br><br>
	-----마이페이지------<br><br>
	<a href="myWritingList">내가 쓴 글</a><br>
	<a href="myReplyList">내가 쓴 댓글</a><br>
	<a href="myGoodList">내가 좋아요한 글</a><br>
	<a href="myPage">마이페이지 메인</a><br><br>
	
	------관리자-----<br>
	<a href="test">테스트</a> 			<br>
	<a href="trailerlist">예고편 게시판</a>	<br>
	<a href="adminsession">로그인</a>					<br>
	<c:if test="${member != null }">
		${member.mem_id } 님 안녕하세요
	</c:if>
</body>
</html>