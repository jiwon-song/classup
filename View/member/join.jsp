<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<title>CLASS UP: 회원가입</title>
<style>
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
h4{
	text-align: left;
	margin-block-start: 1em;
    margin-block-end: 1em;
    margin: 5px 0;
    color: #616161;
}
.h3{
    margin-top: 40px;
    font-size: 32px;
    color: #616161;
    font-weight: bold;
}
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
}

.join {
    width: 520px;
    height: 720px;
    background: #ced0d2b3;
    border-radius: 20px;
    display: flex;
    align-items: center;
    flex-direction: column;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

p { color: #ff5151; text-align: left;}
.valid, .invalid { font-size:14px; font-weight:bold; } 
.valid { color:#00c321 }
.invalid { color:red }
#delete { position: relative; right: 30px; }
input {
	width: 290px;
    height: 45px;
    padding: 0 10px;
    font-size: 15px;
    border: 0px solid #AB92BF;
}
input:focus {
	outline: 2px solid #AB92BF;
}
a.btn-fill-s {
    margin: 0 10px;
    padding: 13px 24px;
    border-radius: 3px;
    background-color: #b5b1ef;
    color: #f6f6f6;
    font-size: 16px;
    box-shadow: 2px 2px 3px #a7a7a7;
    font-weight: bolder;
}
.btnSet { margin-top:30px; margin-bottom:30px; }
a.btn-empty {
	background-color: #fff;
	color:#9892e8;
}
a {
    cursor: pointer;
}
a.btn-fill, a.btn-empty{
    height: 28px;
    width: 110px;
    padding: 10px 15px;
    border-radius: 3px;
    box-shadow: 2px 2px 3px #a7a7a7;
    margin: 0 10px;
    display: inline-block;
    text-align: center;
    line-height: 28px;
    font-weight: bold;
    font-size: 18px;
}
a.btn-fill {
  	background-color: #9892e8;
    color: #f6f6f6;
}
.input_box {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
    box-sizing: border-box;
    z-index: 10;
}
.rad{
	border-radius: 6px;
	margin: 15px 0 2px;
	font-size: 15px;
}

.idbk{
	width: 160px;
}
.container {
	margin: 5px auto;
}
input::placeholder {
  color: #ddd;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
</head>
<body>
<div class="join">
<div class='h3'>회원가입</div>
<p>* 항목은 필수입력입니다</p>
<form action='join' method='post'>
<div id="container">
		<input type='text' name='teacher_name' class='rad' placeholder="* 성명">
	<div>
		<input type='text' name='teacher_id' class='idbk chk rad' placeholder="* 아이디" >
		<a class='btn-fill-s' onclick='id_check()'>중복확인</a>
		<br>
		<div><span class='valid'>아이디를 입력하세요</span></div>
	</div>
	
	<div>
		<input type='password' name='teacher_pw' class='chk rad' placeholder="* 비밀번호"><br>
		<div><span class='valid'>비밀번호를 입력하세요</span></div>
	</div>
	
	<div>
		<input type='password' name='pw_ck' class='chk rad' placeholder="* 비밀번호 확인"><br>
		<div><span class='valid'>비밀번호를 다시 입력하세요</span></div>
	</div>		
		
	<div>
		<input type='text' name='email' class='rad' placeholder="이메일"><br>
		<div><span class='valid'>이메일을 입력하세요</span></div>
	</div>
	
		<input type='text' name='teacher_phone' maxlength="13" class='rad' placeholder="전화번호">
	
</div>
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick='join()'>회원가입</a>
	<a class='btn-empty' onclick='history.go(-1)'>취소</a>
</div>
</div>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='resources/js/member_check.js?'></script>
<script>
//아이디 중복확인 요청
function id_check(){
	var $id = $('[name=teacher_id]');
	if( $id.hasClass('chked') ) return;  //이미 중복확인했다면 다시 할 필요없음
		
	var data = member.tag_status( $id );
	if( data.code=='invalid' ){
		alert( '아이디 중복확인 불필요!\n' + data.desc );
		$id.focus();
		return;
	}
	
	$.ajax({
		url: 'id_check',
		data: { id: $id.val() },
		success: function( response ){
			$id.addClass('chked');
			//false(사용가능아이디) : true(이미사용중인아이디)
			response = member.id_usable( !response );
			$id.siblings('div').text( response.desc )
					.removeClass().addClass( response.code );
			
		},error: function(req,text){
			alert(text+':'+req.status);
		}
	});
}

$('.chk').keyup(function(e){
	if( $(this).attr('name')=='teacher_id' && e.keyCode==13 ){
		id_check();
	}else{
		//아이디 태그에 뭔가 입력한다면 중복확인했음을 삭제 
		if( $(this).attr('name')=='teacher_id' ) $(this).removeClass('chked')
			
		var status = member.tag_status( $(this) );
		$(this).siblings('div').text( status.desc )
			.removeClass().addClass( status.code );
	}
});

//form태그 submit처리
function join(){
	if( $('[name=teacher_name]').val()=='' ){
		alert('성명을 입력하세요');
		$('[name=teacher_name]').focus();
		return;
	}
	
	//아이디인 경우: 중복확인여부
	if( $('[name=teacher_id]').hasClass('chked') ){
		//중복확인했고 + invalid -> 이미 사용중인 아이디 
		if( $('[name=teacher_id]').siblings('div').hasClass('invalid') ){
			alert( '회원가입 불가\n' + member.id.unusable.desc );
			$('[name=teacher_id]').focus();
			return;
		}
	}else{
		//중복확인하지 않은 경우
		if( ! validate_check( $('[name=teacher_id]') ) ) return;
		else{
			alert( '회원가입 불가\n' + member.id.valid.desc );
			$('[name=teacher_id]').focus();
			return;
		}
	}
	
	//비번, 비번확인, 이메일
	if( ! validate_check( $('[name=teacher_pw]') ) ) return;
	if( ! validate_check( $('[name=pw_ck]') ) ) return;
	if( ! validate_check( $('[name=email]') ) ) return;
	$('form').submit();
}

//각 태그의 상태를 확인
function validate_check(tag){
	var data = member.tag_status( tag );
	if( data.code=='valid' )	return true;
	else {
		alert('회원가입 불가\n' + data.desc);
		tag.focus();
		return false;
	}
}
</script>

</body>
</html>