<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
						<h1 class="mt-4"> ${class_name} 과제 관리</h1>
					</c:if>
				
					
					<form action="homework_detail_insert.ha" method="post">
				 		<input type="hidden" name='class_id' value='${class_id}' />
						<table class="table table-borderless w-25">
							<tr>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">테스트명</span>
										<select class="form-select" id="inputGroupSelect01" onchange="window.open(value,'_self');">
											<c:forEach items="${homework_list}" var="list">
												<option	 <c:if test = "${list.homework_id eq homework_id}">selected </c:if>  value="homework_id.ha?homework_id=${list.homework_id}">${list.homework_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>

							</tr>

						</table>
					</form>




					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 과제명 : ${homework_name }
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="hong_vam hongtable"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>학생이름</th>
										<th class='col-3'>반이름</th>
										<th class='col-3'>과제명</th>
										<th class='col-1'>제출날짜</th>
										<th class='col-1'>점수</th>
										<th class='col-1'>응시여부</th>
										<th class='col-2'>점수 수정 </th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${homework_detail_list}" var="h">
									<tr  class="hong_vam">
										<td><a class="text-decoration-none text-reset" href="student_detail.so?dis=1&class_name=${h.class_name}&student_id=${h.student_id}&class_id=${class_id}">${h.student_name}</a></td>
										<td class="col-2">${h.class_name}</td>
										<td>${h.homework_name}</td> 
										<td><c:if test='${h.homework_score != 0}'>
											${fn:substring(h.homework_sub_date,2, 4)}/${fn:substring(h.homework_sub_date,5, 7)}/${fn:substring(h.homework_sub_date,8, 10)}
											</c:if> 
											<c:if test='${h.homework_score == 0}'>미제출</c:if>
										</td> 
										<td>${h.homework_score}</td>
										<td>
											<c:if test='${h.homework_score != 0}'>제출</c:if> 
											<c:if test='${h.homework_score == 0}'>미제출</c:if> 										
										</td>
										<td>
											<form class="col-12 d-inline-block" action="homework_detail_modify.ha" method="post">
												
												<input type="hidden" name='student_id' value='${h.student_id}' />
												<input type="hidden" name='homework_id' value='${homework_id}' />
												<input type="hidden" name='dis' value='2' />
												<button type="submit" class="btn hong_btn_blue col-12">점수 수정</button>
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