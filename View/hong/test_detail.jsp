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
				
					
					<form action="test_detail_insert.ho" method="post">
				 		<input type="hidden" name='class_id' value='${class_id}' />
						<table class="table table-borderless w-25">
							<tr>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">테스트명</span>
										<select class="form-select" id="inputGroupSelect01" onchange="window.open(value,'_self');">
											<c:forEach items="${test_list}" var="list">
												<option	 <c:if test = "${list.test_id eq test_id}">selected </c:if>  value="test_id.ho?test_id=${list.test_id}">${list.test_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>

							</tr>

						</table>
					</form>




					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 테스트명 : ${test_name }
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="hong_vam hongtable"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>학생이름</th>
										<th class="col-3">반이름</th>
										<th class="col-3">테스트명</th>
										<th class="col-2">점수</th>
										<th class="col-1">응시여부</th>
										<th class='col-2'>점수 수정 </th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${test_detail_list}" var="t">
									<tr  class="hong_vam hongtable">
										<td><a class="text-decoration-none text-reset" href="student_detail.so?dis=1&class_name=${t.class_name}&student_id=${t.student_id}&class_id=${t.class_id}">${t.student_name}</a></td>
										<td>${t.class_name}</td>
										<td>${t.test_name}</td> 
										<td>${t.test_score}</td>
										<td>
											<c:if test='${t.test_score != 0}'>제출</c:if> 
											<c:if test='${t.test_score == 0}'>미제출</c:if> 										
										</td>
										<td>
											<form class="col-12 d-inline-block" action="test_detail_modify.ho" method="post">
												
												<input type="hidden" name='student_id' value='${t.student_id}' />
												<input type="hidden" name='test_id' value='${test_id}' />
												<input type="hidden" name='dis' value='3' />
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