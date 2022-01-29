<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<c:if test="${result == 1}">
	<script>
		alert("회원님이 쓰신 글이 아닙니다.");
		history.go(-1);
	</script>
</c:if>   