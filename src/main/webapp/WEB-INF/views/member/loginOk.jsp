<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:if test = "${result == 1 }">
	<script>
		alert("등록되지 않은 회원 입니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("로그인 정보가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 3 }">
	<script>
		alert("탈퇴 또는 정지된 회원입니다. \n관리자에게 문의하시기 바랍니다. ");
		history.go(-1);
	</script>
</c:if>