<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/head.jsp" %>
<body>
	<!-- 여기가 헤더부분 -->
	<%@ include file="../include/header.jsp" %>
	<div id="layoutSidenav">
	
		<!--  사이드 메뉴부분 include 함 -->
 		<%@ include file="../include/sidemenu.jsp"  %>
 		
 		<!--  여기에 콘텐츠 넣으면 됨 -->
 		
 			<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4"> 출결 카드 관리</h1>
					
					<form action="check_insert.ho" method="post">
				 		<input type="hidden" name='class_id' value='${class_id}' />
						<table class="table table-borderless w-90">
							<tr>
								<td class="col-3">
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">출결카드 번호</span>
										<div class="reload1 col-8">
											<input readonly type="text" name="checkcard_num" value = "${checkcard_num}" class="form-control reload2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
										</div>
									</div>
								</td>
								<td>
									<div class="input-group input-group-default">
										<div class="input-group mb-3">
											<span class="input-group-text" id="inputGroup-sizing-default">반이름</span>
											<select class="form-select" id="inputGroupSelect01" onchange="window.open(value,'_self');">
												<option value="iotReg?class_idp=0">전체</option>
												<c:forEach items="${list}" var="vo">
													<option	<c:if test = "${class_id == vo.class_id }">selected </c:if>  value="iotReg?class_idp=${vo.class_id}&checkcard_num=${checkcard_num}">${vo.class_name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
								<td class="col-2">
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">학생이름</span>
										<select class="form-select" id="inputGroupSelect01" name="student_id">
											<option value=""></option>
											<c:forEach items="${stu_list}" var="vo">
												<option value="${vo.student_id}">${vo.student_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td class="col-2">
									<button <c:if test = '${checkcard_num == null || checkcard_num eq ""}' >disabled </c:if> type="submit" class="btn col-12 hong_btn_blue">출결 카드 등록</button>
								</td>
								<td class="col-2">
									<a id= "refresh" href="iotReg?checkcard_num=${checkcard_num}" class="btn col-12 hong_btn_red">새로고침</a>
								</td>
							</tr>


						</table>
					</form>



					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 출결 카드 입실/퇴실 현황 &nbsp;&nbsp; <span id="date"></span>
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="hong_vam"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th class="col-2">날짜</th>
										<th class="col-3">반명</th>
										<th class="col-1">학생명</th>
										<th class="col-2">입실 시간</th>
										<th class="col-2">퇴실 시간</th>
										<th class='col-2'>수정 / 삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${check_list}" var="check">
									<tr  class="hong_vam">
										<td>${fn:substring(check.checkin_date,0,2)} 년 
											${fn:substring(check.checkin_date,3,5)} 월
											${fn:substring(check.checkin_date,6,8)} 일
										
										</td>
										<td>${check.class_name}</td>
										<td>${check.student_name}</td> 
										<td>
												${fn:substring(check.checkin_hour, 0, 2)}시
												${fn:substring(check.checkin_hour, 3, 5)}분
												${fn:substring(check.checkin_hour, 6, 8)}초
										</td>
										<td>
											<c:if test ='${check.checkout_hour != null}'>
											${fn:substring(check.checkout_hour, 0, 2)}시
											${fn:substring(check.checkout_hour, 3, 5)}분
											${fn:substring(check.checkout_hour, 6, 8)}초
											</c:if>																	
											<c:if test ='${check.checkout_hour == null}'>
												퇴실 안함
											</c:if>
																				
										</td>
										<td>
											<form class="col-11 d-inline-block" action="checkin_delete.ho" method="post">
												<input type="hidden" name='class_id' value='${class_id}' />
												<input type="hidden" name='checkin_num' value='${check.checkin_num}' />
												<button class="btn hong_btn_red col-12" onclick="if(confirm('삭제하시겠습니까?')){type='submit'}else{type='button'} ">삭제</button>
											</form>
										
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main> <!--  여기까지가 콘텐츠 -->
			
			
	<%@include file="../include/footer.jsp" %>
		
	</div>
	

 <script>
function clock(){
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth() +1;
	let date = today.getDate();
	let hour = today.getHours();
	let min = today.getMinutes();
	let second = today.getSeconds();
	document.getElementById('date').innerHTML = ""+year+"년 "+month+"월 "+date+"일 "+hour+"시 "+min+"분 "+second+"초";
}

function click(){
	document.getElementById('refresh').click();
}
 
 
 setInterval(clock, 1000); // 1초마다 실행
 setInterval(reloadDivArea, 2000); // 10초마다 실행
 
 
 function reloadDivArea() {
	
	$('.reload1').load(location.href+' .reload2');
	$('#datatablesSimple').load(location.href+' #datatablesSimple > *');

	}
 
</script>



</body>
</html>