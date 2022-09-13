<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
					<c:if test = '${class_id==0}' >
						<h1 class="mt-4"> 전체 과제 관리</h1>
					</c:if>
					<c:if test = '${class_id !=0}' >
						<h1 class="mt-4"> ${class_name } 과제 관리</h1>
					</c:if>
				
					
					<form <c:if test = '${class_id==0}'> style="visibility:hidden" </c:if> action="homework_insert.ha" method="post" onsubmit="return check()">
				 		<input type="hidden" name='class_id' value='${class_id}' />
						<table class="table table-borderless w-75">
							<tr>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">과제명</span>
										<input  type="text" name="homework_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</td>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">제출날짜</span>
										<input type="text" name="homework_date"  id="datepicker" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</td>
								<td class="col-4">
									<input type="hidden" name="class_name" value='${class_name}'>
									<button type="submit" <c:if test = '${class_id==0}' >disabled </c:if> class="btn col-10 hong_btn_blue">과제 추가</button>
								</td>
							</tr>


						</table>
					</form>




					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 과제 목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="hong_vam hongtable"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>과제명</th>
										<th class='col-3'>반이름</th>
										<th class='col-1'>제출인원</th>
										<th class='col-1'>제출날짜</th>
										<th class='col-1'>최고점</th>
										<th class='col-1'>평균</th>
										<th class='col-2'>수정 / 삭제</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${homework_list}" var="homework">
									<tr  class="hong_vam hongtable">
<%--								<tr data-test='${test.test_id}'>  <!-- form 이 아니라 자바 스크립트로 데이터 보내줄 때 이렇게 데이터 넣어줌 --> --%>
										<td><a href="homework_detail.ha?dis=2&homework_id=${homework.homework_id}&homework_name=${homework.homework_name}&class_name=${class_name}&class_id=${class_id}" class="text-decoration-none text-reset">${homework.homework_name}</a></td>
										<td>${homework.class_name}</td>
										<td>${homework.count} / ${homework.total}</td> 
										<td>${homework.homework_date}</td>
										<td>${homework.max}</td>
										<td>${homework.avg }</td>
										<td>
											<form class="col-6 d-inline-block" action="homework_modify.ha" method="post">
												<input type="hidden" name='class_id' value='${class_id}' />
												<input type="hidden" name='homework_id' value='${homework.homework_id}' />
												<input type="hidden" name='dis' value='${dis}' />
<%-- 												<input type="hidden" name='test_name' value='${test.test_name}' /> --%>
												<input type="hidden" name='class_name' value='${class_name}' />
												<button type="submit" class="btn hong_btn_blue col-10">수정</button>
											</form>
											<form class="col-5 d-inline-block" action="homework_delete.ha" method="post">
												<input type="hidden" name='class_id' value='${class_id}' />
												<input type="hidden" name='homework_id' value='${homework.homework_id}' />
												<input type="hidden" name='class_name' value='${class_name}' />
												<button class="btn hong_btn_red col-12" onclick="if(confirm('${homework.homework_name}를 삭제하시겠습니까?')){type='submit'}else{type='button'} ">삭제</button>
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

</body>
</html>