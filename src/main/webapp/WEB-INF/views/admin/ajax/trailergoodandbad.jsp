<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="goodandbad">
	<button  onclick="good()">추천 : ${board.board_good} </button>
	<button  onclick="bad()">비추 : ${board.board_bad}</button>
</div>