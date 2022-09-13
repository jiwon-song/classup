<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<title>CLASS UP: 비밀번호 찾기</title>
<style type="text/css">

html { 
	background: url("resources/images/background02.jpg") no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
body {
	device-height:100%;
	device-width:100%;
	margin: 0 auto;
	text-align: center;
}
.h3{
    font-size: 32px;
    color: #616161;
    font-weight: bold;
    margin-top: 0px;
}
ul { 
	list-style-type:none; 
	padding:0;  
	align-items: center; 
}
.center{
	position:absolute;
	left:50%; top:50%;
	transform:translate(-50%, -50%);  
}
input::placeholder {
  color: #ddd;
}
.reset {
	width: 250px;
	margin: 20px auto; 
	border:1px solid #aaa;
	background: #ced0d2b3;
	padding: 30px 50px;
	border-radius: 11px;
}
.chk{
	padding: 0 10px;
}
input:focus {
	outline: 2px solid #AB92BF;
}
.reset input { margin:5px auto; width: 100%; box-sizing: border-box; height: 45px; border-radius: 6px; border:0px}
.reset li:not(:last-child) { margin:10px 0;}
.reset input[type=reset]{
	cursor: pointer;
    background-color: #9892e8;
    color: white;
    font-size: 18px;
    font-weight: bold;
}
.reset input[type=button] {
    background-color: white;
    color: #9892e8;
    border: 0px solid #3367d6;
    cursor: pointer;
    font-size: 18px;
    font-weight: bold;
} 
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src='js/common.js'></script>
</head>
<body>
<div class='center'>
	<a href='<c:url value="/"/>'><img src='img/logo06.png'></a>
	<div class='reset'>
		<p class="h3">비밀번호 재발급</p>
		<form method='post' action='resetPw'>
		<ul style="list-style: none;">
			<li><input type='text' class='chk' name='teacher_id' placeholder="아이디" ></li>
			<li><input type='text' class='chk' name='teacher_name' placeholder="이름"></li>
			<li><input type='text' class='chk' name='email' placeholder="이메일"></li>
			<li><input type='reset' value='다시입력'></li>
			<li><input type='button' value='확인' onclick="if( emptyCheck() ) $('form').submit()"></li>
		</ul>
		</form>
	</div>
</div>
</body>
</html>