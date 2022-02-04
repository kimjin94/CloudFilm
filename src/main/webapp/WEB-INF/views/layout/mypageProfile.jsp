<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.profile {
  max-width: 300px;
  text-align: center;
  font-family: arial;
  max-height: 300px; 
  display: inline;
}


.title {
  color: grey;
  font-size: 18px;
}


</style>
</head>
<body>
<form>
<div class="profile" style="float:left; padding-left:20px;">
  <c:choose>
     <c:when test="${mem_img != null }">
        <img src="<%=request.getContextPath()%>/resources/images/memberimage/${mem_img}" height="100" width="100">
     </c:when>
     <c:otherwise>
       <img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="100" width="100">
     </c:otherwise>
  </c:choose>
  <c:choose>
     <c:when test="${mem_img != null }">
        <div style="float:right;"><h5>닉네임${mem_nick}</h5><br><h6>가입날짜 | ${mem_date}</h6></div>

     </c:when>
     <c:otherwise>
        <div style="float:right;"><h3>닉네임${mem_nick}</h3><br><h6>가입날짜 | ${mem_date}</h6></div>
     </c:otherwise>
  </c:choose>
</div>
<br>
<br>
<br>
<br>
  <div style="float:right; padding-right:35px;">
  <button type="button" class="btn signup" onclick="location.href='passReCheck'">수정</button>

  <button type="button" class="btn det" onclick="location.href='member_delete'">탈퇴</button>
  </div>
 </form>


</body>
</html>