<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
   <meta charset="UTF-8">
   <title>내가 좋아요한 글</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/tab.jsp" %>  
<div class="row">
  <div class="leftcolumn" align="center">
   <!-- 게시판 리스트 -->
   <div>
      <h2 class="bbslist_title">내가 좋아요한 글</h2>
      <div id="bbslist_c" style="float:right;">글 개수 : ${listcount}</div>
      

      <table id="bbslist_t">
         <tr align="center" valign="middle" bordercolor="#333333">
            <th style="font-family: Tahoma; font-size: 11pt;" width="8%"
               height="26">
               <div align="center">글번호</div>
            </th>
            
            <th style="font-family: Tahoma; font-size: 11pt;" width="47%">
               <div align="center">제목</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="14%">
               <div align="center">작성자</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="12%">
               <div align="center">날짜</div>
            </th>
            <th style="font-family: Tahoma; font-size: 11pt;" width="10%">
               <div align="center">조회수</div>
            </th>
         </tr>

         <!-- 화면 출력 번호  변수 정의 -->      
         <c:set var="num" value="${listcount-(page-1)*10}"/>    
   
         <!-- 반복문 시작 -->
         <c:forEach var="mygoodlist" items="${mygoodlist}">
         
         <tr align="center" valign="middle">
            <td height="23" style="font-family: Tahoma; font-size: 10pt;">               
                <!-- 번호 출력 부분 -->   
               ${mygoodlist.board_num}
               <c:set var="num" value="${num-1}"/>    
            </td>

            <td style="font-family: Tahoma; font-size: 10pt;">
               <div align="left">                     
                  
               <!-- 제목 출력 부분 -->   
               <a href="review_cont?board_num=${mygoodlist.board_num}&page=${page}">
                     ${mygoodlist.board_title}
               </a>
               </div>
            </td>
            <td style="font-family: Tahoma; font-size: 10pt;">
               <div align="center">                     
                     ${mygoodlist.mem_nick}
               </a>
               </div>
            </td>
            <td style="font-family: Tahoma; font-size: 10pt;">
               <div align="center">
               <fmt:formatDate value="${mygoodlist.board_date}"
                   pattern="yyyy-MM-dd HH:mm:ss"/>               
               
               </div>
            </td>
            <td style="font-family: Tahoma; font-size: 10pt;">
               <div align="center">${mygoodlist.board_count}</div>
            </td>
         </tr>
         
         </c:forEach>
         <!-- 반복문 끝 -->         
      </table>
      

      <div id="bbslist_paging">         
         <c:if test="${page <= 1 }">
            [이전]&nbsp;
         </c:if>
         
         <c:if test="${page > 1 }">
            <a href="myGoodList?page=${page-1}">[이전]</a>&nbsp;
         </c:if>         

         <c:forEach var="a" begin="${startpage}" end="${endpage}">
            <c:if test="${a == page }">
               [${a}]
            </c:if>
            <c:if test="${a != page }">
               <a href="myGoodList?page=${a}">[${a}]</a>&nbsp;
            </c:if>
         </c:forEach>         
         
         <c:if test="${page >= maxpage }">
            [다음] 
         </c:if>
         <c:if test="${page < maxpage }">
            <a href="myGoodList?page=${page+1}">[다음]</a>
         </c:if>         
         
      </div>
      
   </div>
   
   </div>
 <%@ include file="../layout/row.jsp" %>
	</div>
	<%@ include file="../layout/footer.jsp" %>	
</body>
</html>