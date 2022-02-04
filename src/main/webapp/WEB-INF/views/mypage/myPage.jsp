<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 홈</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>  
<%@ include file="../layout/tab.jsp" %>  

<%-- <div class="container">
  <div class="jumbotron">
  <c:choose>
     <c:when test="${mem.mem_img != null }">
        <img src="<%=request.getContextPath()%>/resources/images/memberimage/${mem.mem_img}" height="100" width="100">
     </c:when>
     <c:otherwise>
        <img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="100" width="100">
     </c:otherwise>
  </c:choose>
    <h1>${mem_nick}</h1>      
    <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
  </div>
</div> --%>
<div class="row">
  <div class="leftcolumn" align="center">
  <h2 style="text-align:center">마이페이지 홈</h2>
<%@ include file="../layout/mypageProfile.jsp" %>	
<div class="container">
<div><%@ include file="../member/member_update.jsp" %></div>	
  
  </div>	
</div> 
<%@ include file="../layout/myPageBar.jsp" %>	
</div>
<%@ include file="../layout/footer.jsp" %>	
 

</body>
</html>