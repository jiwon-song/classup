<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/head.jsp"%>

<body class="sb-nav-fixed">

	<!-- 여기가 헤더부분 -->
	<%@ include file="../include/header.jsp"%>


	<div id="layoutSidenav">

		<!--  사이드 메뉴부분 include 함 -->
		<%@ include file="../include/sidemenu.jsp"%>


		<!--  여기부터 콘텐츠 부분 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4 mb-5">${class_name} - ${stu_de.student_name}</h1>
					<h3>학생정보</h3>
					<div class="card mb-5">
						<div class="card-body">
							<table  class="dataTable-table hongtable">
								<!--  이거때문에 자동 페이징처리? --><!-- 깃허브 수정해보려고 걍 쓴 주석 -->
								<thead>
									<tr>
										<th>학생이름</th>
										<th>학생아이디</th>
										<th>학생비밀번호</th>
										<th>학년</th>
										<th>학교</th>
										<th>보호자 전화번호</th>
										<th>학생 전화번호</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td>${stu_de.student_name}</td>
											<td>${stu_de.student_id}</td>
											<td>${stu_de.student_pw}</td>
											<td>${stu_de.grade}</td>
											<td>${stu_de.school_name}</td>
											<td>${stu_de.parent_phone}</td>
											<td>${stu_de.student_phone}</td>
										</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="container-fluid px-4">
					<h3>출결정보</h3>
					<div class="card mb-5">
						<div class="card-body">
							<table id="datatablesSimple2" class="hongtable">
								<!--  이거때문에 자동 페이징처리? --><!-- 깃허브 수정해보려고 걍 쓴 주석 -->
								<thead>
									<tr>
										<th>날짜</th>
										<th>입실시간</th>
										<th>퇴실시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${check_de}" var="check_de">
										<tr>
											<td>${check_de.checkin_date}</td>
											<td>${check_de.checkin_hour}</td>
											<td>${check_de.checkout_hour}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="container-fluid px-4">
					<h3>과제결과</h3>
					<div class="card mb-5">
						<div class="card-body">
							<table id="datatablesSimple3"  class="hongtable">
								<!--  이거때문에 자동 페이징처리? --><!-- 깃허브 수정해보려고 걍 쓴 주석 -->
								<thead>
									<tr>
										<th>과제명</th>
										<th>제출날짜</th>
										<th>제출여부</th>
										<th>점수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${hw_de}" var="hw_de">
										<tr>
											<td>${hw_de.homework_name}</td>
											
											<td>
												<c:if test='${hw_de.homework_score != 0}'>${hw_de.homework_sub_date}</c:if> 
												<c:if test='${hw_de.homework_score == 0}'>-</c:if> 
											</td>
											<td>
												<c:if test='${hw_de.homework_score != 0}'>제출</c:if> 
												<c:if test='${hw_de.homework_score == 0}'>미제출</c:if> 										
											</td>
											<td>${hw_de.homework_score}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="container-fluid px-4">
					<h3>테스트결과</h3>
					<div class="card">
						<div class="card-body">
							<table id="datatablesSimple4"  class="hongtable">
								<!--  이거때문에 자동 페이징처리? --><!-- 깃허브 수정해보려고 걍 쓴 주석 -->
								<thead>
									<tr>
										<th>테스트명</th>
										<th>시행날짜</th>
										<th>응시여부</th>
										<th>점수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${test_de}" var="test_de">
										<tr>
											<td>${test_de.test_name}</td>
											
											<td>
												<c:if test='${test_de.test_score != 0}'>${test_de.test_date}</c:if> 
												<c:if test='${test_de.test_score == 0}'>-</c:if> 
											</td>
											<td>
												<c:if test='${test_de.test_score != 0}'>응시</c:if> 
												<c:if test='${test_de.test_score == 0}'>미응시</c:if> 										
											</td>
											<td>${test_de.test_score}</td>
										</tr>
									</c:forEach>
								</tbody>
								
							</table>
						</div>
					</div>
				</div>
			</main>
			
			<!--  여기까지가 콘텐츠 -->


			<%@include file="../include/footer.jsp"%>

		</div>
</body>
</html>
