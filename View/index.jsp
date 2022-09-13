<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="include/head.jsp" %>

<body class="sb-nav-fixed">

	<!-- 여기가 헤더부분 -->
	<%@ include file="include/header.jsp" %>


	<div id="layoutSidenav">
	
		<!--  사이드 메뉴부분 include 함 -->
 		<%@ include file="include/sidemenu.jsp"  %>
	

		<!--  여기부터 콘텐츠 부분 -->
		<div id="layoutSidenav_content" class="bgb">
			<div class="slide">
				<p style="width:300px" >${loginInfo.teacher_name} 님 </p>
			</div>
			<div class="slide2">
				<p style="width:300px"> 환영합니다!!</p>
			</div>
								
				
			<!--  여기까지가 콘텐츠 -->
			
			 <div class="rgyPostIt">오늘의 일정
			 	<c:if test='${teacher_schedule == "no" }'><p>일정없음</p></c:if>
		 		<c:if test='${teacher_schedule != "no"}'>
					<c:forEach items="${teacher_schedule}" var="sc">
					 	<p>${sc.schedule}</p>
					 </c:forEach>
			 	</c:if>
			 	<a href="cal.jh">일정보러 가기</a>
			 
			 </div>
			<img id= "bp" src="img/bg-board.jpg" alt="교실배경" />
			<div class="video-wrap">
				<iframe id="video" style="opacity:0" autoplay src="https://www.youtube.com/embed/zp789sRyQKg?autoplay=1&mute=1&controls=0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>

		
			
			
		</div>

			<%@include file="include/footer2.jsp" %>
		
	


</body>
</html>
