<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:forEach var="replylist" items="${replylist}">
	<c:choose>
		<c:when test="${replylist.re_yn == 'n'}">
			<tr>
				<td colspan="4">
					삭제된 댓글입니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr id="reply${replylist.re_num}">
				<td width="50px">
					<c:choose>
						<c:when test="${replylist.mem_img != null }">
							<img src="<%=request.getContextPath()%>/resources/images/memberimage/${replylist.mem_img}" height="50" width="50">
						</c:when>
						<c:otherwise>
							<img src="<%=request.getContextPath()%>/resources/images/memberimage/defaultimg.jpg" height="50" width="50">
						</c:otherwise>
					</c:choose>
				</td>
				<td width="15%">
					<c:if test="${board.mem_num == replylist.mem_num}">
						작성자
					</c:if>
						${replylist.mem_nick}<br>
					<fmt:formatDate value="${replylist.re_date}" pattern="YYYY-MM-DD HH:mm:ss"/> 
				</td>
				<td style="text-align:left;">
					<pre>${replylist.re_cont}</pre>
				</td>
					<c:if test="${mem_num == replylist.mem_num}">
				<td width="8%">
						<button type="button" class="btn signup" onclick="replyUpdateForm(${replylist.re_num})">수정</button> <br>
						<button type="button" class="btn signup" onclick="deleteReply(${replylist.re_num})">삭제</button>
				</td>
					</c:if>
			</tr>
		</c:otherwise>
	</c:choose>
</c:forEach>
<script>
	/* 댓글 수정하기 폼으로 이동 */
	function replyUpdateForm(re_num) {
		$.ajax({
	   	    url : 'replyUpdateForm', // 요청 할 주소
	   	    type : 'post', // GET, PUT
	   	    dataType : 'text',
	   	    data : {
	   	    	"re_num" : re_num
	   	    },
	   	    success : function(data) {
	   	    	$('#reply'+re_num).html(data);
	   	    }, // 요청 완료 시
	   	    error :function(xhr,status,error){
					console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
					alert(xhr.status);
			}
		})
	}
	/* 댓글 수정 저장 */
	function updateReply(re_num) {
		var re_contupdate = $("#re_contupdate").val();
		if(re_contupdate == ""){
			alert("댓글 내용을 채워주세요.");
			$("#re_contupdate").val("").focus();
			return false;
		}else {
			$.ajax({
		   	    url : 'replyUpdate', // 요청 할 주소
		   	    type : 'post', // GET, PUT
		   	    dataType : 'text',
		   	    data : {
		   	    	"re_num" : re_num,
		   	    	"re_contupdate" : re_contupdate
		   	    },
		   	    success : function(data) {
		   	    	$('#reply'+re_num).html(data);
		   	    }, // 요청 완료 시
		   	    error :function(xhr,status,error){
						console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
						alert(xhr.status);
				}
			})
		}
		
	}
	
	/* 댓글 삭제 */
	function deleteReply(re_num) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			$.ajax({
		   	    url : 'deleteReply', // 요청 할 주소
		   	    type : 'post', // GET, PUT
		   	    dataType : 'text',
		   	    data : {
		   	    	"re_num" : re_num
		   	    },
		   	    success : function(data) {
		   	    	$('#reply'+re_num).html(data);
		   	    }, // 요청 완료 시
		   	    error :function(xhr,status,error){
						console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
						alert(xhr.status);
				}
			})
		}
	}
	
</script>

