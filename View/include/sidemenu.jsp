<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<!--  사이드바 -->	
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						
						<a class="nav-link" href="<c:url value='/main'/>">
							<div class="sb-nav-link-icon">
								<i class="fs-5 fa-brands fa-fort-awesome"></i>
							</div> 메인화면
						</a>
												
						<div class="sb-sidenav-menu-heading">
							<hr>
							클래스 / 학생 관리
						</div>
														<!-- 클릭시 색변함 -->
						<a class="nav-link collapsed" <c:if test='${red eq 1}'> style="color:#0d6efd; font-weight: bolder;" </c:if> href="class_list.so">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>  	
								클래스 관리
						</a> 				<!-- 학생관리에서 클래스 누를때 화살표 아래방향 유지 -->
						<a class="nav-link <c:if test='${dis ne 1}'>collapsed</c:if>"  href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts1" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fs-6 fa-solid fa-graduation-cap"></i>
							</div> 학생 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<!-- 눌러서 열리고 눌러서 닫히게 -->
						<div class="collapse <c:if test='${dis eq 1}'>show</c:if>" id="collapseLayouts1"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<c:forEach items="${list}" var="vo">
											<!-- 클릭시 색변함 -->
									<a <c:if test="${vo.class_id eq class_id}">style='color:#0d6efd; font-weight: bolder;'</c:if> class="nav-link" href="student_list.so?class_id=${vo.class_id}&dis=1&class_name=${vo.class_name}">${vo.class_name}</a> 
								</c:forEach>
								<!--  여기에 반복문 써서 처리 -->
							</nav>
						</div>
						
						<div class="sb-sidenav-menu-heading">
							<hr>
							과제 / 테스트 관리
						</div>
						<a class="nav-link <c:if test='${dis ne 2}'>collapsed</c:if>" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts2" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fs-6 fa-solid fa-book-open-reader"></i>
							</div> 과제 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse <c:if test='${dis eq 2}'>show</c:if>" id="collapseLayouts2"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav"  style="cursor:pointer;">
								<a class="nav-link" onclick="homework(0, 2, '')">전체보기</a> 
<!-- 								<a class="nav-link" href="homework_list.ha?class_id=0&dis=2">전체보기</a>  -->
								<c:forEach items="${list}" var="vo">
<%-- 									<a class="nav-link" <c:if test="${vo.class_id eq class_id}">style='color:#0d6efd; font-weight: bolder;'</c:if> href="homework_list.ha?class_id=${vo.class_id}&dis=2&class_name=${vo.class_name}">${vo.class_name}</a>  --%>
									<a class="nav-link"<c:if test="${vo.class_id eq class_id}">style='color:#0d6efd; font-weight: bolder;'</c:if>  onclick="homework(${vo.class_id}, 2, '${vo.class_name}' )" >${vo.class_name}</a> 
								</c:forEach>
								<!--  여기에 반복문 써서 처리 -->
							</nav>
						</div>
						<a class="nav-link <c:if test='${dis ne 3}'>collapsed</c:if>" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts3" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fs-6 fa-regular fa-pen-to-square"></i>
							</div> 테스트 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse <c:if test='${dis eq 3}'>show</c:if>" id="collapseLayouts3"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav" style="cursor:pointer;">
								<a class="nav-link" onclick="test(0, 3, '')">전체보기</a> 
								<!-- <a class="nav-link" href="test_list.ho?class_id=0&dis=3">전체보기</a>  -->
								<c:forEach items="${list}" var="vo">
									<a class="nav-link" <c:if test="${vo.class_id eq class_id}">style='color:#0d6efd; font-weight: bolder;'</c:if> onclick="test(${vo.class_id}, 3, '${vo.class_name}')">${vo.class_name}</a> 
<%-- 									<a class="nav-link" <c:if test="${vo.class_id eq class_id}">style='color:#0d6efd; font-weight: bolder;'</c:if> href="test_list.ho?class_id=${vo.class_id}&class_name=${vo.class_name}&dis=3">${vo.class_name}</a>  --%>
								</c:forEach>
								<!--  여기에 반복문 써서 처리 -->
							</nav>
						</div>
						<script>
						function homework(id, dis, name){
							window.localStorage.setItem("cur", 1);
							window.localStorage.setItem("perPage", 10);
							location.href="homework_list.ha?class_id="+id+"&dis="+dis+ (name=="" ? "" : "&class_name="+name) ;
						}
						function test(id, dis, name){
							window.localStorage.setItem("cur", 1);
							window.localStorage.setItem("perPage", 10);
							location.href="test_list.ho?class_id="+id+"&dis="+dis+(name==""?"" : "&class_name="+name);
						}
						</script>
						
						<div class="sb-sidenav-menu-heading">
							<hr>
							학생 출석 / 선생님 스케줄 관리
						</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts4" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fs-6 fa-regular fa-calendar-check"></i>
							</div> 학생 출석 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>

						</a> 
						<div class="collapse <c:if test='${dis eq 4}'>show</c:if>" id="collapseLayouts4"	
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<c:forEach items="${list}" var="vo">
									<a <c:if test="${vo.class_id eq class_id}">style='color:#0d6efd; font-weight: bolder;'</c:if> class="nav-link"  href="check_list.ha?class_id=${vo.class_id}&class_name=${vo.class_name}&dis=4">${vo.class_name}</a> 
								</c:forEach>
								<!--  여기에 반복문 써서 처리 -->
							</nav>
						</div>
						
						<a class="nav-link collapsed" href="cal.jh">
							<div class="sb-nav-link-icon">
								<i class="fs-6 fa-solid fa-calendar-days"></i>
							</div> 선생님 스케줄
						</a> 
						
						
						
						<div class="sb-sidenav-menu-heading">
							<hr>
							출결카드 관리
						</div>
						
						<a class="nav-link collapsed mb-5" href="iotReg">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 카드 등록 / 기록 확인
						</a> 
						
					
					</div>
				</div>

			</nav>
		</div>  <!--  여기까지 사이드바 -->