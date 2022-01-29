<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result == 2}">
	<script>
		alert("등록되지 않는 이름 입니다.");
		history.go(-1);
	</script>
</c:if>   

<c:if test="${result == 3}">
	<script>
		alert("등록되지 않은 번호입니다.");
		history.go(-1);
	</script>
</c:if>  
