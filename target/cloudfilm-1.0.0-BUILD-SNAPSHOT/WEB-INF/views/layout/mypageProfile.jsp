<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.profile {
  text-align: center;
  font-family: arial;
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
<div class="profile" style="float:left; padding-left:35px;">
  <c:choose>
     <c:when test="${member.mem_img != null }">
        <img src="<%=request.getContextPath()%>/resources/images/memberimage/${member.mem_img}" height="100" width="100">
     </c:when>
     <c:otherwise>
       <img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="100" width="100">
     </c:otherwise>
  </c:choose>
  <div style="float:right; padding-left:20px;">
  <c:choose>
     <c:when test="${member.mem_img != null }">
        <div><h3>${member.mem_nick}</h3><br>
       <h6>가입날짜 | <fmt:formatDate value="${member.mem_date}" pattern="yyyy/MM/dd HH:mm:ss" /></h6></div>
     </c:when>
     <c:otherwise>
        <div><h3>${member.mem_nick}</h3><br>
      <h6>가입날짜 | <fmt:formatDate value="${member.mem_date}" pattern="yyyy/MM/dd HH:mm:ss" /></h6></div>
     </c:otherwise>
  </c:choose>
  </div>
</div>
 </form>
<br>
<br>
<br>
<br>
  <div style="float:right; padding-right:35px;">
  <button type="button" class="btn signup" onclick="location.href='passReCheck'">수정</button>
  <button type="button" class="btn det" onclick="location.href='member_delete'">탈퇴</button>
  </div>


</body>
</html>