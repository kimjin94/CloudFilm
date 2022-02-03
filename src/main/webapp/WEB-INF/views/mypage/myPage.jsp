<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 홈</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %>  
<div class="row">
  <div class="leftcolumn" align="center">
<div class="container">
    <h2>마이페이지 홈</h2>
<%@ include file="../layout/mypageProfile.jsp" %>	
	<h4>사진 알아서 넣으시고요</h4>
  </div>	
</div> 
<%@ include file="../layout/myPageBar.jsp" %>	
</div>
<%@ include file="../layout/footer.jsp" %>	
</body>
</html>