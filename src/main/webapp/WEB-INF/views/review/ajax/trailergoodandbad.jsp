<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="goodandbad">
	<button class="btn regood" onclick="good()">추천 : ${re.board_good} </button>
	<button class="btn rebad" onclick="bad()">비추 : ${re.board_bad}</button>
</div>