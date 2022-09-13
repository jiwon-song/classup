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
						<h1 class="mt-4"> 전체 테스트 관리</h1>
					</c:if>
					<c:if test = '${class_id !=0}' >
						<h1 class="mt-4"> ${class_name} 테스트 관리</h1>
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
							<i class="fas fa-table me-1"></i> 테스트명 : ${homework_name }
						</div>
						<div class="card-body">
							<form action="homework_detail_update.ha" method="post">
								<table id="datatablesSimple" class="hong_vam">
									<!--  이거때문에 자동 페이징처리? -->
									<thead>
										<tr>
											<th class='col-1'>학생이름</th>
											<th class='col-3'>반이름</th>
											<th>과제명</th>
											<th class='col-1'>점수</th>
											<th class='col-1'>응시여부</th>
											<th class='col-2'>확인 / 취소</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${homework_detail_list}" var="h">
											<tr class="hong_vam">
												<td>${h.student_name}</td>
												<td class="col-2">${h.class_name}</td>
												<td>${h.homework_name}</td>
												<td class="col-1">
													<c:if test="${h.student_id eq student_id }">
													<input class="form-control" type="text" name="homework_score" value="${h.homework_score}"  autofocus="autofocus"/>
													</c:if>	
													<c:if test="${h.student_id ne student_id }">
														${h.homework_score}
													</c:if>
												</td>
												<td><c:if test='${h.homework_score != 0}'>제출</c:if> 
													<c:if test='${h.homework_score == 0}'>미제출</c:if></td>
												<td>
													<c:if test="${h.student_id eq student_id }">
														<input type="hidden" name="student_id" value="${h.student_id}" />
														<input type="hidden" name="homework_id" value="${homework_id}" />
														<button type="submit" class="btn hong_btn_blue col-5">확인</button>
														<div class="col-1 d-inline-block"></div>
														<a class="btn hong_btn_red col-5" onclick="history.go(-1)">취소</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</main> <!--  여기까지가 콘텐츠 -->
			
			
	<%@include file="../include/footer.jsp" %>
		
	</div>

</body>
</html>