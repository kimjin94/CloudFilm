<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta>
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
  margin: 0; 
  padding: 0;

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
.topnavi {
 padding-left:18%;	
  position:relative;
  background-color: #333;
  font-size: 24px;
}

/* Style the topnav links */
.topnavi a {
  display: inline-block;
  color: #f2f2f2;
  text-align: center;
  padding: 20px 22px;
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
  background: white;
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
  border: none;
  background-color: inherit;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
}

.cate li a{
text-decoration: none;
}

 a{
text-decoration: none;
}

#tboard{
  border: 1px solid #ddd;
  padding: 8px;
  font-size: 12px;
  text-align: center;
}

#tboard tr,th{
text-align: center;
padding-top: 12px;
  padding-bottom: 12px;
  background-color: #808080;
  color: white;
}



/* Right column */
.rightcolumn {
  float: left;
  width: 24%;
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

.selectall {background-color: #ffffff; color: black;}
.selectall:hover {background: #e7e7e7;}

.good {background-color: #ffffff; color: blue;}
.good:hover {background: #e7e7e7; color: blue;}

.bad {background-color: #ffffff; color: red;}
.bad:hover {background: #e7e7e7; color: red;}


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
#topBtn {
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

#topBtn:hover {
  background-color: #555;
}

#container {
	margin-top : 5px;
    text-align: center;
    width: 600px;
}


#left-box {
    float: left;
}
#center-box {
    margin: 0 auto;
}
#right-box {
    float: right;
}

#trailerlist_paging{
margin-top : 5px;
	text-align: center;
	width : 600px;
}

/* Footer */
.footer {
  text-align: center;
  background: #ddd;
  /* position:relative !important; */
  position:relative; 
  bottom:0;
  width: 100%;
  padding-bottom: 120px;
  bottom:-125px;
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
  .topnavi a {
    float: none;
    width: 100%;
  }
}
</style>
</head>
<body>

<!-- <div class="header">
  <h1>My Website</h1>
  <p>Resize the browser window to see the effect.</p>
</div> -->

<div class="topnavi">
  <a href="boardManagement">게시글관리</a>
  <a href="memberManagement">회원관리</a>
  <a href="infoManagement">공지관리</a>
 <!--  
  <a href="adminhome">어드민홈</a> -->
</div>


  
  


</body>
</html>


