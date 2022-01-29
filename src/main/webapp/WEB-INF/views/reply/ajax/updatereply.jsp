<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!DOCTYPE html>
<c:choose>
		<c:when test="${reply.re_yn == 'n'}">
				<td colspan="4">
					삭제된 댓글입니다.
				</td>
		</c:when>
		<c:otherwise>
				<td width="50px">
					<c:choose>
						<c:when test="${reply.mem_img != null }">
							<img src="<%=request.getContextPath()%>/resources/images/memberimage/${reply.mem_img}" height="50" width="50">
						</c:when>
						<c:otherwise>
							<img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="50" width="50">
						</c:otherwise>
					</c:choose>
				</td>
				<td width="15%">
					<c:if test="${board.mem_num == reply.mem_num}">
						작성자
					</c:if>
						${reply.mem_nick}<br>
					<fmt:formatDate value="${reply.re_date}" pattern="YYYY-DD-MM HH:mm:ss"/> 
				</td>
				<td>
					<pre>${reply.re_cont}</pre>
				</td>
				<td width="8%">
						<button type="button" onclick="replyUpdateForm(${reply.re_num})">수정</button> <br>
						<button type="button" onclick="deleteReply(${replylist.re_num})">삭제</button>
				</td>
		</c:otherwise>
	</c:choose>