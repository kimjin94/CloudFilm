<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial;
  padding: 10px;
  background: #f1f1f1;
  overflow-x : hidden;
}

/* Header/Blog Title */
.header {
  padding: 30px;
  text-align: center;
  background: white;
  
}

.header h1 {
  font-size: 50px;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
  float: left;
  width: 75%;
}

.text-primary{
color: black;
}

.leftbutton{
	text-align: right;
	padding-right: 15px;
}

.cate{
list-style-type: none;
text-align: right;
padding-right: 15px;
}

.cate li{
display: inline;
}

 a{
text-decoration: none;
}

#tboard{
border-right:none;
border-left:none;
}

#tboard tr,th,td{
text-align: center;
border-right:none;
border-left:none;
border-top:none;
border-bottom:none;
}



/* Right column */
.rightcolumn {
  float: left;
  width: 24%;
  background-color: #f1f1f1;
  padding-left: 20px;
  text-align: center;
}

/* 로그인 회원가입 */
.btn {
  border: none;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}

.login {background-color: #f44336;} /* Red */ 
.login:hover {background: #da190b;}

.signup {background-color: #e7e7e7; color: black;} /* Gray */ 
.signup:hover {background: #ddd;}


/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 10px;
}

/* Add a card effect for articles */
.card {
  background-color: white;
  padding: 20px;
  margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* TOPbtn */
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}

/* Footer */
.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
  margin-top: 20px;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
  .leftcolumn, .rightcolumn {   
    width: 100%;
    padding: 0;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .topnav a {
    float: none;
    width: 100%;
  }
}
</style>
</head>
<body>

<div class="header">
  <h1>My Website</h1>
  <p>Resize the browser window to see the effect.</p>
</div>

<div class="topnav">
  <a href="#">홈</a>
  <a href="#">리뷰</a>
  <a href="#">추천</a>
  <a href="#">예고편</a>
  <a href="#">영화월드컵</a>
  <a href="#" style="float:right">Link</a>
</div>

<div class="row">
  <div class="leftcolumn" align="center">
  <div class="container">
    <h2 class="text-primary">게시판 목록</h2>
		<ul class="cate">
			<li><a href="#">전체</a></li>
			<li><a href="#">기쁠때</a></li>
			<li><a href="#">화날때</a></li>
			<li><a href="#">슬플때</a></li>
			<li><a href="#">즐거울때</a></li>
		</ul>
	 <br>
		<table border="1" class="table table-hover" id=tboard>
			<thead>
			<tr>
				<th>번호</th>
				<th>필터</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
			<tr>
				<td>1</td>
				<td>즐거울 때</td>
				<td>21세기 최고의 명작 네이버 평점 11점 대 전설의 명작</td>
				<td>테스트</td>
				<td>2021/01/01</td>
				<td>0</td>
			</tr>
		</table>
	<div class="leftbutton">
	<button>글목록</button>
	<button>글쓰기</button>
	</div>	
    </div>
  </div>
  
  <div class="rightcolumn">
    <div class="card">
<button class="btn login">로그인</button>
<button class="btn signup">회원가입</button>
    </div>
  </div>
</div>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<div class="footer">
  <h2>Footer</h2>
</div>

<!-- top btn -->
<script>
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>



</body>
</html>


