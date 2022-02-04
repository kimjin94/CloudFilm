<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/tab.jsp" %>  
<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
     <h4 align="left">최신영화</h4>
     <%@ include file="../layout/slideshow.jsp" %>  
<h4 align="left">리뷰</h4>
   <table id="bbslist_t">
         <tr align="center" valign="middle" bordercolor="#333333">
            <th style="font-family: Tahoma; font-size: 11pt;" width="9%"
               height="26">
               <div align="center">필터</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="42%">
               <div align="center">제목</div>   
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="14%">
               <div align="center">작성자</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="12%">
               <div align="center">날짜</div>
            </th>
         </tr>
         <c:forEach var="reviewlist" items="${reviewlist}">
            <tr>
               <td>
                  ${reviewlist.board_filter}
               </td>
               <td style="text-align: left;">
               <a href="review_cont?board_num=${reviewlist.board_num}&page=${page}">
                  <span style="float:left;">${reviewlist.board_title}</span></a>
                  <span style="float:right;">| <i class="fas fa-eye"></i> : ${reviewlist.board_count} |<i class="fas fa-thumbs-up"></i>: ${reviewlist.board_good} |</span>
            
               </td>
               <td>
                  ${reviewlist.mem_nick}
               </td>
               <td>
                  <fmt:formatDate value="${reviewlist.board_date}" pattern="yyyy/MM/dd HH:mm:ss" />
               </td>
            </tr>
         </c:forEach>
   </table>      
   
   <h4 align="left">추천</h4>
   <table id="bbslist_t">
         <tr align="center" valign="middle" bordercolor="#333333">
            <th style="font-family: Tahoma; font-size: 11pt;" width="9%"
               height="26">
               <div align="center">필터</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="42%">
               <div align="center">제목</div>   
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="14%">
               <div align="center">작성자</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="12%">
               <div align="center">날짜</div>
            </th>
         </tr>
         
            <c:forEach var="recommendlist" items="${recommendlist}">
            <tr>
               <td>
                  ${recommendlist.board_filter}
               </td>
               <td style="text-align: left;">
                  <a href="recommend_cont?board_num=${recommendlist.board_num}&page=${page}">
                  <span style="float:left;">${recommendlist.board_title}</span></a>
                  <span style="float:right;">|<i class="fas fa-eye"></i> : ${recommendlist.board_count} | <i class="fas fa-thumbs-up"></i> : ${recommendlist.board_good} | </span>
                  
               </td>
               <td>
                  ${recommendlist.mem_nick}
               </td>
               <td>
                  <fmt:formatDate value="${recommendlist.board_date}" pattern="yyyy/MM/dd HH:mm:ss" />
               </td>
            </tr>
         </c:forEach>
   </table>      
   <h4 align="left">예고편</h4>
   <table id="bbslist_t">
         <tr align="center" valign="middle" bordercolor="#333333">
            <th style="font-family: Tahoma; font-size: 11pt;" width="9%"
               height="26">
               <div align="center">필터</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="42%">
               <div align="center">제목</div>   
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="14%">
               <div align="center">작성자</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="12%">
               <div align="center">날짜</div>
            </th>
         </tr>
            <c:forEach var="trailerlist" items="${trailerlist}">
            <tr>
               <td>
                  ${trailerlist.board_filter}
               </td>
               <td style="text-align: left;">
                   <a href="trailerDetail?board_num=${trailerlist.board_num}&page=${page}">
                  <span style="float:left;">${trailerlist.board_title}  </span> </a>
                  <span style="float:right;">| <i class="fas fa-eye"></i>: ${trailerlist.board_count} | <i class="fas fa-thumbs-up"></i>: ${trailerlist.board_good} | </span>
               </td>
               <td>
                  ${trailerlist.mem_nick}
               </td>
               <td>
                  <fmt:formatDate value="${trailerlist.board_date}" pattern="yyyy/MM/dd HH:mm:ss" />
               </td>
            </tr>
         </c:forEach>
   </table>      
</div>
</div>
   <%@ include file="../layout/row.jsp" %>   
   </div>
<%@ include file="../layout/footer.jsp" %>   
</body>
</html>