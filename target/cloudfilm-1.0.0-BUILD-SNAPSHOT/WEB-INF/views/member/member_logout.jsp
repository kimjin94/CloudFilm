<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>

<script>
	alert("로그아웃 되었습니다");
	location = "home";

</script>

</body>
</html>

<%-- <%
	//브라우저와 연결된 세션객체 강제 종료
	session.invalidate();

	response.sendRedirect("home.jsp");
%> --%>