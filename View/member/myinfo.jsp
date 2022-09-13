<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/head.jsp" %>
<style type="text/css">
/* 화면 너비 0 ~ 1200px */
@media (max-width: 1220px){
    aside {width: 40%;}
    section {width: 60%;}
    article {width: 100%; height: 300px;}
}
/* 화면 너비 0 ~ 768px */
@media (max-width: 768px){
    aside {width: 100%; height: 300px;}
    section {width: 100%; height: 300px;}
}
/* 화면 너비 0 ~ 480px */
@media (max-width: 480px){
    header {height: 300px;}
    aside {height: 200px;}
    section {height: 200px;}
}
html { 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
h3{
	text-align: center;
    margin: 10px 0 30px;
    font-weight: bold;
    font-size: 37px;
}
.content{ 
	margin-top: 30px;
    width: 480px;
    height: 780px;
    background: #e9e9e9;
    border-radius: 20px;
    display: flex;
    flex-direction: column;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    opacity: 0.9;
}
.info {
	margin: 40px 100px;
}
form{
	font-size: 16px;
	font-weight: bold;
}

input {
	width: 280px;
    height: 30px;
    padding: 27px 10px;
    font-size: 15px;
    border: 0px solid #AB92BF;
    margin: 10px auto;
    border-radius: 13px;
}
input:focus {
	outline: 2px solid #AB92BF;
}
button.btn-empty {
    background-color: #fff;
    color: #9892e8;	
}
button.btn-fill-s{
	padding: 3px 10px;
	border:1px solid #c4dafc;
	border-radius:3px;
	background-color: #cdcbe8;
    color: #3367d6;
	font-size:13px;
	font-weight:bold;
	box-shadow: 2px 2px 3px #a7a7a7;
}
button.btn-fill {
    background-color: #9892e8;
    color: #f6f6f6;
}
.btnSet { margin-top:30px; margin-bottom:30px; text-align: center;}
button.btn-fill, button.btn-empty {
    height: 50px;
    padding: 10px 15px;
    border: 0px solid #9593b1;
    border-radius: 3px;
    box-shadow: 2px 2px 3px #a7a7a7;
    margin: 0 10px;
    width: 115px;
    display: inline-block;
    text-align: center;
    line-height: 28px;
    font-size: 24px;
    font-weight: bold;
}
.fsize{
	font-size: 18px;
}
</style>
<body class="sb-nav-fixed">

	<!-- 여기가 헤더부분 -->
	<%@ include file="../include/header.jsp" %>

	<h2>정보 수정페이지</h2>
	
	<div class="content">
		<div class="info">
		<h3>내 정보/수정</h3>
		<form action="changeInfo" method="post">
		<div class="fsize">
			아이디(변경불가)<br><input type="text" name="teacher_id" value="${vo.teacher_id}" readonly><br/>
			비밀번호<br><input type="password" name="pw" value="${vo.teacher_pw}"><br/>
			이름<br><input autofocus="autofocus" type="text" name="teacher_name" value="${vo.teacher_name}"><br/>
			이메일<br><input type="text" name="email" value="${vo.email}"><br/>
			전화번호<br><input type="text" name="teacher_phone" maxlength="13" value="${vo.teacher_phone}">
			<br>		
		</div>
			<div class='btnSet'>
				<button class='btn-fill' type='submit'>수정</button>
				<button class='btn-empty' onclick='history.go(-1)'>취소</button>
			</div>
		</form>
		</div>	
	</div>
	


<!--  여기까지 콘텐트 + 푸터 부분 -->

<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<!-- 템플릿 js -->
<script src="js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="/js/demo/chart-area-demo.js"></script>
<script src="/js/demo/chart-bar-demo.js"></script>

<!-- 표 / 페이징 관련 js -->
<script src="js/simple-datatables.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>



<script>
		
	 // 다크모드 버튼 (흰배경+검정배경)
	 let $darkModeBtn = document.querySelector('.darkmode');
	 let bgsclass = document.querySelector('.bg-sclass');
	 let body = document.querySelector('body');
	 let content = document.querySelector('.content');
	 let moon = document.querySelector('.moon');
	 let dark = 'on'; //불값을 저장하여 온오프기능 구현	
	 let play = false;
	 if(window.localStorage.getItem("darkmode") != null){
		 dark = window.localStorage.getItem("darkmode");
	 }  
	 
	 
	  if( dark == 'off' ){
	        
          body.setAttribute('style', 'background:#3d3d3d');
          content.setAttribute('style', 'background:#767676');
          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-dark');
          moon.setAttribute('class', 'darkmoon');
          document.getElementById("moon").src="img/whitemoon.png";
        } else {
          body.setAttribute('style', 'background:#fafafa');
          content.setAttribute('style', 'background:#e9e9e9');
          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-sclass');
          moon.setAttribute('class', '');
          document.getElementById("moon").src="img/darkmoon.png";
        }
       
		// 다크모드
	    $darkModeBtn.addEventListener('click', () => {
	    	if(dark == 'on'){
	    		dark='off';
	    	}else{
	    		dark = 'on';
	    	}
	    	
	      	window.localStorage.setItem("darkmode",dark);
			

	        if( dark == 'off' ){
	        	body.setAttribute('style', 'background:#3d3d3d');
	        	content.setAttribute('style', 'background:#767676');
	          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-dark');
	          moon.setAttribute('class', 'darkmoon');
	          document.getElementById("moon").src="img/whitemoon.png";
	        }
	        else {
	          body.setAttribute('style', 'background:#fafafa');
	          content.setAttribute('style', 'background:#e9e9e9');
	          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-sclass');
	          moon.setAttribute('class', '');
	          document.getElementById("moon").src="img/darkmoon.png";
	        }
	      });
	
		

	
	</script>

</body>
</html>