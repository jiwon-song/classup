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
						<h1 class="mt-4"> 전체 출결 관리</h1>
					</c:if>
					<c:if test = '${class_id !=0}' >
						<h1 class="mt-4"> ${class_name } 출결 관리</h1>
					</c:if>

				<form action="check_list.ha" method="post">
						<table class="table table-borderless w-75">
							<tr>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">클래스명</span>
										<select class="form-select" id="inputGroupSelect01"  name="class_id" >
											<c:forEach items="${list}" var="list">
												<option	 <c:if test = "${list.class_id eq class_id}">selected </c:if> value="${list.class_id}">${list.class_name}
												</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">출석날짜</span>
										<input type="text" name="checkin_date"  id="datepicker" class="form-control" 
										aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${checkin_date}">
									</div>
								</td>
								<td class="col-4">
									<button type="submit" class="btn col-10 hong_btn_blue">출석 확인</button>
								</td>

							</tr>
							</table>
					</form>




					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> ${fn:substring(checkin_date,0,10)} 출결 목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="hong_vam text-decoration-none text-reset hongtable"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>학생명</th>
										<th>반이름</th>
										<th>전화번호</th>
										<th>입실시간</th>
										<th>퇴실시간</th>
										
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${check_list}" var="check">
									<tr  class="hong_vam">
<%--								<tr data-test='${test.test_id}'>  <!-- form 이 아니라 자바 스크립트로 데이터 보내줄 때 이렇게 데이터 넣어줌 --> --%>
										<td>${check.student_name}</a></td>
										<td>${check.class_name}</td> 
										<td>${check.parent_phone}</td>
										<td>
											<c:if test='${check.checkin_hour == null}'>
												미입실
											</c:if>
											<c:if test='${check.checkin_hour != null}'>
												${check.checkin_hour}
											</c:if>
										</td>
										<td>
											<c:if test='${check.checkout_hour == null}'>
												미퇴실
											</c:if>
											<c:if test='${check.checkout_hour != null}'>
											${check.checkout_hour}
											</c:if>
										</td>
									
									</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main> <!--  여기까지가 콘텐츠 -->
			
			
	<%@include file="../include/footer4.jsp" %>
		
	</div>
	

</body>
</html>