<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<td colspan="3">
	<textarea id="re_contupdate" name="re_contupdate" rows="5" cols="100">${reply.re_cont}</textarea>
</td>
<td width="8%">
		<button type="button" onclick="updateReply(${reply.re_num})">수정</button> <br>
</td>
