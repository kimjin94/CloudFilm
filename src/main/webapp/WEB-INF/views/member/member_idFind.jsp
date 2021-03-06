<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script>
	function check(){
		if($.trim($("#mem_nick").val())==""){
			alert("닉네임을 확인해주세요.");
			$("#mem_nick").val("").focus();
			return false;
		}
		if($.trim($("#mem_email").val())==""){
			alert("이메일을 확인해주세요.");
			$("#mem_email").val("").focus();
			return false;
		}
	}
</script>
</head>

<body>
<%@ include file="../layout/header.jsp" %>
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
  <div align="center"><br><br><br><br><br><br><br><br>
  <h2>아이디 찾기</h2></div><br>

  
  <form method="post" action="id_find" onSubmit="return check()">
   <table class="table table-bordered table-hover" align="center" >
    <div class="form-group">
    <label for="mem_name">닉네임</label>
      <input type="text" class="form-control" id="mem_nick" name="mem_nick" placeholder="닉네임을 입력해주세요" maxlength="20">
    </div>
    <div class="form-group">
    <label for="mem_email">이메일</label>
      <input type="email" class="form-control" id="mem_email" name="mem_email" placeholder="이메일을 입력해주세요" maxlength="20">
    </div>
    <div class="form-group" style="text-align:right">
      	<a href="member_passFind" > 비밀번호 찾기</a>
    	</div>
    <div class="form-group" align="center">
    <input type="submit" class="btn rebad" value="확인" style="width:100%;">
      </div>
       <div class="form-group" align="center">
    <input type="reset" class="btn signup" onClick="history.go(-1)" value="취소" style="width:100%;">
	  </div>

 	</table>
  </form>
  </div>
  <div class="col-lg-4"></div>
</div> 
	
<%@ include file="../layout/footer.jsp" %>
</body>
</html>