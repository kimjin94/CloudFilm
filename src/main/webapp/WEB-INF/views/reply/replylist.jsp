<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>


	
<c:forEach var="replylist" items="${replylist}">
	<c:choose>
		<c:when test="${replylist.re_yn == n}">
			<tr>
				<td>
					삭제된 댓글입니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td width="15%">
					<c:if test="${board.mem_num == replylist.mem_num}">
						작성자
					</c:if>
						${replylist.mem_nick}<br>
					<fmt:formatDate value="${replylist.re_date}" pattern="YYYY-DD-MM HH:mm:ss"/> 
				</td>
				<td>
					<pre>${replylist.re_cont}</pre>
				</td>
				<td width="8%">
					<c:if test="${mem_num == replylist.mem_num}">
						<button>수정</button> <br>
						<button>삭제</button>
					</c:if>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
</c:forEach>

